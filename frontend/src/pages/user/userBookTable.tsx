import { useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs";
import { toggleWishlist } from "../../components/api/DatabaseAPI";

interface Props {
	books: BookData[];
	updateBooks: () => void;
}

export default function UserBookTable({ books, updateBooks }: Props) {
	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{
				accessorKey: "title",
				header: "Название 📖",
				size: 300,
			},
			{
				accessorKey: "authors",
				header: "Авторы",
				size: 180,
				grow: false,
				// Parse array of authors into a comma-separated string
				Cell: ({ cell }) => {
					const authors = cell.getValue() as string[];
					return authors?.join(", "); // "Author1, Author2, ..."
				},
			},
			{
				accessorKey: "genres",
				header: "Жанры",
				size: 50,
				grow: false,
				// Parse array of genres into a comma-separated string
				Cell: ({ cell }) => {
					const genres = cell.getValue() as string[];
					return genres?.join(", "); // "Genre1, Genre2, ..."
				},
			},
			{
				accessorKey: "total_pages", //normal accessorKey
				header: "Страниц 📗",

				grow: false,
				size: 50,
			},
			{
				accessorKey: "rating",
				header: "Рейтинг ⭐️",
				grow: false,
				size: 50,
			},
			{
				accessorKey: "published_date",
				header: "Опубликовано 📅",
				size: 50,
				grow: false,
				Cell: ({ cell }) => {
					// Format the date for display
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString(); // Adjust format as needed },
				},
			},
			{
				accessorKey: "loan_status",
				header: "Статус 🔓",
				size: 50,
				grow: false,
				Cell: ({ cell, row }) => {
					const loanStatus = cell.getValue() as number; // Assuming your BookData has these properties

					const handleWishlist = async () => {
						const userName = sessionStorage.getItem("userName")
						const bookId = row.original.book_id;
						await toggleWishlist(userName!, bookId!)
						console.log(`Book ID ${bookId} -> User ${userName}`);
						updateBooks();
					};

					if (loanStatus === 0) {
						return (
							<button className="btn btn-secondary" disabled >
								Моя
							</button>
						);
					} else if (loanStatus === 1) {
						return (
							<button className="btn btn-danger" onClick={handleWishlist}>
								Убрать из желаемого
							</button>
						);
					}
					else {
						return (
							<button className="btn btn-success" onClick={handleWishlist}>
								Добавить в желаемое
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
