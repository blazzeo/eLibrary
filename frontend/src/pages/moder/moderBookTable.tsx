import { useEffect, useState, useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { UserData, BookLoan, BookInfo } from "../../components/structs";
import { getLoans } from "../../components/api/DatabaseAPI";

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

	const columns = useMemo<MRT_ColumnDef<BookInfo>[]>(
		() => [
			{
				accessorFn: (row) => row.book.book_id,
				header: "ID",
				size: 10,
			},
			{
				accessorFn: (row) => row.book.title,
				header: "Название",
				size: 150,
			},
			{
				accessorFn: (row) => row.book.total_pages,
				header: "Страниц",
				size: 50,
			},
			{
				accessorFn: (row) => row.book.rating,
				header: "Рейтинг",
				size: 50,
			},
			{
				accessorFn: (row) => row.book.published_date,
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
					return (row.original.owner) ?
						<strong className="text-primary fw-bold">{row.original.owner.user_name}</strong> :
						<p className="all-unset m-0 p-0 text-secondary">Доступна</p>;
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
