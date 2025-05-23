import jwt from 'jsonwebtoken';

async function test_100k() {

	const secret = 's2h9/MSPaQlWmentijAd5evTBRXtLItaEyQ1ew8/SaM=';
	const payload = { user_id: 15, user_name: 'user2', role: 'user' };

	// Подпись
	const token = jwt.sign(payload, secret, { expiresIn: '1h' });
	console.log('token:', token);

	// Проверка
	try {
		const decoded = jwt.verify(token, secret);
		console.log('decoded:', decoded);
	} catch (e) {
		console.error('Verify error:', e.message);
	}
}

test_100k()
