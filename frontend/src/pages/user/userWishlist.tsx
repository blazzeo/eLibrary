import { useMemo } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs.tsx";
import { toggleWishlist } from "../../components/api/DatabaseAPI.tsx";
import { useLibrary } from "../../libraryContext";

interface Props {
	books: BookData[] | undefined;
}

export function WishList({ books }: Props) {
	const { refreshAll, user } = useLibrary()

	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{ accessorKey: "title", header: "Название", size: 250 },
			{ accessorKey: "total_pages", header: "Страниц", size: 50 },
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
				accessorKey: "published_date",
				header: "Дата публикации",
				size: 50,
				Cell: ({ cell }) => new Date(cell.getValue() as string).toLocaleDateString(),
			},
			{
				accessorKey: "loan_status",
				header: "Действие",
				size: 50,
				Cell: ({ row }) => {
					const handleRemove = async () => {
						const userId = user?.user_id
						await toggleWishlist(userId!, row.original.book_id!);
						refreshAll();
					};

					return (
						<button className="btn btn-danger" onClick={handleRemove}>
							Удалить из отложенных
						</button>
					)
				},
			},
		],
		[]
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books,
	});

	return (
		<MaterialReactTable table={table} />
	);
}
