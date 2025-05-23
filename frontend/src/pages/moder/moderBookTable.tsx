import { useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookInfo } from "../../components/structs";
import { useLibrary } from "../../libraryContext";
import { useNavigate } from "react-router-dom";

export default function ModerBookTable() {
	const { moderBooks } = useLibrary();
	const navigate = useNavigate();

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
					return row.original.owner ? (
						<strong className="text-primary fw-bold">
							{row.original.owner.user_name}
						</strong>
					) : (
						<p className="all-unset m-0 p-0 text-secondary">Доступна</p>
					);
				},
			},
		],
		[moderBooks]
	);

	const table = useMaterialReactTable<BookInfo>({
		columns,
		data: moderBooks ?? [],
		muiTableBodyRowProps: ({ row }) => ({
			onClick: () => {
				const bookId = row.original.book.book_id;
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
