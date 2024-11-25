const { Pool } = require('pg')

const dbadmin = (port) => {
  return new Pool({
    user: 'dbadmin',
    host: 'localhost',
    database: 'elibrary',
    password: 'masteradmin',
    port: port,
  })
}

const dbuser = (port) => {
  return new Pool({
    user: 'dbuser',
    host: 'localhost',
    database: 'elibrary',
    password: 'masteruser',
    port: port,
  })
} 

module.exports = {
  dbuser, dbadmin
}
