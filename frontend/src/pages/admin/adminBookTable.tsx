import { useEffect, useState, useMemo } from "react";
import { useNavigate } from "react-router-dom";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData, UserData, BookLoan } from "../../components/structs";
import { getLoans, returnBook } from "../../components/api/DatabaseAPI";

interface Props {
	books: BookData[];
	users: UserData[];
	updateBooks: () => void;
	editBook: (book: BookData) => void;
}

export function AdminBookTable({ books, users, updateBooks, editBook }: Props) {
	const [bookLoans, setBookLoans] = useState<BookLoan[]>([]); // Состояние для хранение данных о займах

	const fetchLoans = async () => {
		const loans = await getLoans();
		setBookLoans(loans);
	};

	useEffect(() => {
		fetchLoans();
	}, []); // Загружаем данные только один раз при монтировании компонента

	const hasOwner = (bookId: number): boolean => {
		return !!bookLoans.find((loan) => loan.book_id === bookId);
	};

	// Проверка, что пользователи уже загружены
	const getOwnerName = (bookId: number): string | null => {
		const bookOwner = bookLoans.find((loan) => loan.book_id === bookId);
		if (bookOwner) {
			// Проверяем, что users не пустой
			if (users.length === 0) {
				console.warn("Users data is empty");
				return null;
			}
			console.log(users);
			const owner = users.find((user) => user.username === bookOwner.user_name);
			return owner ? owner.username : "Unknown Owner";
		}
		return null; // Если владельца нет
	};

	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{
				accessorKey: "book_id",
				header: "ID",
				size: 10,
			},
			{
				accessorKey: "title",
				header: "Название",
				size: 150,
			},
			{
				accessorKey: "total_pages",
				header: "Страниц",
				size: 50,
			},
			{
				accessorKey: "rating",
				header: "Рейтинг",
				size: 50,
			},
			{
				accessorKey: "published_date",
				header: "Дата публикации",
				size: 50,
				Cell: ({ cell }) => {
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString();
				},
			},
			{
				header: "Владелец",
				size: 50,
				Cell: ({ row }) => {
					const bookId = row.original.book_id;
					const ownerName = getOwnerName(bookId!);
					return ownerName || "Доступна"; // Если владельца нет, выводим "Available"
				},
			},
			{
				header: "Вернуть",
				size: 50,
				Cell: ({ row }) => {
					const handleReturn = async () => {
						const bookId = row.original.book_id;
						await returnBook(bookId);
						setBookLoans((prevLoans) => prevLoans.filter((loan) => loan.book_id !== bookId));
						updateBooks();
					};

					return hasOwner(row.original.book_id!) ? (
						<button className="btn btn-success" onClick={handleReturn}>
							Return
						</button>
					) : null;
				},
			},
			{
				header: "Редактировать",
				size: 50,
				Cell: ({ row }) => {
					const handleEdit = () => {
						editBook(row.original);
						//const navigate = useNavigate()
						//navigate("/editbook")
					};

					return (
						<button className="btn btn-primary" onClick={handleEdit}>
							Edit
						</button>
					);
				},
			},
		],
		[bookLoans, users] // Пересчитываем столбцы при изменении данных о книгах и пользователях
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books,
	});

	return <MaterialReactTable table={table} />;
}
