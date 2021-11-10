"use strict";
const response = require("../response");
const perf = require("execution-time")();
const moment = require("moment");
const puppeteer = require("puppeteer");
const chrome = require("chrome-cookies-secure");

let errorCode = 200;
let elapseTime = "";
const path = "./screenshoot/shopee";

const delay = (ms) => new Promise((res) => setTimeout(res, ms));

//
async function play_bot(request, res) {
  let now = moment().format("YYYY-MM-DD HH:mm:ss").toString();
  perf.start();
  console.log("date-time :" + new Date());
  console.log("api-name : " + request.originalUrl);
  console.log("body-sent : ");
  console.log(request.body);
  var time_execute = now;
  var body = request.body;
  // let username = request.body.username;
  if (body["time-execute"]) {
    time_execute = moment().format(request.body["time-execute"]).toString();
    if (now > time_execute) {
      elapseTime = perf.stop().time.toFixed(2);
      return response.normalRes(
        401,
        elapseTime,
        "error",
        "time-execute cannot be less than now",
        res
      );
    }
  }
  /*
    prepare browser
    */
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  page.setViewport({ width: 1366, height: 768 });
  const cookies = await getCookiesChroome(body.url.login);
  await page.setCookie(...cookies);
  console.log("======================== START ==========================");
  var _remove_add = await remove_add();
  var _check_login = await check_login();

  // add to cart
  await page.goto(body.url.item, { waitUntil: "networkidle0" });
  var trying = 5;
  var _add_to_cart = "failed";
  for (var x = 0; x < trying; x++) {
    _add_to_cart = await add_to_cart();
    if (_add_to_cart == "success") {
      x = trying;
    }
  }
  // end add to cart
  var _chekout = await checkout();
  var _making_order = await making_order();
  var _paying = await paying();

  console.log("\n======================= END =========================== \n");
  await browser.close();
  elapseTime = perf.stop().time.toFixed(2);
  return response.normalRes(
    errorCode,
    elapseTime,
    "sukses",
    "Silahkan cek console dan screenshoot ",
    res
  );

  async function remove_add() {
    try {
      await page.goto(body.url.login, { waitUntil: "networkidle2" });
      await page.screenshot({ path: path + "/1 Remove Add (Bf).png" });
      await page.click(body.selector.ad);
      await page.screenshot({ path: path + "/2 Remove Add (Af).png" });
      console.log(
        "\nsuccess remove ad: " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "\nfailed remove ad: " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }

  async function check_login() {
    try {
      await page.goto(body.url.login, { waitUntil: "networkidle2" });
      await page.click(body.selector["button-login"]);
      await page.screenshot({ path: path + "/login.png" });
      console.log(
        "\nWARNING!!!, Failed, User not logged in : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "\nUser is already logged in : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }

  async function add_to_cart() {
    try {
      await page.screenshot({ path: path + "/3 Add To Cart (Bf).png" });
      let now = moment().format("YYYY-MM-DD HH:mm:ss").toString();
      var wait_time = moment(time_execute, "YYYY-MM-DD HH:mm:ss").diff(
        moment(now, "YYYY-MM-DD HH:mm:ss")
      );
      console.log("\nprepare at : " + now + " <=======");
      console.log("will be execute at : " + time_execute);
      await delay(parseInt(wait_time));
      console.log(
        "reload : " + moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      await page.reload({ waitUntil: "networkidle2" });
      console.log(
        "finish-reload : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      if (body.selector["button-varian"].length > 0) {
        var x = 0;
        for (const varian of body.selector["button-varian"]) {
          x = x + 1;
          console.log(
            "select varian " +
              x +
              " : " +
              moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
          );
          await page.click(varian);
        }
      }

      await Promise.all([
        page.waitForNavigation({ waitUntil: "networkidle0", timeout: 2000 }),
        page.click(body.selector["button-adToCart"]),
      ]);
      // await page.click(body.selector['button-adToCart']);
      // await page.waitForNavigation({ waitUntil: 'networkidle0' });
      await page.screenshot({ path: path + "/4 Add To Cart (Af).png" });
      console.log(
        "======> success add to cart : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "======> failed add to cart : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }

  async function checkout() {
    try {
      await delay(2000);
      await page.screenshot({ path: path + "/5 Checkout (Bf).png" });
      await Promise.all([
        page.waitForSelector(body.selector["button-checkout"]),
        page.click(body.selector["button-checkout"]),
        page.waitForNavigation({ waitUntil: "networkidle0" }),
      ]);
      await page.screenshot({ path: path + "/6 Checkout (Af).png.png" });
      console.log(
        "\nsuccess checkout : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "\nfailed checkout : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }

  async function making_order() {
    try {
      await autoScroll(page);
      await Promise.all([
        page.waitForSelector(body.selector["button-buy"]),
        page.screenshot({ path: path + "/7 Making Order (Bf).png" }),
        page.click(body.selector["button-buy"]),
        page.waitForNavigation({ waitUntil: "networkidle0" }),
      ]);
      await page.screenshot({ path: path + "/8 Making Order (Af).png" });
      console.log(
        "\nsuccess making order : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "\nfailed making order : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }

  // checkout

  async function paying() {
    try {
      await page.screenshot({ path: path + "/9 Paying (Bf).png" });
      await page.waitForSelector(body.selector["button-pay"]);
      await page.click(body.selector["button-pay"]);
      await page.screenshot({ path: path + "/10 Paying (Af).png" });
      await page.screenshot({ path: path + "/11 Confirmation (Bf).png" });
      var pins = [2, 4, 5, 2, 5, 1];
      for (const pin of pins) {
        try {
          console.log("Typing pin " + pin);
          await delay(1000);
          await page.keyboard.press(pin);
        } catch (e) {
          console.log("WARNING!!!, form-pin not found");
        }
      }
      await page.screenshot({ path: path + "/insert_pin.png" });
      await page.click(body.selector["button-confirmation"]);
      await page.screenshot({ path: path + "/12 Confirmation (Af).png.png" });
      console.log(
        "\nsuccess pay : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "success";
    } catch (e) {
      console.log(
        "\nfailed pay : " +
          moment().format("YYYY-MM-DD HH:mm:ss:SSS").toString()
      );
      return "failed";
    }
  }
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
module.exports = {
  play_bot,
};
