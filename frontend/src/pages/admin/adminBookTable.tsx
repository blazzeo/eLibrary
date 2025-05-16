import { useEffect, useState, useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookInfo, BookLoan } from "../../components/structs";
import { getLoans } from "../../components/api/DatabaseAPI";
import { useNavigate } from "react-router-dom";

interface Props {
	books: BookInfo[];
	updateBooks: () => void;
	editBook: (book: BookInfo) => void;
}

export function AdminBookTable({ books, updateBooks, editBook }: Props) {
	const [bookLoans, setBookLoans] = useState<BookLoan[]>([]); // Состояние для хранение данных о займах

	const fetchLoans = async () => {
		const loans = await getLoans();
		setBookLoans(loans);
	};

	useEffect(() => {
		fetchLoans();
	}, []);

	// внутри компонента
	const navigate = useNavigate();

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
						<strong className="text-primary">
							{row.original.book_info.owner.user_name}
						</strong> :
						<p className="text-secondary fg-muted">
							Доступна
						</p>;
				},
			},
		],
		[bookLoans] // Пересчитываем столбцы при изменении данных о книгах и пользователях
	);

	const table = useMaterialReactTable<BookInfo>({
		columns,
		data: books,
		muiTableBodyRowProps: ({ row }) => ({
			onClick: () => {
				const bookId = row.original.book_info.book.book_id;
				navigate(`/book?id=${bookId}`);
			},
			sx: {
				cursor: "pointer",
				"&:hover": {
					backgroundColor: "#f0f0f0",
				},
			},
		}),
	});

	return <MaterialReactTable table={table} />;
}
