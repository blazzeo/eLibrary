import pkg from 'pg'
const { Pool } = pkg

export const dbadmin = (port) => {
  return new Pool({
    user: 'dbadmin',
    host: 'localhost',
    database: 'elibrary',
    password: 'masteradmin',
    port: port,
  })
}

export const dbuser = (port) => {
  return new Pool({
    user: 'dbuser',
    host: 'localhost',
    database: 'elibrary',
    password: 'masteruser',
    port: port,
  })
}
