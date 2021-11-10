"use strict";
const response = require("../response");
const models = require("../models");
const perf = require("execution-time")();
const fs = require("fs");

exports.get = async function (req, res) {
  var data = { data: req.query };
  try {
    // LINE WAJIB DIBAWA
    perf.start();

    const require_data = [];
    for (const row of require_data) {
      if (!req.query[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    // LINE WAJIB DIBAWA
    var $query = `
    SELECT * ,a.status AS status
    FROM puppeteer_detail AS a
    WHERE 1+1=2 `;
    for (const k in req.query) {
      if (k != "page" && k != "limit") {
        $query += ` AND a.${k}='${req.query[k]}'`;
      }
    }
    if (req.query.page || req.query.limit) {
      var start = 0;
      if (req.query.page > 1) {
        start = parseInt((req.query.page - 1) * req.query.limit);
      }
      var end = parseInt(start) + parseInt(req.query.limit);
      $query += ` LIMIT ${start},${end} `;
    }
    $query += ` ORDER BY step ASC`;
    const check = await models.get_query($query);
    let newData = [];
    for (const it of check.data) {
      let tmp = it;
      tmp.screenshoot = null;
      if (fs.existsSync(`./screenshoot/${it.puppeteer_id}_${it.step}.png`)) {
        tmp.screenshoot = `${it.puppeteer_id}_${it.step}.png`;
      }

      if (req.query.puppeteer_detail_id && tmp.screenshoot) {
        tmp.screenshoot = fs.readFileSync(
          `./screenshoot/${it.puppeteer_id}_${it.step}.png`,
          {
            encoding: "base64",
          }
        );
      }
      newData.push(tmp);
    }
    check.data = newData;
    return response.response(check, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};

exports.insert = async function (req, res) {
  var data = { data: req.body };
  try {
    perf.start();

    req.body.created_by = req.headers.user_id;
    const require_data = [
      "puppeteer_detail_name",
      "type",
      "puppeteer_id",
      "element_name",
    ];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    var _res = await models.insert_query({
      data: req.body,
      table: "puppeteer_detail",
    });
    return response.response(_res, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};

exports.update = async function (req, res) {
  var data = { data: req.body };
  try {
    perf.start();

    const require_data = [
      "puppeteer_detail_id",
      "puppeteer_id",
      "puppeteer_detail_name",
      "type",
      "element_name",
    ];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }

    var _res = await models.update_query({
      data: req.body,
      table: "puppeteer_detail",
      key: "puppeteer_detail_id",
    });
    return response.response(_res, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};

exports.delete = async function (req, res) {
  var data = { data: req.body };
  try {
    perf.start();

    const require_data = ["puppeteer_detail_id"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    // LINE WAJIB DIBAWA
    var _res = await models.delete_query({
      data: req.body,
      table: "puppeteer_detail",
      key: "puppeteer_detail_id",
    });
    return response.response(_res, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};
