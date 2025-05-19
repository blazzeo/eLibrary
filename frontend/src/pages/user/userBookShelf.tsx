import { useMemo, useState } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs";
import { askExtension } from "../../components/api/DatabaseAPI";
import { Modal, Button, Form } from "react-bootstrap";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useLibrary } from "../../libraryContext";

interface Props {
	books: BookData[] | undefined
}

export function BookShelf({ books }: Props) {
	const { refreshBooks } = useLibrary()

	const [showModal, setShowModal] = useState(false);
	const [selectedBookId, setSelectedBookId] = useState<number | null>(null);
	const [newDate, setNewDate] = useState<string>("");

	// Открытие модального окна
	const handleOpenModal = (bookId: number) => {
		const book = books!.find((b) => b.book_id === bookId);
		if (book && book.return_date) {
			const formatted = new Date(book.return_date).toISOString().split("T")[0];
			setNewDate(formatted);
			setSelectedBookId(bookId);
			setShowModal(true);
		} else {
			toast.error("Не удалось получить дату возврата.");
		}
	};

	const handleCloseModal = () => {
		setShowModal(false);
		setNewDate("");
		setSelectedBookId(null);
	};

	const handleSubmit = async () => {
		if (selectedBookId && newDate) {
			try {
				let user_name = sessionStorage.getItem("userName")!
				await askExtension(user_name, selectedBookId, new Date(newDate));
				toast.success("Запрос успешно отправлен");
			} catch (error) {
				console.error(error);
				toast.error("Ошибка при отправке запроса");
			} finally {
				await refreshBooks();
				handleCloseModal();
			}
		}
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
				accessorKey: "borrow_date",
				header: "Дата получения",
				size: 50,
				Cell: ({ cell }) => new Date(cell.getValue() as string).toLocaleDateString(),
			},
			{
				accessorKey: "return_date",
				header: "Дата возврата",
				size: 50,
				Cell: ({ cell }) => new Date(cell.getValue() as string).toLocaleDateString(),
			},
			{
				accessorKey: "loan_status",
				header: "Действие",
				size: 50,
				Cell: ({ row }) => (
					<button
						className="btn btn-primary"
						onClick={() => handleOpenModal(row.original.book_id!)}
					>
						Запрос на продление
					</button>
				),
			},
		],
		[books]
	);

	const table = useMaterialReactTable<BookData>({
		columns,
		data: books!,
	});

	return (
		<>
			<MaterialReactTable table={table} />

			<Modal show={showModal} onHide={handleCloseModal} centered>
				<Modal.Header closeButton>
					<Modal.Title>Выберите новую дату возврата</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form.Group>
						<Form.Label>Новая дата:</Form.Label>
						<Form.Control
							type="date"
							value={newDate}
							onChange={(e) => setNewDate(e.target.value)}
							required
						/>
					</Form.Group>
				</Modal.Body>
				<Modal.Footer>
					<Button variant="secondary" onClick={handleCloseModal}>
						Отмена
					</Button>
					<Button variant="primary" onClick={handleSubmit} disabled={!newDate}>
						OK
					</Button>
				</Modal.Footer>
			</Modal>
		</>
	);
}
