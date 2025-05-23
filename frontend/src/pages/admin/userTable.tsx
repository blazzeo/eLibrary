import { useState } from "react";
import { useNavigate } from "react-router-dom";
import {
	Button,
	Table,
	TableBody,
	TableCell,
	TableContainer,
	TableHead,
	TableRow,
	Paper,
	Box,
	TablePagination,
} from "@mui/material";
import { useLibrary } from "../../libraryContext";

export function UserTable() {
	const navigate = useNavigate();
	const { users, user } = useLibrary();

	const [page, setPage] = useState(0);
	const [rowsPerPage, setRowsPerPage] = useState(10);

	if (!users) return <p>Загрузка пользователей...</p>;

	const visibleUsers = users.filter(
		(u) => u.user_name !== user?.user_name
	);
	const paginatedUsers = visibleUsers.slice(
		page * rowsPerPage,
		page * rowsPerPage + rowsPerPage
	);

	const handleChangePage = (event: unknown, newPage: number) => {
		setPage(newPage);
	};

	const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
		setRowsPerPage(parseInt(event.target.value, 10));
		setPage(0);
	};

	return (
		<Box>
			{/* Кнопка по центру */}
			<Box sx={{ display: "flex", justifyContent: "center", my: 3 }}>
				<Button
					variant="contained"
					color="primary"
					onClick={() => navigate("/createmoder")}
					sx={{ textTransform: "none", fontWeight: 500 }}
				>
					Создать модератора
				</Button>
			</Box>

			{/* Заголовок */}
			<Box sx={{ textAlign: "center", mb: 3 }}>
				<h2 style={{ fontSize: "1.8rem", fontWeight: "600", margin: 0 }}>Список пользователей</h2>
			</Box>

			{/* Таблица */}
			<TableContainer component={Paper} sx={{ boxShadow: 3, borderRadius: 2 }}>
				<Table sx={{ minWidth: 650 }}>
					<TableHead>
						<TableRow sx={{ backgroundColor: "#f5f5f5" }}>
							<TableCell sx={{ fontWeight: "bold" }}>ID</TableCell>
							<TableCell sx={{ fontWeight: "bold" }}>Имя пользователя</TableCell>
							<TableCell sx={{ fontWeight: "bold" }}>Дата регистрации</TableCell>
							<TableCell sx={{ fontWeight: "bold" }}>Роль</TableCell>
							<TableCell sx={{ fontWeight: "bold" }}>Книг взято</TableCell>
							<TableCell sx={{ fontWeight: "bold" }}>В желаемом</TableCell>
						</TableRow>
					</TableHead>
					<TableBody>
						{paginatedUsers.map((user) => (
							<TableRow
								key={user.user_id}
								hover
								sx={{
									cursor: "pointer",
									transition: "background-color 0.2s",
									"&:hover": { backgroundColor: "#f0f0f0" },
								}}
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
				{/* Пагинация */}
				<TablePagination
					component="div"
					count={visibleUsers.length}
					page={page}
					onPageChange={handleChangePage}
					rowsPerPage={rowsPerPage}
					onRowsPerPageChange={handleChangeRowsPerPage}
					rowsPerPageOptions={[5, 10, 25, 50]}
					labelRowsPerPage="Пользователей на странице:"
				/>
			</TableContainer>
		</Box>
	);
}
