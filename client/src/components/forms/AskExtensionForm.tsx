// src/components/ExtensionRequestModal.tsx
import React, { useState, useEffect } from "react";
import { Modal, Button, Form } from "react-bootstrap";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { askExtension } from "../../api/DatabaseAPI";
import { useLibrary } from "../../context/libraryContext";

interface ExtensionRequestModalProps {
	show: boolean;
	onClose: () => void;
	bookId: number | null;
	currentReturnDate: Date | null; // Текущая дата возврата книги
}

export const AskExtensionForm: React.FC<ExtensionRequestModalProps> = ({
	show,
	onClose,
	bookId,
	currentReturnDate,
}) => {
	const { refreshAll, user } = useLibrary();
	const [newDate, setNewDate] = useState<string>("");
	const [loading, setLoading] = useState<boolean>(false);

	useEffect(() => {
		if (show && currentReturnDate) {
			// Форматируем дату в формат "YYYY-MM-DD" для input type="date"
			const formatted = new Date(currentReturnDate).toISOString().split("T")[0];
			setNewDate(formatted);
		} else if (!show) {
			// Сбрасываем дату при закрытии модалки
			setNewDate("");
		}
	}, [show, currentReturnDate]);

	const handleSubmit = async () => {
		if (!bookId || !newDate || !user?.user_id) {
			toast.error("Не все данные для запроса заполнены.");
			return;
		}

		setLoading(true);
		try {
			await askExtension(user.user_id, bookId, new Date(newDate));
			toast.success("Запрос на продление успешно отправлен!");
			onClose(); // Закрываем модальное окно после успешной отправки
		} catch (error) {
			console.error("Ошибка при отправке запроса на продление:", error);
			toast.error("Ошибка при отправке запроса на продление.");
		} finally {
			setLoading(false);
			await refreshAll(); // Обновляем данные после отправки запроса
		}
	};

	return (
		<Modal show={show} onHide={onClose} centered>
			<Modal.Header closeButton>
				<Modal.Title>Запросить продление срока</Modal.Title>
			</Modal.Header>
			<Modal.Body>
				<Form.Group controlId="newReturnDate">
					<Form.Label>Выберите новую дату возврата:</Form.Label>
					<Form.Control
						type="date"
						value={newDate}
						onChange={(e) => setNewDate(e.target.value)}
						required
					/>
				</Form.Group>
			</Modal.Body>
			<Modal.Footer>
				<Button variant="secondary" onClick={onClose} disabled={loading}>
					Отмена
				</Button>
				<Button variant="primary" onClick={handleSubmit} disabled={!newDate || loading}>
					{loading ? "Отправка..." : "Отправить запрос"}
				</Button>
			</Modal.Footer>
		</Modal>
	);
};
