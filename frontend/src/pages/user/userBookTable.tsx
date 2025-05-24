import { useMemo, useState, useCallback } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs.tsx";
import { toggleWishlist } from "../../components/api/DatabaseAPI.tsx";
import { useLibrary } from "../../libraryContext";
import { useNavigate } from "react-router";
import { toast } from "react-toastify";

export default function UserBookTable() {
	const { books, refreshAll, user } = useLibrary();
	const navigate = useNavigate();
	const [loadingBookId, setLoadingBookId] = useState<number | null>(null);

	const handleWishlist = useCallback(async (bookId: number, currentStatus: number) => {
		console.log("Handling wishlist for book:", bookId, "current status:", currentStatus);
		if (!user?.user_name || loadingBookId === bookId) return;

		// Нельзя добавить в желаемое книгу, которая уже на руках
		if (currentStatus === 0) {
			toast.warning("Эта книга уже у вас на руках");
			return;
		}

		try {
			setLoadingBookId(bookId);

			const user_id = user.user_id;
			// Отправляем запрос на сервер
			await toggleWishlist(user_id, bookId);

			// Показываем уведомление
			toast.success(
				currentStatus === 1
					? "Книга удалена из списка отложенных"
					: "Книга добавлена в список отложенных"
			);

			// Принудительно обновляем данные
			await refreshAll();
		} catch (error) {
			console.error("Ошибка при обновлении списка отложенных:", error);
			toast.error("Не удалось обновить список отложенных");
		} finally {
			setLoadingBookId(null);
		}
	}, [user, loadingBookId, refreshAll]);

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
				Cell: ({ cell }) => {
					const authors = cell.getValue() as string[];
					return authors?.join(", ");
				},
			},
			{
				accessorKey: "genres",
				header: "Жанры",
				size: 50,
				grow: false,
				Cell: ({ cell }) => {
					const genres = cell.getValue() as string[];
					return genres?.join(", ");
				},
			},
			{
				accessorKey: "total_pages",
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
					const date = new Date(cell.getValue() as string);
					return date.toLocaleDateString();
				},
			},
			{
				accessorKey: "loan_status",
				header: "Статус 🔓",
				size: 50,
				grow: false,
				Cell: ({ cell, row }) => {
					const loanStatus = cell.getValue() as number;
					const bookId = row.original.book_id!;
					const isLoading = loadingBookId === bookId;

					if (loanStatus === 0) {
						return (
							<button className="btn btn-secondary" disabled>
								На книжной полке
							</button>
						);
					}

					return (
						<button
							className={`btn ${loanStatus === 1 ? "btn-danger" : "btn-success"}`}
							onClick={(e) => {
								e.stopPropagation();
								handleWishlist(bookId, loanStatus);
							}}
							disabled={isLoading}
						>
							{isLoading ? (
								"Загрузка..."
							) : (
								loanStatus === 1 ? "Удалить из отложенных" : "Отложить книгу"
							)}
						</button>
					);
				},
			},
		],
		[handleWishlist, loadingBookId]
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books ?? [],
		enableColumnActions: false,
		enableColumnFilters: false,
		enablePagination: true,
		enableSorting: true,
		enableTopToolbar: false,
		muiTableBodyRowProps: ({ row }) => ({
			onClick: () => {
				const bookId = row.original.book_id;
				navigate(`/book/${bookId}`);
			},
			sx: {
				cursor: "pointer",
				'&:hover': {
					backgroundColor: '#f0f0f0',
				},
			},
		}),
	});

	return books ? <MaterialReactTable table={table} /> : <h1>Загрузка...</h1>;
}
