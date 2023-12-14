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

//inserting into users table when a new person registers
app.post('/newUser', (req, res) => {
  // data
  const { email, password } = req.body;

 //SQL COMMANDS HERE
  const sqlQuery = `INSERT INTO users (email, password) VALUES (?, ?)`;
  const values = [email, password];

  connection.query(sqlQuery, values, (err, results) => {
    if (err) {
      console.error('Error: ' + err.message);
      res.status(500).json({error: 'Internal Server Error'});
      return;
    }

    res.json({success: true, message: 'Data inserted successfully'});
  });
});

//order all of the food in the cart
app.post('/order', (req, res) => {
    // data
    const { food_name } = req.body;

    //SQL COMMANDS HERE
    const sqlQuery = `INSERT INTO contain (food_name) VALUES (?)`;
    const values = [food_name];

    connection.query(sqlQuery, values, (err, results) => {
        if (err) {
            console.error('Error: ' + err.message);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }

        res.json({ success: true, message: 'Data inserted successfully' });
    });
});

//add a new card
app.post('/addCard', (req, res) => {
    // data
    const { card_number, expiration_date, cvv } = req.body;

    //SQL COMMANDS HERE
    const sqlQuery = `INSERT INTO cards (card_number, expiration_date, cvv) VALUES (?, ?, ?)`;
    const values = [card_number, expiration_date, cvv];

    connection.query(sqlQuery, values, (err, results) => {
        if (err) {
            console.error('Error: ' + err.message);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }

        res.json({ success: true, message: 'Data inserted successfully' });
    });
});

//delete a card
app.post('/deleteCard', (req, res) => {
    // data
    const { card_number } = req.body;

    //SQL COMMANDS HERE
    const sqlQuery = `DELETE FROM cards WHERE card_number=(card_number) VALUES (?)`;
    const values = [card_number];

    connection.query(sqlQuery, values, (err, results) => {
        if (err) {
            console.error('Error: ' + err.message);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }

        res.json({ success: true, message: 'Data inserted successfully' });
    });
});

//get a users past orders
app.get('/getTasks', (req, res) => {
  const userId = req.query.userId;
  const getAllTasksQuery = 'SELECT * FROM tasks WHERE userId = ?';
  
  db.query(getAllTasksQuery, [userId], (err, results) => {
      res.json(results);
  });
});

app.listen(port, () => {
  console.log(`Server connected`);
});
