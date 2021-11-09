("use strict");
const response = require("../response");
const models = require("../models");
const utils = require("../utils");
const perf = require("execution-time")();
const puppeteer = require("puppeteer");

exports.execution = async function (req, res) {
  var data = { data: req.body };
  try {
    // LINE WAJIB DIBAWA
    perf.start();
    const require_data = ["puppeteer_id"];
    for (const row of require_data) {
      console.log(row);
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    // LINE WAJIB DIBAWA
    var $query = `
    SELECT * ,a.status AS status
    FROM puppeteer AS a 
    WHERE puppeteer_id='${req.body.puppeteer_id}'`;

    let check = await models.get_query($query);
    let new_data = [];
    let step = {};
    let puppeteer_id = req.body.puppeteer_id;
    if (!check.error && check.total_row > 0) {
      for (const it of check.data) {
        let tmp = it;
        $query = `SELECT * FROM puppeteer_detail WHERE puppeteer_id=${puppeteer_id} ORDER BY step ASC`;
        const check_child = await models.get_query($query);
        tmp.detail = check_child.data;
        step = check_child.data;
        new_data.push(tmp);
      }
      check.data = new_data;
    }
    if (check.total_row == 0) {
      data.error = true;
      data.message = `Id not found!`;
      return response.response(data, res);
    }

    let _header = check.data[0];
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto(_header.puppeteer_url);
    // EXECUTION PUPPETEER
    for (let i = 0; i < step.length; ++i) {
      let it = step[i];
      let delay = it.next_delay ?? 0;
      // Jika Ada URL
      if (it.url) {
        await page.goto(_header.puppeteer_url);
      }
      if (it.type && it.type == "form") {
        await page.type(`${it.command_element}`, `${it.command_text}`);
      } else if (it.type && it.type == "button") {
        page.click(`${it.command_element}`);
      }
      if (it.command_keyboard) {
        await page.keyboard.press(`${it.command_keyboard}`);
      }

      await page.waitForNavigation({ waitUntil: "networkidle0", timeout: 0 });
      await page.screenshot({ path: `assets/${puppeteer_id}_${i + 1}.png` });
      await utils.delay(delay);
    }
    await browser.close();
    // END OF EXECUTION PUPPETEER
    return response.response(check, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};

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
    FROM puppeteer AS a 
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
    let check = await models.get_query($query);
    let new_data = [];
    if (!check.error && check.total_row > 0 && req.query.puppeteer_id) {
      let puppeteer_id = req.query.puppeteer_id;
      for (const it of check.data) {
        let tmp = it;
        $query = `SELECT * FROM puppeteer_detail WHERE puppeteer_id=${puppeteer_id}`;
        const check_child = await models.get_query($query);
        tmp.detail = check_child.data;
        new_data.push(tmp);
      }
      check.data = new_data;
    }
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
    const puppeteer_id = new Date().valueOf();
    req.body.created_by = req.headers.user_id;
    const require_data = ["puppeteer_name", "puppeteer_url", "detail"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    let puppeteer = req.body;
    let puppeteer_detail = req.body.detail;
    delete puppeteer.detail;
    puppeteer.puppeteer_id = puppeteer_id;

    if (
      puppeteer_detail.constructor != Array ||
      puppeteer_detail.length === 0
    ) {
      data.error = true;
      data.message = `Detail must on array!`;
      return response.response(data, res);
    }
    for (let it of puppeteer_detail) {
      // check detail
      let require_detail = ["puppeteer_detail_name", "type"];
      for (const row of require_detail) {
        if (!it[`${row}`]) {
          data.error = true;
          data.message = `Detail ${row} is required!`;
          return response.response(data, res);
        }
      }
    }
    // EXEC QUERY INSERT
    var _header = await models.insert_query({
      data: puppeteer,
      table: "puppeteer",
    });
    for (let it of puppeteer_detail) {
      it.puppeteer_id = puppeteer_id;
      await models.insert_query({
        data: it,
        table: "puppeteer_detail",
      });
    }

    return response.response(_header, res);
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
      "puppeteer_id",
      "puppeteer_name",
      "puppeteer_url",
      "detail",
    ];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    let puppeteer_id = req.body.puppeteer_id;
    let puppeteer = req.body;
    let puppeteer_detail = req.body.detail;
    delete puppeteer.detail;
    if (puppeteer_detail.constructor != Array) {
      data.error = true;
      data.message = `Detail must on array!`;
      return response.response(data, res);
    }

    let body_arr_id = [];
    for (let it of puppeteer_detail) {
      // check detail
      let require_detail = ["puppeteer_id", "puppeteer_detail_name", "type"];
      for (const row of require_detail) {
        if (!it[`${row}`]) {
          data.error = true;
          data.message = `Detail ${row} is required!`;
          return response.response(data, res);
        }
      }
      if (it.puppeteer_detail_id) {
        body_arr_id.push(it.puppeteer_detail_id);
      }
    }

    // prepare
    let $query = `SELECT puppeteer_detail_id FROM puppeteer_detail WHERE puppeteer_id='${puppeteer_id}'`;
    let check = await models.exec_query($query);
    let database_arr_id = [];
    if (!check.error && check.data.length > 0) {
      for (const it of check.data) {
        database_arr_id.push(it.puppeteer_detail_id);
      }
    }
    let deleted_arr_id = database_arr_id.filter(
      (val) => !body_arr_id.includes(val)
    );
    console.log(body_arr_id);
    console.log(database_arr_id);
    console.log(deleted_arr_id);
    // EXEC QUERY UPDATE
    var _header = await models.update_query({
      data: puppeteer,
      table: "puppeteer",
      key: "puppeteer_id",
    });
    for (let it of puppeteer_detail) {
      if (it.puppeteer_detail_id) {
        await models.update_query({
          data: it,
          table: "puppeteer_detail",
          key: "puppeteer_detail_id",
        });
      } else {
        await models.insert_query({
          data: it,
          table: "puppeteer_detail",
        });
      }
    }
    if (deleted_arr_id.length > 0) {
      for (const it of deleted_arr_id) {
        let data = { puppeteer_detail_id: it };
        await models.delete_query({
          data: data,
          table: "puppeteer_detail",
          key: "puppeteer_detail_id",
        });
      }
    }
    return response.response(_header, res);
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

    const require_data = ["puppeteer_id"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    // LINE WAJIB DIBAWA
    // var _detail = await models.delete_query({
    //   data: req.body,
    //   table: "puppeteer_detail",
    //   key: "puppeteer_id",
    // });
    var _header = await models.delete_query({
      data: req.body,
      table: "puppeteer",
      key: "puppeteer_id",
    });
    return response.response(_header, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};
