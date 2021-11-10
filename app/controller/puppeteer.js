("use strict");
const response = require("../response");
const models = require("../models");
const utils = require("../utils");
const perf = require("execution-time")();
const moment = require("moment");

const puppeteer = require("puppeteer-extra");
// Add stealth plugin and use defaults (all tricks to hide puppeteer usage)
const StealthPlugin = require("puppeteer-extra-plugin-stealth");
puppeteer.use(StealthPlugin());
// Add adblocker plugin to block all ads and trackers (saves bandwidth)
const AdblockerPlugin = require("puppeteer-extra-plugin-adblocker");
puppeteer.use(AdblockerPlugin({ blockTrackers: true }));

exports.execution = async function (req, res) {
  let error_step = 0;
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
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    // EXECUTION PUPPETEER
    console.log("======================== START ==========================");
    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto(_header.puppeteer_url, { waitUntil: "networkidle0" });
    await page.screenshot({
      path: `screenshoot/${puppeteer_id}_${0}.png`,
    });
    console.log("step", 0);
    // const cookies = await getCookiesChroome(_header.puppeteer_url);
    // await page.setCookie(...cookies);
    page.setViewport({ width: 1366, height: 768 });
    for (let i = 0; i < step.length; ++i) {
      let it = step[i];
      error_step = it.step;
      console.log("step", it.step);
      let timeout = it.timeout_execution ?? 1000;
      // LOOP IF SET
      let loop = it.looping_execution ?? 1;
      for (let l = 0; l < loop; ++l) {
        let delay = it.delay ?? 0;
        // Jika Ada URL
        await utils.delay(delay);
        if (it.url) {
          await page.goto(_header.puppeteer_url, {
            waitUntil: "networkidle0",
          });
        }
        if (it.element_name) {
          await page.waitForSelector(`${it.element_name}`, {
            visible: true,
            timeout: timeout,
          });
        }
        let now = moment().format("YYYY-MM-DD HH:mm:ss");
        let exec_time = moment(it.execution_time ?? now).format(
          "YYYY-MM-DD HH:mm:ss"
        );
        var delay_duration = moment.duration(exec_time.diff(now));
        if (delay_duration > 0) {
          await utils.delay(delay_duration);
        }
        if (it.type && it.element_name && it.type == "form") {
          await page.type(`${it.element_name}`, `${it.command_text}`);
          if (it.command_keyboard) {
            await page.keyboard.press(`${it.command_keyboard}`);
          }
        } else if (it.type && it.type == "button") {
          page.click(`${it.element_name}`);
        }
        if (it.wait_full_load == "true") {
          await page.waitForNavigation({
            waitUntil: "networkidle2",
            timeout: timeout,
          });
        } else if (it.wait_full_load == "false") {
          await page.waitForNavigation({
            waitUntil: "networkidle0",
            timeout: timeout,
          });
        }
        await page.screenshot({
          path: `screenshoot/${puppeteer_id}_${i + 1}.png`,
        });
      }
    }
    await browser.close();
    // END OF EXECUTION PUPPETEER
    // END OF EXECUTION PUPPETEER
    // END OF EXECUTION PUPPETEER
    // END OF EXECUTION PUPPETEER
    // END OF EXECUTION PUPPETEER
    return response.response(check, res);
  } catch (error) {
    data.error = true;
    data.message = `Have Error On step ${error_step} : ${error}`;
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
    const require_data = ["puppeteer_name", "puppeteer_url"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    let puppeteer = req.body;
    let puppeteer_detail = req.body.detail ?? [];
    delete puppeteer.detail;
    puppeteer.puppeteer_id = puppeteer_id;

    if (puppeteer_detail.constructor != Array) {
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
    const require_data = ["puppeteer_id", "puppeteer_name", "puppeteer_url"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    let puppeteer_id = req.body.puppeteer_id;
    let puppeteer = req.body;
    let puppeteer_detail = req.body.detail ?? [];
    delete puppeteer.detail;
    if (puppeteer_detail.constructor != Array) {
      data.error = true;
      data.message = `Detail must on array!`;
      return response.response(data, res);
    }
    let body_arr_id = [];
    let database_arr_id = [];
    if (puppeteer_detail.length > 0) {
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
      if (!check.error && check.data.length > 0) {
        for (const it of check.data) {
          database_arr_id.push(it.puppeteer_detail_id);
        }
      }
    }
    let deleted_arr_id = database_arr_id.filter(
      (val) => !body_arr_id.includes(val)
    );
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
