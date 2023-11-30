// install mysql driver first


var mysql = require('mysql');
//Creates connection
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "deston02", //Use own password
    database: "mobileorder"
});

// Query the database and display all restaurants
con.connect(function(err) {
    if (err) throw err;
    con.query("SELECT * FROM restaurants", function (err, result, fields) {
        if (err) throw err;
        console.log(result);
    });
});
