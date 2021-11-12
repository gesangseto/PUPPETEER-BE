"use strict";

module.exports = function (app) {
  var login = require("./controller/login");
  app.route("/api/login/user").post(login.user_login);

  var audit_log = require("./controller/audit_log");
  app.route("/api/audit/log").get(audit_log.get);

  var menu = require("./controller/menu");
  app.route("/api/menu/user").get(menu.user_menu);

  var sys_configuration = require("./controller/sys_configuration");
  app.route("/api/configuration").get(sys_configuration.get);
  app.route("/api/configuration").post(sys_configuration.update);

  var sys_menu_parent = require("./controller/sys_menu_parent");
  app.route("/api/menu/parent").get(sys_menu_parent.get);
  app.route("/api/menu/parent").put(sys_menu_parent.insert);
  app.route("/api/menu/parent").post(sys_menu_parent.update);
  app.route("/api/menu/parent").delete(sys_menu_parent.delete);

  var sys_menu_child = require("./controller/sys_menu_child");
  app.route("/api/menu/child").get(sys_menu_child.get);
  app.route("/api/menu/child").put(sys_menu_child.insert);
  app.route("/api/menu/child").post(sys_menu_child.update);
  app.route("/api/menu/child").delete(sys_menu_child.delete);

  var sys_role_section = require("./controller/sys_role_section");
  app.route("/api/role/section").get(sys_role_section.get);
  app.route("/api/role/section").post(sys_role_section.update);

  var user_department = require("./controller/user_department");
  app.route("/api/master/user_department").get(user_department.get);
  app.route("/api/master/user_department").put(user_department.insert);
  app.route("/api/master/user_department").post(user_department.update);
  app.route("/api/master/user_department").delete(user_department.delete);

  var user_section = require("./controller/user_section");
  app.route("/api/master/user_section").get(user_section.get);
  app.route("/api/master/user_section").put(user_section.insert);
  app.route("/api/master/user_section").post(user_section.update);
  app.route("/api/master/user_section").delete(user_section.delete);

  var user = require("./controller/user");
  app.route("/api/master/user").get(user.get);
  app.route("/api/master/user").put(user.insert);
  app.route("/api/master/user").post(user.update);
  app.route("/api/master/user").delete(user.delete);

  // PUPPETEER
  var puppeteer_bot = require("./controller/puppeteer_bot");
  app.route("/api/puppeteer/execution").post(puppeteer_bot.execution);

  var puppeteer = require("./controller/puppeteer");
  app.route("/api/puppeteer").get(puppeteer.get);
  app.route("/api/puppeteer").put(puppeteer.insert);
  app.route("/api/puppeteer").post(puppeteer.update);
  app.route("/api/puppeteer").delete(puppeteer.delete);
  app.route("/api/puppeteer/duplicate").post(puppeteer.duplicate);

  var puppeteer_detail = require("./controller/puppeteer_detail");
  app.route("/api/puppeteer/detail").get(puppeteer_detail.get);
  app.route("/api/puppeteer/detail").put(puppeteer_detail.insert);
  app.route("/api/puppeteer/detail").post(puppeteer_detail.update);
  app.route("/api/puppeteer/detail").delete(puppeteer_detail.delete);
};
