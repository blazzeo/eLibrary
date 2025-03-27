import { useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../structs";
import { borrowBook } from "../api/DatabaseAPI";

interface Props {
	books: BookData[];
	updateBooks: () => void;
}

export default function BookDataTable({ books, updateBooks }: Props) {
	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{
				accessorKey: "title",
				header: "Название 📖",
				size: 450,
			},
			{
				accessorKey: "total_pages", //normal accessorKey
				header: "Коль-во страниц 📗",
				size: 20,
			},
			{
				accessorKey: "rating",
				header: "Рейтинг ⭐️",
				size: 20,
			},
			{
				accessorKey: "published_date",
				header: "Дата публикации 📅",
				size: 20,
				Cell: ({ cell }) => {
					// Format the date for display
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString(); // Adjust format as needed },
				},
			},
			{
				accessorKey: "loan_status",
				header: "Статус 🔓",
				size: 20,
				Cell: ({ cell, row }) => {
					const loanStatus = cell.getValue() as number; // Assuming your BookData has these properties

					const handleBorrow = async () => {
						const userName = sessionStorage.getItem("userName")
						const bookId = row.original.book_id;
						await borrowBook(userName, bookId)
						console.log(`Book ID ${bookId} -> User ${userName}`);
						updateBooks();
					};

					if (loanStatus === 0) {
						return (
							<button className="btn btn-success" onClick={handleBorrow}>
								Borrow
							</button>
						);
					} else if (loanStatus === 1) {
						return (
							<button className="btn btn-secondary" disabled>
								Mine
							</button>
						);
					} else {
						return (
							<button className="btn btn-danger" disabled>
								Unavailable
							</button>
						);
					}
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
