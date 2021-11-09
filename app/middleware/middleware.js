"use strict";
let response = require("../response");
const models = require("../models");
const moment = require("moment");
const dotenv = require("dotenv");
dotenv.config(); //- MYSQL Module

async function check_token(req, res) {
  let request = {
    path: req.originalUrl,
    body: req.body,
  };
  console.log(`req : ${JSON.stringify(request)}`);
  var data = { data: req.body, error: null, message: null };
  try {
    let time_now = moment().format("YMMDHHmmss");
    let token = req.headers["token"];
    if (!token) {
      data.error = true;
      data.status_code = 401;
      data.message = `Authentication failed, token header is required`;
      return response.response(data, res);
    }
    let configuration = await models.get_configuration({});
    if (process.env.DEV_TOKEN == token) {
      req.headers.configuration = configuration;
      req.headers.user_id = 0;
      if (req.method == "PUT") {
        req.body.created_by = '0';
        req.body.created_at = moment().format("YYYY-MM-DD HH:mm:ss");
      } else if (req.method == "POST" || req.method == "DELETE") {
        req.body.updated_by = '0';
        req.body.updated_at = moment().format("YYYY-MM-DD HH:mm:ss");
      }
      return true;
    }
    let $query = `SELECT * FROM user_authentication WHERE token='${token}'`;
    $query = await models.exec_query($query);
    if ($query.error || $query.total == 0) {
      data.status_code = 401;
      data.error = true;
      data.message = `Authentication failed, token header is invalid`;
      return response.response(data, res);
    }
    let expired_token = moment($query.data[0].expired_at).format("YMMDHHmmss");
    if (expired_token < time_now) {
      data.status_code = 401;
      data.error = true;
      data.message = `Authentication failed, token header is expired`;
      return response.response(data, res);
    }

    req.headers.configuration = configuration;
    req.headers.user_id = $query.data[0].user_id;
    if (req.method == "PUT") {
      req.body.created_by = $query.data[0].user_id;
      req.body.created_at = moment().format("YYYY-MM-DD HH:mm:ss");
    } else if (req.method == "POST" || req.method == "DELETE") {
      req.body.updated_by = $query.data[0].user_id;
      req.body.updated_at = moment().format("YYYY-MM-DD HH:mm:ss");
    }
    let _temp = {
      user_id: $query.data[0].user_id,
      expired_at: moment()
        .add(configuration.expired_token, "days")
        .format("YYYY-MM-DD HH:mm:ss"),
      token: token,
    };
    await models.update_query({
      data: _temp,
      key: "token",
      table: "user_authentication",
    });
    return true;
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
}

async function create_log(req, res) {
  var data = { data: req.body, error: null, message: null };
  try {
    let params = {
      user_id: req.headers.user_id,
      path: req.originalUrl,
      type: req.method,
      data: JSON.stringify(req.body),
      ip_address: req.headers["x-forwarded-for"] || req.socket.remoteAddress,
      user_agent: req.get("User-Agent"),
      created_at: moment().format("YYYY-MM-DD HH:mm:ss"),
    };
    if (process.env.DEV_TOKEN != req.headers.token) {
      await models.insert_query({ data: params, table: "audit_log" });
    }
    return true;
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
}

module.exports = {
  check_token,
  create_log,
};
