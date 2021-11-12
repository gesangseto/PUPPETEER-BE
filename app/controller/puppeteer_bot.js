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

const chrome = require("chrome-cookies-secure");

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
    if (_header.use_cookies) {
      const cookies = await getCookiesChroome(_header.puppeteer_url);
      await page.setCookie(...cookies);
    }
    await page.goto(_header.puppeteer_url, { waitUntil: "networkidle0" });
    await page.screenshot({
      path: `screenshoot/${puppeteer_id}_${0}.png`,
    });
    console.log("step", 0);
    page.setViewport({ width: 1920, height: 1920 });
    // page.setViewport({ width: 400, height: 534 });
    for (let i = 0; i < step.length; ++i) {
      let it = step[i];
      error_step = it.step;
      console.log("step", it.step);
      // LOOP IF SET
      let loop = it.looping_execution ?? 1;
      for (let l = 0; l < loop; ++l) {
        if (it.skip_error == "true") {
          try {
            await runningBot(it, page, res);
            l = loop;
          } catch (error) {
            console.log("some error on step: ", it.step);
          }
        } else {
          await runningBot(it, page, res);
        }
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

async function runningBot(it, page, res) {
  let puppeteer_id = it.puppeteer_id;
  let timeout = it.timeout_execution ?? 1000;
  let delay = it.delay ?? 0;
  // Jika Ada URL
  await utils.delay(delay);
  let now = moment().format("YYYY-MM-DD HH:mm:ss");
  let exec_time = moment(it.time_execution).format("YYYY-MM-DD HH:mm:ss");

  var delay_duration = moment(exec_time, "YYYY/MM/DD HH:mm:ss:SSS").diff(
    moment(now, "YYYY/MM/DD HH:mm:ss:SSS")
  );
  if (delay_duration > 0) {
    await utils.delay(delay_duration);
  }
  if (it.url) {
    await page.goto(it.url, {
      waitUntil: "networkidle0",
    });
  }

  await page.screenshot({
    path: `screenshoot/${puppeteer_id}_${it.step}_0.png`,
  });

  if (it.element_name && it.wait_element == "true") {
    console.log("Wait selector: ", it.element_name);
    await page.waitForSelector(`${it.element_name}`, {
      visible: true,
      timeout: timeout,
    });
  }

  console.log("Wait type: ", it.type);
  if (it.type && it.type == "form") {
    if (it.element_name) {
      await page.type(`${it.element_name}`, `${it.command_text}`);
    } else {
      await page.keyboard.type(`${it.command_text}`);
    }
    if (it.command_keyboard) {
      await page.keyboard.press(`${it.command_keyboard}`);
    }
  } else if (it.type && it.type == "button") {
    page.click(`${it.element_name}`);
  }
  console.log("Wait to load: ", it.wait_full_load);
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
  if (it.open_to_browser == "true") {
    let data = {};
    data.error = false;
    data.message = `Link Opened`;
    data.data = [{ url: page.url() }];
    response.response(data, res);
  }
  await page.screenshot({
    path: `screenshoot/${puppeteer_id}_${it.step}.png`,
  });
}

function getCookiesChroome(url) {
  return new Promise(
    (resolve) =>
      chrome.getCookies(url, "puppeteer", function (err, cookies) {
        if (err) {
          console.log(err, "error");
          return;
        }
        // console.log(cookies, 'cookies');
        resolve(cookies);
      }) // e.g. 'Profile 2'
  );
}

async function autoScroll(page) {
  await page.evaluate(async () => {
    await new Promise((resolve, reject) => {
      var totalHeight = 0;
      var distance = 100;
      var timer = setInterval(() => {
        var scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, distance);
        totalHeight += distance;

        if (totalHeight >= scrollHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 100);
    });
  });
}
