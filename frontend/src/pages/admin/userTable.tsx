import { useEffect, useState } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button } from '@mui/material';
import { UserData, BookLoan } from '../../components/structs';
import { deleteUser, getLoans, returnBook } from '../../components/api/DatabaseAPI';

interface Props {
	users: UserData[];
	updateUsers: () => void;
}

export function UserTable({ users, updateUsers }: Props) {
	const [bookLoans, setBookLoans] = useState<BookLoan[]>([]);

	const fetchLoans = async () => {
		const loans = await getLoans();
		setBookLoans(loans);
	};

	return (
		<TableContainer component={Paper}>
			<Table>
				<TableHead>
					<TableRow>
						<TableCell>ID</TableCell>
						<TableCell>Имя пользователя</TableCell>
						<TableCell>Дата регистрации</TableCell>
						<TableCell>Роль</TableCell>
						<TableCell>Книг взято</TableCell>
						<TableCell>В желаемом</TableCell>
					</TableRow>
				</TableHead>
				<TableBody>
					{users.filter(user => user.user_name != sessionStorage.getItem('userName')).map((user) => (
						<TableRow key={user.user_id}>
							<TableCell>{user.user_id}</TableCell>
							<TableCell>{user.user_name}</TableCell>
							<TableCell>{user.registration_date?.toString()}</TableCell>
							<TableCell>{user.user_role}</TableCell>
							<TableCell>{user.user_role}</TableCell>
						</TableRow>
					))}
				</TableBody>
			</Table>
		</TableContainer>
	);
};
