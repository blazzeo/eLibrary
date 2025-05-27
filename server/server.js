import express from 'express'
import cors from 'cors'
import { fileURLToPath } from 'url';
import fs from 'fs'
import path from 'path'
import router from './routes/routes.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const PORT = process.env.PORT;
const app = express();

app.use(cors())
app.use(express.json())
app.use('/api', router)

const logFilePath = path.join(__dirname, 'log')
if (fs.existsSync(logFilePath))
	fs.rmSync(logFilePath);

export function log(message) {
	const timestamp = new Date().toISOString();
	const logEntry = `[${timestamp}]\t${message}\n`;

	fs.appendFile(logFilePath, logEntry, (err) => {
		if (err) {
			console.error('Error writing to log file', err);
		}
	});
}

app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));
