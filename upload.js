const fs = require('fs');
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'hopper.proxy.rlwy.net',
  port: 37929,
  user: 'root',
  password: 'ZbqpofRFLRCSzHzkEYLLtjlFmsKQGqmq',
  database: 'railway',
  multipleStatements: true
});

console.log('Reading new_crm.sql...');
const sql = fs.readFileSync('crm_new.sql', 'utf8').replace(/^\uFEFF/, '');

console.log('Uploading to Railway...');
connection.query(sql, (err, results) => {
  if (err) {
    console.error('? Error:', err.message);
  } else {
    console.log('? Success! crm.sql imported successfully.');
  }
  connection.end();
});
