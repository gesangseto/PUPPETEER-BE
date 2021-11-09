"use strict";
const moment = require("moment");

exports.response = function (data = null, res) {
  var body_res = {
    currentTime: moment().format("Y-MM-D") + " " + moment().format("HH:mm:ss"),
    elapsedTime: data.time || null,
    error: data.error || false,
    message: data.message || null,
    total: data.error ? null : data.total || 0,
    total_row: data.error ? null : data.total_row || 0,
    data: data.error ? [] : data.data || [],
  };
  if (data.status_code) {
    body_res.status_code = data.status_code
  }
  console.log(`res : ${JSON.stringify(body_res)}`);
  res.json(body_res);
  res.end();
};
