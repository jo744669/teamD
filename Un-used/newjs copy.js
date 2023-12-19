const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

//sql connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'MYsqlpass123*',
  database: 'dbms',
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to SQL: ' + err.stack);
    return;
  }
  console.log('Connected to SQL');
});

app.use(bodyParser.json());

// /insertdata is after the url (can change)
app.post('/insertData', (req, res) => {
  // data
  const { field1, field2, field3 } = req.body;

 //SQL COMMANDS HERE
  const sqlQuery = `INSERT INTO testtable (field1, field2, field3) VALUES (?, ?, ?)`;
  const values = [field1, field2, field3];
});

app.listen(port, () => {
  console.log(`Server connected`);
});
