import { useNavigate } from "react-router-dom";
import {
	Table,
	TableBody,
	TableCell,
	TableContainer,
	TableHead,
	TableRow,
	Paper,
} from "@mui/material";
import { useLibrary } from "../../libraryContext";

export function UserTable() {
	const navigate = useNavigate();
	const { users } = useLibrary();

	if (!users) return <p>Загрузка пользователей...</p>;

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
					{users
						.filter((user) => user.user_name !== sessionStorage.getItem("userName"))
						.map((user) => (
							<TableRow
								key={user.user_id}
								hover
								style={{ cursor: "pointer" }}
								onClick={() => navigate(`/user?id=${user.user_id}`)}
							>
								<TableCell>{user.user_id}</TableCell>
								<TableCell>{user.user_name}</TableCell>
								<TableCell>{new Date(user.registration_date).toLocaleDateString()}</TableCell>
								<TableCell>{user.user_role}</TableCell>
								<TableCell>{user.loans?.length ?? 0}</TableCell>
								<TableCell>{user.wishlist?.length ?? 0}</TableCell>
							</TableRow>
						))}
				</TableBody>
			</Table>
		</TableContainer>
	);
}
