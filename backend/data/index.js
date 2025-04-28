const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "hackathon",
  password: "he@vyp@ssw0rd",
  port: 5432, // default Postgres port
});

module.exports = pool;
