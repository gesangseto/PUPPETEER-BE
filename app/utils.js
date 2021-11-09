async function nestedData({ data = [], unique = null }) {
  var reformat_obj = {};
  for (const element of data) {
    if (!reformat_obj[element[unique]]) {
      reformat_obj[element[unique]] = [element];
    } else {
      reformat_obj[element[unique]] =
        reformat_obj[element[unique]].concat(element);
    }
  }
  return reformat_obj;
}

async function encrypt({ string = null }) {
  try {
    const crypto = require("crypto");
    const secret = "Initial-G";
    const encryptedData = crypto
      .createHash("sha256", secret)
      .update(string)
      .digest("hex");
    return encryptedData;
  } catch (error) {
    console.log(error);
    return false;
  }
}

async function delay(milisec) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("");
    }, milisec);
  });
}

async function super_menu() {
  let super_menu = [
    {
      _tag: "CSidebarNavTitle",
      _children: ["SYSTEM AREA"],
    },
    {
      _tag: "CSidebarNavDropdown",
      name: "System",
      route: "/system",
      icon: "",
      _children: [
        {
          _tag: "CSidebarNavItem",
          name: "Configuration",
          to: "/system/configuration",
          flag_create: 1,
          flag_read: 1,
          flag_update: 1,
          flag_print: 1,
          flag_download: 1,
        },
        {
          _tag: "CSidebarNavItem",
          name: "Audit Log",
          to: "/system/audit_log",
          flag_create: 1,
          flag_read: 1,
          flag_update: 1,
          flag_print: 1,
          flag_download: 1,
        },
        {
          _tag: "CSidebarNavItem",
          name: "Menu Parent",
          to: "/system/menu_parent",
          flag_create: 1,
          flag_read: 1,
          flag_update: 1,
          flag_print: 1,
          flag_download: 1,
        },
        {
          _tag: "CSidebarNavItem",
          name: "Menu Child",
          to: "/system/menu_child",
          flag_create: 1,
          flag_read: 1,
          flag_update: 1,
          flag_print: 1,
          flag_download: 1,
        },
      ],
    },
  ];
  return super_menu;
}

module.exports = {
  nestedData,
  encrypt,
  delay,
  super_menu,
};
