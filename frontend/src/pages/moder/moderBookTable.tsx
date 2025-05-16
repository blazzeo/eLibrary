import { useEffect, useState, useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { UserData, BookLoan, BookInfo } from "../../components/structs";
import { getLoans, returnBook } from "../../components/api/DatabaseAPI";

interface Props {
	books: BookInfo[];
	users: UserData[];
	updateBooks: () => void;
}

export default function ModerBookTable({ books, users, updateBooks }: Props) {
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

	const columns = useMemo<MRT_ColumnDef<BookInfo>[]>(
		() => [
			{
				accessorFn: (row) => row.book_info.book.book_id,
				header: "ID",
				size: 10,
			},
			{
				accessorFn: (row) => row.book_info.book.title,
				header: "Название",
				size: 150,
			},
			{
				accessorFn: (row) => row.book_info.book.total_pages,
				header: "Страниц",
				size: 50,
			},
			{
				accessorFn: (row) => row.book_info.book.rating,
				header: "Рейтинг",
				size: 50,
			},
			{
				accessorFn: (row) => row.book_info.book.published_date,
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
					return (row.original.book_info.owner) ?
						<strong className="text-primary fw-bold">{row.original.book_info.owner.user_name}</strong> :
						<p className="all-unset m-0 p-0 text-secondary">Доступна</p>;
				},
			},
			{
				header: "Вернуть",
				size: 50,
				Cell: ({ row }) => {
					const handleReturn = async () => {
						const bookId = row.original.book_info.book.book_id;
						await returnBook(bookId);
						setBookLoans((prevLoans) => prevLoans.filter((loan) => loan.book_id !== bookId));
						updateBooks();
					};

					return hasOwner(row.original.book_info.book.book_id!) ? (
						<button className="btn btn-success" onClick={handleReturn}>
							Return
						</button>
					) : null;
				},
			},
		],
		[bookLoans, users] // Пересчитываем столбцы при изменении данных о книгах и пользователях
	);

	const table = useMaterialReactTable<BookInfo>({
		columns,
		data: books,
	});

	return <MaterialReactTable table={table} />;
}
