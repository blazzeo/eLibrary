import { useMemo, useState } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs.tsx";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { AskExtensionForm } from "../../components/forms/AskExtensionForm.tsx"; // Импортируем новый компонент

interface Props {
	books: BookData[] | undefined
}

export function BookShelf({ books }: Props) {
	const [showExtensionModal, setShowExtensionModal] = useState(false);
	const [selectedBookForExtension, setSelectedBookForExtension] = useState<{ id: number; returnDate: Date } | null>(null);

	// Открытие модального окна запроса на продление
	const handleOpenExtensionModal = (bookId: number) => {
		const book = books?.find((b) => b.book_id === bookId);
		if (book && book.return_date) {
			setSelectedBookForExtension({
				id: bookId,
				returnDate: book.return_date,
			});
			setShowExtensionModal(true);
		} else {
			toast.error("Не удалось получить дату возврата для продления.");
		}
	};

	const handleCloseExtensionModal = () => {
		setShowExtensionModal(false);
		setSelectedBookForExtension(null);
	};

	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{ accessorKey: "title", header: "Название", size: 250 },
			{ accessorKey: "total_pages", header: "Страниц", size: 50 },
			{
				accessorKey: "published_date",
				header: "Дата публикации",
				size: 50,
				Cell: ({ cell }) => new Date(cell.getValue() as string).toLocaleDateString(),
			},
			{
				// borrow_date из исходного кода, но в нашей новой структуре
				// это current_loan_borrow_date, если книга на руках у меня (loan_status === 1)
				accessorKey: "borrow_date", // Используем актуальное поле
				header: "Дата получения",
				size: 50,
				Cell: ({ cell }) => {
					return new Date(cell.getValue() as string).toLocaleDateString();
				},
			},
			{
				// return_date из исходного кода, но в нашей новой структуре
				// это current_loan_expected_return_date, если книга на руках у меня (loan_status === 1)
				accessorKey: "return_date", // Используем актуальное поле
				header: "Дата возврата",
				size: 50,
				Cell: ({ cell }) => {
					return new Date(cell.getValue() as string).toLocaleDateString();
				},
			},
			{
				accessorKey: "loan_status", // Используем для определения действия
				header: "Действие",
				size: 50,
				Cell: ({ row }) => {
					const book = row.original;

					return (
						<button
							className="btn btn-warning"
							onClick={() => handleOpenExtensionModal(book.book_id!)}
						>
							Продлить срок
						</button>
					);
				},
			},
		],
		[books] // books в зависимостях, так как handleOpenModal использует books
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books || [], // Защита от undefined
	});

	return (
		<>
			<MaterialReactTable table={table} />

			<AskExtensionForm
				show={showExtensionModal}
				onClose={handleCloseExtensionModal}
				bookId={selectedBookForExtension?.id || null}
				currentReturnDate={selectedBookForExtension?.returnDate || null}
			/>
		</>
	);
}
