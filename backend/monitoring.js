import pkg from 'pg'
import { log } from './server'

const { Client } = pkg

const MASTER = 5432
const REPLICA = 5433

let server_port = MASTER

let connection_failed = 0

function switch_server() {
  if (server_port === MASTER) {
    console.log("Swithing to Replica.")
    log("Swithing to Replica.")
    server_port = REPLICA
  } else {
    console.log("Swithing to Master.")
    log("Swithing to Master.")
    server_port = MASTER
  }
}

async function check_server_health() {
  const client = new Client({
    user: 'dbadmin',
    host: 'localhost', database: 'elibrary',
    password: 'masteradmin',
    port: server_port,
  });

  try {
    await client.connect();
    connection_failed = 0
    await client.end();
  } catch (error) {
    console.error(`Connection failed on port ${server_port}: ${error.message}`)
    log(`Connection failed on port ${server_port}: ${error.message}`)
    connection_failed++
    if (connection_failed === 4)
      process.exit(1)
    console.error(`Switching server...`)
    log(`Switching server...`)
    switch_server()
  }
}

export function server_health() {
  console.log("Checking server health...");
  const loop = setInterval(async () => {
    await check_server_health();
  }, 1000);

  process.on('exit', () => {
    clearInterval(loop);
  });
}

export function get_current_server_port() {
  return server_port;
}

