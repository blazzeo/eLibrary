import { useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs";
import { askExtension } from "../../components/api/DatabaseAPI";

interface Props {
	books: BookData[];
	updateBooks: () => void;
}

export function BookShelf({ books, updateBooks }: Props) {
	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{
				accessorKey: "title",
				header: "Название",
				size: 250,
			},
			{
				accessorKey: "total_pages", //normal accessorKey
				header: "Страниц",
				size: 50,
			},
			{
				accessorKey: "borrow_date",
				header: "Дата получения",
				size: 50,
				Cell: ({ cell }) => {
					// Format the date for display
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString(); // Adjust format as needed },
				},
			},
			{
				accessorKey: "return_date",
				header: "Дата возврата",
				size: 50,
				Cell: ({ cell }) => {
					// Format the date for display
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString(); // Adjust format as needed },
				},
			},
			{
				accessorKey: "published_date",
				header: "Дата публикации",
				size: 50,
				Cell: ({ cell }) => {
					// Format the date for display
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString(); // Adjust format as needed },
				},
			},
			{
				accessorKey: "loan_status",
				header: "Действие",
				size: 50,
				Cell: ({ row }) => {
					const handleRequest = async () => {
						const bookId = row.original.book_id
						await askExtension(bookId!);
						updateBooks()
					}
					return <button className="btn btn-success" onClick={handleRequest}>
						Продлить
					</button>
				},
			},
		],
		[]
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books,
	});

	return <MaterialReactTable table={table} />;
}
