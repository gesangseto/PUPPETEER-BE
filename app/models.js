const mysql = require("mysql");
const moment = require("moment");

const dotenv = require("dotenv");
dotenv.config(); //- MYSQL Module

var db_config = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
};

var pool = mysql.createPool(db_config);

async function exec_query(query_sql) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(query_sql, function (err, rows) {
        connection.release();
        if (err) {
          data_set.error = true;
          data_set.message = err.sqlMessage || "Oops, something wrong";
          return resolve(data_set);
        }
        data_set.data = rows;
        data_set.total = rows.length;
        data_set.total_row = rows.length;
        return resolve(data_set);
      });
    })
  );
}

async function get_query(query_sql) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  var _where = query_sql.split("FROM") || query_sql.split("from");
  _where = _where[1].split("LIMIT") || _where[1].split("limit");
  var count = `SELECT COUNT(*) AS total FROM ${_where[0]}`;
  count = await exec_query(count);
  data_set.total = count.data[0].total;
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(query_sql, function (err, rows) {
        connection.release();
        if (err) {
          data_set.error = true;
          data_set.message = err.sqlMessage || "Oops, something wrong";
          return resolve(data_set);
        }
        data_set.data = rows;
        data_set.total_row = rows.length;
        return resolve(data_set);
      });
    })
  );
}

async function get_configuration({ property = null }) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(
        "SELECT * FROM sys_configuration LIMIT 1",
        function (err, rows) {
          connection.release();
          if (err) {
            data_set.error = true;
            data_set.message = err.sqlMessage || "Oops, something wrong";
            return resolve(data_set);
          }
          return resolve(rows[0]);
        }
      );
    })
  );
}

async function insert_query({ data, key, table }) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  var column = `SELECT COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'${table}' AND TABLE_SCHEMA ='${process.env.DB_DATABASE}'`;
  column = await exec_query(column);
  if (column.error) {
    data_set.error = true;
    data_set.message = column.message || "Oops, something wrong";
    return data_set;
  }
  column = column.data;
  var _data = [];
  var key = [];
  var val = [];
  for (const k in data) {
    var it = data[k];
    var isColumAvalaible = false;
    for (const col_name of column) {
      if (k == col_name.COLUMN_NAME) {
        isColumAvalaible = true;
      }
    }
    if (isColumAvalaible) {
      if (it != null) {
        if (moment(it, moment.ISO_8601, true).isValid() && !isInt(it)) {
          it = moment(it).format("YYYY-MM-DD HH:mm:ss");
        }
        key.push(k);
        val.push(it);
      }
    }
  }
  key = key.toString();
  val = "'" + val.join("','") + "'";
  _data = _data.join(",");
  var query_sql = `INSERT INTO ${table} (${key}) VALUES (${val})`;
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(query_sql, function (err, rows) {
        connection.release();
        if (err) {
          data_set.error = true;
          data_set.message = err.sqlMessage || "Oops, something wrong";
          return resolve(data_set);
        }
        data_set.data = rows;
        data_set.total_row = rows.length;
        return resolve(data_set);
      });
    })
  );
}

async function update_query({ data, key, table }) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  var column = `SELECT COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'${table}' AND TABLE_SCHEMA ='${process.env.DB_DATABASE}'`;
  column = await exec_query(column);
  if (column.error) {
    data_set.error = true;
    data_set.message = column.message || "Oops, something wrong";
    return data_set;
  }
  column = column.data;
  var _data = [];
  for (const k in data) {
    var it = data[k];
    var isColumAvalaible = false;
    for (const col_name of column) {
      if (k == col_name.COLUMN_NAME) {
        isColumAvalaible = true;
      }
    }
    if (isColumAvalaible) {
      if (it != null && it != "created_at") {
        if (moment(it, moment.ISO_8601, true).isValid() && !isInt(it)) {
          it = moment(it).format("YYYY-MM-DD HH:mm:ss");
        }
        _data.push(` ${k} = '${it}'`);
      }
    }
  }
  _data = _data.join(",");
  var query_sql = `UPDATE ${table} SET ${_data} WHERE ${key}='${data[key]}'`;
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(query_sql, function (err, rows) {
        connection.release();
        if (err) {
          data_set.error = true;
          data_set.message = err.sqlMessage || "Oops, something wrong";
          return resolve(data_set);
        }
        data_set.data = rows;
        data_set.total_row = rows.length;
        return resolve(data_set);
      });
    })
  );
}

async function delete_query({ data, key, table, deleted = true }) {
  var data_set = {
    error: false,
    data: [],
    total: 0,
    total_row: 0,
    message: "Success",
  };
  var current_data = `SELECT * FROM ${table} WHERE ${key}='${data[key]}' LIMIT 1`;
  current_data = await exec_query(current_data);
  if (current_data.error || current_data.total == 0) {
    data_set.error = true;
    data_set.message = current_data.message || "Oops, something wrong";
    return data_set;
  }
  if (current_data.data[0].status == 1) {
    data_set.error = true;
    data_set.message = "Cannot delete data, must set data to Inactive";
    return data_set;
  }
  let query_sql = ``;
  if (deleted) {
    query_sql = `DELETE FROM ${table} WHERE ${key}='${data[key]}'`;
  } else {
    query_sql = `UPDATE ${table} SET flag_delete='1' WHERE ${key}='${data[key]}'`;
  }
  return await new Promise((resolve) =>
    pool.getConnection(function (err, connection) {
      connection.query(query_sql, function (err, rows) {
        connection.release();
        if (err) {
          data_set.error = true;
          data_set.message = err.sqlMessage || "Oops, something wrong";
          if (err.errno === 1451) {
            data_set.message =
              "Cannot delete data, this data have connection on other transaction";
          }
          return resolve(data_set);
        }
        data_set.data = rows;
        data_set.total_row = rows.length;
        return resolve(data_set);
      });
    })
  );
}

function isInt(value) {
  return (
    !isNaN(value) &&
    (function (x) {
      return (x | 0) === x;
    })(parseFloat(value))
  );
}

module.exports = {
  get_configuration,
  exec_query,
  get_query,
  insert_query,
  update_query,
  delete_query,
};
