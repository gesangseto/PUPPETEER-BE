"use strict";
const response = require("../response");
const models = require("../models");
const utils = require("../utils");
const perf = require("execution-time")();

exports.get = async function (req, res) {
  var data = { data: req.query };
  try {
    // LINE WAJIB DIBAWA
    perf.start();

    const require_data = ["section_id"];
    for (const row of require_data) {
      if (!req.query[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }
    // LINE WAJIB DIBAWA
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

    for (const i in nested_menu) {
      var _temp_parent = {};
      var _new_child = [];
      _temp_parent.menu_parent_id = nested_menu[i][0].menu_parent_id;
      _temp_parent.menu_parent_name = nested_menu[i][0].menu_parent_name;
      _temp_parent.menu_parent_url = nested_menu[i][0].menu_parent_url;
      _temp_parent.menu_parent_icon = nested_menu[i][0].menu_parent_icon;
      if (nested_menu[i].length > 0) {
        for (const row of nested_menu[i]) {
          var _temp_child = {};
          _temp_child.section_id = req.query.section_id;
          _temp_child.menu_child_id = row.menu_child_id;
          _temp_child.menu_child_name = row.menu_child_name;
          _temp_child.menu_child_url = row.menu_child_url;
          _temp_child.menu_child_icon = row.menu_child_icon;
          _temp_child.menu_url = `${row.menu_parent_url}${row.menu_child_url}`;
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
          if (req.query.section_id == "super_admin") {
            _temp_child.flag_create = 1;
            _temp_child.flag_read = 1;
            _temp_child.flag_update = 1;
            _temp_child.flag_delete = 1;
            _temp_child.flag_print = 1;
            _temp_child.flag_download = 1;
          }
          _new_child.push(_temp_child);
        }
      }
      _temp_parent.menu_child = _new_child;
      _new_role.push(_temp_parent);
    }

    _menu.data = _new_role;
    return response.response(_menu, res);
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

    const require_data = ["roles"];
    for (const row of require_data) {
      if (!req.body[`${row}`]) {
        data.error = true;
        data.message = `${row} is required!`;
        return response.response(data, res);
      }
    }

    for (const row of req.body.roles) {
      if (!row.menu_child_id) {
        data.error = true;
        data.message = `menu_child_id is required!`;
        return response.response(data, res);
      }
      if (!row.section_id) {
        data.error = true;
        data.message = `section_id is required!`;
        return response.response(data, res);
      }
    }
    var prepare_query = [];
    for (const row of req.body.roles) {
      if (row.menu_role_id) {
        prepare_query.push(`UPDATE sys_role_section SET
        flag_create='${row.flag_create}',
        flag_read='${row.flag_read}',
        flag_update='${row.flag_update}',
        flag_delete='${row.flag_delete}',
        flag_print='${row.flag_print}',
        flag_download='${row.flag_download}'
        WHERE menu_role_id='${row.menu_role_id}' `);
      } else {
        var check = await models.exec_query(
          `SELECT * FROM sys_role_section WHERE section_id='${row.section_id}' AND menu_child_id='${row.menu_child_id}' LIMIT 1 ;`
        );
        if (check.total > 0) {
          data.error = true;
          data.message = `Duplicate section_id: ${row.section_id} and menu_child_id: ${row.menu_child_id}, or maybe you forgot to set menu_role_id`;
          return response.response(data, res);
        }
        prepare_query.push(` INSERT INTO sys_role_section 
        (section_id,menu_child_id,flag_create,flag_read,flag_update,flag_delete,flag_print,flag_download) 
        VALUES 
        ('${row.section_id}','${row.menu_child_id}','${row.flag_create}','${row.flag_read}','${row.flag_update}','${row.flag_delete}','${row.flag_print}','${row.flag_download}')`);
      }
    }
    if (prepare_query.length > 0) {
      console.log(prepare_query[0]);
      for (const query of prepare_query) {
        var _res = await models.exec_query(query);
      }
      return response.response(_res, res);
    }
    data.error = true;
    data.message = `No data to change`;
    return response.response(data, res);
  } catch (error) {
    data.error = true;
    data.message = `${error}`;
    return response.response(data, res);
  }
};
