import bcrypt from 'bcrypt'

const saltRounds = 12
const JWT_SECRET = process.env.JWT_SECRET || 'island_club';

export async function hash_password(plain_password) {
	const hash = await bcrypt.hash(plain_password, saltRounds)
	return hash
}

export async function verify_password(input_password, hashed_password) {
	const is_match = await bcrypt.compare(input_password, hashed_password)
	return is_match
}

export function verifyToken(req, res, next) {
	const authHeader = req.headers['authorization'];
	if (!authHeader || !authHeader.startsWith('Bearer ')) {
		return res.status(401).json({ error: 'Token required' });
	}

	const token = authHeader.split(' ')[1];
	try {
		const decoded = jwt.verify(token, JWT_SECRET);
		req.user = decoded; // { user_name, role }
		console.log("authenticated")
		next();
	} catch (err) {
		return res.status(403).json({ error: 'Invalid token' });
	}
}

export function requireRole(roles = []) {
	return (req, res, next) => {
		const userRole = req.user?.role;
		if (!userRole || !roles.includes(userRole)) {
			return res.status(403).json({ error: "Access denied" });
		}
		console.log("authorized")
		next();
	};
}
