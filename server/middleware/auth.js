import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();

const saltRounds = 12;
const JWT_SECRET = process.env.JWT_SECRET;

if (!JWT_SECRET) {
	throw new Error("JWT_SECRET is not defined in environment variables");
}

// 📌 Хеширование пароля
export async function hashPassword(plainPassword) {
	return bcrypt.hash(plainPassword, saltRounds);
}

// 📌 Проверка пароля
export async function verifyPassword(inputPassword, hashedPassword) {
	return bcrypt.compare(inputPassword, hashedPassword);
}

// 📌 Генерация JWT токена
export function generateToken(payload, expiresIn = '1h') {
	return jwt.sign(payload, JWT_SECRET, { expiresIn });
}

// 📌 Middleware: Проверка JWT токена
export function verifyToken(req, res, next) {
	const authHeader = req.headers['authorization'];

	if (!authHeader?.startsWith('Bearer ')) {
		console.warn("authN: No token provided");
		return res.status(401).json({ error: 'Token required' });
	}

	const token = authHeader.split(' ')[1];

	try {
		const decoded = jwt.verify(token, JWT_SECRET);
		req.user = decoded; // Прокидываем payload в запрос
		next();
	} catch (err) {
		console.error("authN: Invalid token", err.message);
		return res.status(403).json({ error: 'Invalid token' });
	}
}

// 📌 Middleware: Проверка роли пользователя
export function requireRole(roles = []) {
	return (req, res, next) => {
		const userRole = req.user?.role;

		if (!userRole || !roles.includes(userRole)) {
			// console.warn(`authZ: Access denied (${userRole})`);
			return res.status(403).json({ error: "Access denied" });
		}

		next();
	};
}
