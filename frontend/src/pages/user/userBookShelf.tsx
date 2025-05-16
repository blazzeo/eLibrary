import { useMemo, useState } from "react";
import {
	MaterialReactTable,
	useMaterialReactTable,
	type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../../components/structs";
import { askExtension, toggleWishlist } from "../../components/api/DatabaseAPI";
import { Modal, Button, Form } from "react-bootstrap";

interface Props {
	books: BookData[];
	updateBooks: () => void;
}

export function BookShelf({ books, updateBooks }: Props) {
	const [showModal, setShowModal] = useState(false);
	const [selectedBookId, setSelectedBookId] = useState<number | null>(null);
	const [newDate, setNewDate] = useState(new Date);

	const handleOpenModal = (bookId: number) => {
		setSelectedBookId(bookId);
		setShowModal(true);
	};

	const handleCloseModal = () => {
		setShowModal(false);
		setNewDate(new Date);
		setSelectedBookId(null);
	};

	const handleSubmit = async () => {
		if (selectedBookId && newDate) {
			await askExtension(selectedBookId, newDate);
			updateBooks();
			handleCloseModal();
		}
	};

	const columns = useMemo<MRT_ColumnDef<BookData>[]>(
		() => [
			{ accessorKey: "title", header: "Название", size: 250 },
			{ accessorKey: "total_pages", header: "Страниц", size: 50 },
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
						const userName = sessionStorage.getItem("userName");
						await toggleWishlist(userName!, row.original.book_id!);
						updateBooks();
					};

					return row.original.loan_status == 0 ? (
						<button className="btn btn-primary" onClick={() => handleOpenModal(row.original.book_id!)}>
							Продлить
						</button>
					) : (
						<button className="btn btn-danger" onClick={handleRemove}>
							Убрать из желаемого
						</button>
					);
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
							value={newDate.toString()}
							onChange={(e) => setNewDate(new Date(e.target.value))}
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
