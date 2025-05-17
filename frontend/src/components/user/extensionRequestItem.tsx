import { BookInfo } from "../structs";

interface ExtensionRequestItemProps {
	book: BookInfo;
	requestDate: string;
	onApprove: () => void;
	onReject: () => void;
}

export const ExtensionRequestItem = ({ book, requestDate, onApprove, onReject }: ExtensionRequestItemProps) => (
	<li className="list-group-item py-2 border-0">
		<div className="d-flex justify-content-between align-items-center px-0">
			<div className="d-flex gap-3 align-items-center">
				<span className="text-info fs-4 lh-1">⏳</span>
				<div>
					<strong>{book.book.title}</strong>
					<div className="small text-muted">До {requestDate}</div>
				</div>
			</div>
			<div className="btn-group btn-group-sm">
				<button className="btn btn-outline-success" onClick={onApprove}>Подтвердить</button>
				<button className="btn btn-outline-danger" onClick={onReject}>Отклонить</button>
			</div>
		</div>
	</li>
);
