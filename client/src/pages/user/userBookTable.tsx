import { useMemo, useState, useCallback } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs.tsx";
import { toggleWishlist } from "../../api/DatabaseAPI.tsx";
import { useLibrary } from "../../context/libraryContext";
import { useNavigate } from "react-router";
import { toast } from "react-toastify";
import { AskExtensionForm } from "../../components/forms/AskExtensionForm.tsx";

export default function UserBookTable() {
	const { books, refreshAll, user } = useLibrary();
	const navigate = useNavigate();
	const [loadingBookId, setLoadingBookId] = useState<number | null>(null);

	const [showExtensionModal, setShowExtensionModal] = useState(false);
	const [selectedBookForExtension, setSelectedBookForExtension] = useState<{ id: number; currentReturnDate: Date | null } | null>(null);

	const handleToggleWishlist = useCallback(async (bookId: number, currentIsInWishlist: boolean) => {
		if (!user?.user_id || loadingBookId === bookId) return;

		try {
			setLoadingBookId(bookId);
			await toggleWishlist(user.user_id, bookId);
			toast.success(currentIsInWishlist ? "Книга удалена из списка желаний/бронирований" : "Книга добавлена в список желаний/забронирована");
			await refreshAll();
		} catch (error: any) {
			console.error("Ошибка при обновлении списка желаний/бронирований:", error);
			toast.error(`Не удалось обновить список желаний/бронирований: ${error.message || 'Неизвестная ошибка'}`);
		} finally {
			setLoadingBookId(null);
		}
	}, [user, loadingBookId, refreshAll]);

	const handleOpenExtensionModal = useCallback((bookId: number) => {
		const book = books?.find((b) => b.book_id === bookId);
		if (book && book.return_date) {
			setSelectedBookForExtension({ id: bookId, currentReturnDate: book.return_date });
			setShowExtensionModal(true);
		} else {
			toast.error("Не удалось получить дату возврата для продления.");
		}
	}, [books]);

	const handleCloseExtensionModal = useCallback(() => {
		setShowExtensionModal(false);
		setSelectedBookForExtension(null);
	}, []);


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
				header: "Действие",
				size: 150,
				grow: false,
				Cell: ({ row }) => {
					const book = row.original;
					const loanStatus = book.loan_status;
					const isInWishlist = book.is_in_my_wishlist;
					const isLoading = loadingBookId === book.book_id!;

					// Форматируем дату для отображения на кнопке
					const formattedReturnDate = book.return_date
						? new Date(book.return_date).toLocaleDateString()
						: '';

					if (loanStatus === 1) {
						return (
							<button
								className="btn btn-warning"
								onClick={(e) => {
									e.stopPropagation();
									handleOpenExtensionModal(book.book_id!);
								}}
								disabled={isLoading}
							>
								{isLoading ? "Загрузка..." : `Продлить срок (до ${formattedReturnDate})`}
							</button>
						);
					}
					else if (loanStatus === 3 || (loanStatus === 0 && isInWishlist)) {
						return (
							<button
								className={`btn ${isInWishlist ? "btn-danger" : "btn-info"}`}
								onClick={(e) => {
									e.stopPropagation();
									handleToggleWishlist(book.book_id!, isInWishlist);
								}}
								disabled={isLoading}
							>
								{isLoading ? "Загрузка..." : (isInWishlist ? "Отменить бронь" : `Забронировать (занята до ${formattedReturnDate})`)}
							</button>
						);
					}
					else if (loanStatus === 0 && !isInWishlist) {
						return (
							<button
								className="btn btn-success"
								onClick={(e) => {
									e.stopPropagation();
									handleToggleWishlist(book.book_id!, isInWishlist);
								}}
								disabled={isLoading}
							>
								{isLoading ? "Загрузка..." : "Забронировать"}
							</button>
						);
					}
					return null;
				},
			},
		],
		[handleToggleWishlist, handleOpenExtensionModal, loadingBookId]
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books ?? [],
		enableColumnActions: false,
		enableColumnFilters: false,
		enablePagination: true,
		enableSorting: true,
		enableTopToolbar: true,
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

	return (
		<>
			<MaterialReactTable table={table} />

			{showExtensionModal && selectedBookForExtension && (
				<AskExtensionForm
					show={showExtensionModal}
					onClose={handleCloseExtensionModal}
					bookId={selectedBookForExtension.id}
					currentReturnDate={selectedBookForExtension.currentReturnDate ? new Date(selectedBookForExtension.currentReturnDate) : null}
				/>
			)}
		</>
	);
}
