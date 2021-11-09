"use strict";
const response = require("../response");
const models = require("../models");
const utils = require("../utils");
const perf = require("execution-time")();
const dotenv = require("dotenv");

dotenv.config(); //- MYSQL Module

exports.user_menu = async function (req, res) {
  var data = { data: req.query };
  try {
    perf.start();

    const require_data = ["section_id"];
    for (const row of require_data) {
      if (!req.query[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }

    var $query = `	
	SELECT  * FROM  sys_menu_child AS a 
	LEFT JOIN sys_menu_parent AS b ON a.menu_parent_id =b.menu_parent_id 
  WHERE a.status='1' `;
    // query
    var _menu = await models.exec_query($query);
    // query
    if (_menu.error || _menu.total == 0) {
      return response.response(_menu, res);
    }
    var _new_role = [];

    var nested_menu = await utils.nestedData({
      data: _menu.data,
      unique: "menu_parent_id",
    });

    _new_role.push({
      // Required for template
      _tag: "CSidebarNavItem",
      name: "Dashboard",
      to: `/dashboard`,
    });
    for (const i in nested_menu) {
      var _temp_parent = {};
      var _new_child = [];

      // Required for template
      _temp_parent._tag = "CSidebarNavDropdown";
      _temp_parent.name = nested_menu[i][0].menu_parent_name;
      _temp_parent.route = nested_menu[i][0].menu_parent_url;
      _temp_parent.icon = nested_menu[i][0].menu_parent_icon;
      _temp_parent._children = [];
      // Required for template

      // _temp_parent.menu_parent_id = nested_menu[i][0].menu_parent_id;
      // _temp_parent.menu_parent_name = nested_menu[i][0].menu_parent_name;
      // _temp_parent.menu_parent_url = nested_menu[i][0].menu_parent_url;
      // _temp_parent.menu_parent_icon = nested_menu[i][0].menu_parent_icon;
      if (nested_menu[i].length > 0) {
        for (const row of nested_menu[i]) {
          var _temp_child = {};

          // Required for template
          _temp_child._tag = "CSidebarNavItem";
          _temp_child.name = row.menu_child_name;
          _temp_child.to = `${row.menu_parent_url}${row.menu_child_url}`;
          // Required for template

          _temp_child.menu_role_id = null;
          _temp_child.flag_create = 0;
          _temp_child.flag_read = 0;
          _temp_child.flag_update = 0;
          _temp_child.flag_delete = 0;
          _temp_child.flag_print = 0;
          _temp_child.flag_download = 0;
          var get_role = `
          SELECT * FROM sys_role_section AS a
          LEFT JOIN user_section AS b ON a.section_id=b.section_id
          WHERE a.menu_child_id='${row.menu_child_id}' AND a.section_id='${req.query.section_id}'`;
          get_role = await models.exec_query(get_role);
          if (get_role.total == 1) {
            var role = get_role.data[0];
            _temp_child.menu_role_id = role.menu_role_id;
            _temp_child.flag_create = role.flag_create;
            _temp_child.flag_read = role.flag_read;
            _temp_child.flag_update = role.flag_update;
            _temp_child.flag_delete = role.flag_delete;
            _temp_child.flag_print = role.flag_print;
            _temp_child.flag_download = role.flag_download;
          }

          if (req.query.section_id == `${process.env.DEV_TOKEN}`) {
            _temp_child.flag_create = 1;
            _temp_child.flag_read = 1;
            _temp_child.flag_update = 1;
            _temp_child.flag_delete = 1;
            _temp_child.flag_print = 1;
            _temp_child.flag_download = 1;
          }

          if (
            _temp_child.flag_create != 0 &&
            _temp_child.flag_read != 0 &&
            _temp_child.flag_update != 0 &&
            _temp_child.flag_delete != 0
          ) {
            _new_child.push(_temp_child);
          }
        }
      }
      _temp_parent._children = _new_child;
      if (_new_child.length != 0) {
        _new_role.push(_temp_parent);
      }
    }
    let super_menu = [];
    if (req.query.section_id == `${process.env.DEV_TOKEN}`) {
      super_menu = await utils.super_menu();
    }
    // console.log(_new_role.concat(super_menu));
    // return
    _menu.data = _new_role.concat(super_menu);
    return response.response(_menu, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};
