import Pool from 'pg'

const db_admin = (port) => {
  return new Pool({
  user: 'dbadmin',
  host: 'localhost',
  database: 'eLibrary_db',
  password: 'masteradmin',
  port: port,
  })
}

const db_user = (port) => {
  new Pool({
    user: 'dbuser',
    host: 'localhost',
    database: 'eLibrary_db',
    password: 'masteruser',
    port: port,
  });
} 

module.exports = {
  db_user, db_admin
}
