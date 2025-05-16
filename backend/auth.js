import bcrypt from 'bcrypt'

const saltRounds = 12

export async function hash_password(plain_password) {
	const hash = await bcrypt.hash(plain_password, saltRounds)
	return hash
}

export async function verify_password(input_password, hashed_password) {
	const is_match = await bcrypt.compare(input_password, hashed_password)
	return is_match
}
