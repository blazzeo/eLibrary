import pkg from 'pg'
const { Pool } = pkg

export const dbadmin = (port) => {
	return new Pool({
		user: 'admin',
		host: 'localhost',
		database: 'elibrary',
		password: 'admin',
		port: port,
	})
}

export const dbmoder = (port) => {
	return new Pool({
		user: '',
		host: 'localhost',
		database: 'elibrary',
		password: 'admin',
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
