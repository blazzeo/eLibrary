import pkg from 'pg'
const { Pool } = pkg

import dotenv from 'dotenv'
dotenv.config()

export const dbadmin = () => {
	return new Pool({
		user: process.env.ADMIN,
		host: process.env.DATABASE_HOST,
		database: process.env.DATABASE_NAME,
		password: process.env.ADMIN_PASS,
		port: process.env.DATABASE_PORT,
	})
}

export const dbmoder = () => {
	return new Pool({
		user: process.env.MODER,
		host: process.env.DATABASE_HOST,
		database: process.env.DATABASE_NAME,
		password: process.env.MODER_PASS,
		port: process.env.DATABASE_PORT,
	})
}

export const dbuser = () => {
	return new Pool({
		user: process.env.DBUSER,
		host: process.env.DATABASE_HOST,
		database: process.env.DATABASE_NAME,
		password: process.env.DBUSER_PASS,
		port: process.env.DATABASE_PORT,
	})
}
