import Client from 'pg'

const MASTER = 5432
const REPLICA = 5433

let server_port = MASTER

function switch_server() {
  if (server_port === MASTER) {
    console.log("Swithing to Replica.")
    server_port = REPLICA
  } else {
    console.log("Swithing to Master.")
    server_port = MASTER
  }
}

function server_health() {
  const loop = setInterval(async () => {
    const client = new Client({
      user: 'dbadmin',
      host: 'localhost',
      database: 'eLibrary_db',
      password: 'masteradmin',
      port: server_port,
    })

    try {
      await client.connect()
      await client.end();
      return server_port
    } catch (error) {
      console.error("master doesn't respond,\nswitching for replica")
      switch_server()

      try {
        client = new Client({
          user: 'dbadmin',
          host: 'localhost',
          database: 'eLibrary_db',
          password: 'masteradmin',
          port: server_port,
        })
        await client.connect()
        await client.end();
        return server_port
      } catch (error) {
        console.error("no server available...");
        clearInterval(loop)
      }
    } 
  }, 2000)
}

module.exports = {
  server_health
}
