const express = require('express');
const session = require('express-session');
const cors = require('cors');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
const secretKey = uuidv4();


const app = express();
const port = 3000;

app.use(session({
  secret: secretKey,
  resave: false,
  saveUninitialized: true,
}));
app.use(bodyParser.json());

// SQL connection
const connection = mysql.createConnection({
  host: 'garrettg.ddns.net',
  user: 'myuser',
  password: 'mypass1',
  database: 'mobileorder',
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to SQL: ' + err.stack);
    return;
  }
  console.log('Connected to SQL');
});

app.use(cors());
app.use(bodyParser.json());

// Insert new user into the 'users' table
app.post('/newUser', (req, res) => {
  // Data
  const { email, password } = req.body;

  // Log incoming data
  console.log('Received registration request:', { email, password });

  // SQL command to insert into 'users' table
  const sqlQuery = `INSERT INTO users (email, password) VALUES (?, ?)`;
  const values = [email, password];

  connection.query(sqlQuery, values, (err, results) => {
    if (err) {
      console.error('Error inserting user:', err.message);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    // Log success message
    console.log('User registered successfully:', { email, password });
    res.json({ success: true, message: 'User registered successfully' });
  });
});
//----------------------------------------------------------------------------
//sign-in
app.post('/signin', (req, res) => {
  const { email, password } = req.body;

  // SQL command to check if the email and password match in the 'users' table
  const sqlQuery = `SELECT * FROM users WHERE email = ? AND password = ?`;
  const values = [email, password];

  connection.query(sqlQuery, values, (err, results) => {
    if (err) {
      console.error('Error: ' + err.message);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    if (results.length > 0) {
      // Store user data in session
      req.session.user = {
        email: results[0].email,
        // Add other user data as needed
      };

      // User found, send success response
      res.json({ success: true, message: 'Sign-in successful' });
    } else {
      // User not found or password doesn't match, send failure response
      res.status(401).json({ error: 'Invalid email or password' });
    }
  });
});
//--------------------------------------------------------------------------
//sign out
// New /signout route
app.post('/signout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error('Error destroying session:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json({ success: true, message: 'Sign-out successful' });
    }
  });
});
//--------------------------------------------------------------------
//placeOrder
// Server-side route to handle order placement
app.post('/placeOrder', (req, res) => {
  console.log(req.body);

  const { email, orderDate, items, order_id } = req.body;

  // Step 1: Insert into orders table
  const insertOrderQuery = 'INSERT INTO orders (order_id, email, order_date) VALUES (?, ?, ?)';
  const orderValues = [order_id, email, new Date(orderDate).toISOString().slice(0, 19).replace('T', ' ')];

  connection.query(insertOrderQuery, orderValues, (err, orderResult) => {
      if (err) {
          console.error('Error inserting order:', err.message);
          res.status(500).json({ error: 'Internal Server Error', details: err.message });
          return;
      }

      // Retrieve the order_id of the newly inserted order
      const orderId = order_id; // Use the order_id from the request

      // Step 2: Insert into contains table for each item in the cart
      const insertContainsQuery = 'INSERT INTO contain (order_id, food_id, quantity, email) VALUES (?, ?, ?, ?)';

      items.forEach(item => {
          const { name, quantity } = item;
          // Retrieve the food_id based on the item name
          const selectFoodIdQuery = 'SELECT food_id FROM foods WHERE name = ?';

          connection.query(selectFoodIdQuery, [name], (err, foodResult) => {
              if (err) {
                  console.error('Error selecting food_id:', err.message);
                  res.status(500).json({ error: 'Internal Server Error' });
                  return;
              }

              const foodId = foodResult[0].food_id;

              // Insert into contains table with the specific order_id
              connection.query(insertContainsQuery, [orderId, foodId, quantity, email], (err) => {
                  if (err) {
                      console.error('Error inserting into contains:', err.message);
                      res.status(500).json({ error: 'Internal Server Error' });
                      return;
                  }
              });
          });
      });

      res.json({ success: true, message: 'Order placed successfully' });
  });
});
//---------------------------------------------------------------------------
//adding a card 
app.post('/addCard', (req, res) => {
  const { email, cardNumber, expirationDate, cvv } = req.body;

  // Validate the input - add more validation as needed

  // SQL command to insert into 'cards' table
  const sqlQuery = 'INSERT INTO cards (email, card_number, expiration_date, cvv) VALUES (?, ?, ?, ?)';
  const values = [email, cardNumber, expirationDate, cvv];

  // Create a new connection
  const connection = mysql.createConnection({
    host: 'garrettg.ddns.net',
    user: 'myuser',
    password: 'mypass1',
    database: 'mobileorder',
  });

  connection.connect((err) => {
    if (err) {
      console.error('Error connecting to SQL: ' + err.stack);
      res.status(500).json({ success: false, error: 'Internal Server Error' });
      return;
    }

    // Execute the SQL query
    connection.query(sqlQuery, values, (err, result) => {
      if (err) {
        console.error('Error adding card:', err.message);
        res.status(500).json({ success: false, error: 'Internal Server Error' });
      } else {
        // Close the connection after the query is executed
        connection.end();
        res.json({ success: true });
      }
    });
  });
});
//--------------------------------------------------------------------------------
//delete card 

// Assuming you're using Express.js
app.post('/deleteCard', (req, res) => {
  const { email, cardNumber } = req.body;

  // Validate the input - add more validation as needed

  // SQL command to delete the card from 'cards' table
  const sqlQuery = 'DELETE FROM cards WHERE email = ? AND card_number = ?';
  const values = [email, cardNumber];

  connection.query(sqlQuery, values, (err, result) => {
    if (err) {
      console.error('Error deleting card:', err.message);
      res.status(500).json({ success: false, error: 'Internal Server Error' });
    } else {
      res.json({ success: true });
    }
  });
});




app.listen(port, () => {
  console.log(`Server connected. Listening on port ${port}`);
});
