import { BookInfo } from "../structs";

interface WishlistItemProps {
	book: BookInfo;
	requestDate: string;
	canIssue: boolean;
	onRemove: () => void;
	onIssue?: () => void;
}

export const WishlistItem = ({ book, requestDate, canIssue, onRemove, onIssue }: WishlistItemProps) => (
	<li className="list-group-item py-2 border-0">
		<div className="d-flex justify-content-between align-items-center px-0">
			<div className="d-flex gap-3 align-items-center">
				<span className="text-warning fs-4 lh-1">💡</span>
				<div>
					<strong>{book.book.title}</strong>
					<div className="small text-muted">Запрошена {requestDate}</div>
				</div>
			</div>
			<div className="btn-group btn-group-sm">
				<button className="btn btn-outline-danger" onClick={onRemove}>Снять</button>
				{canIssue && (
					<button className="btn btn-outline-success" onClick={onIssue}>Выдать</button>
				)}
			</div>
		</div>
	</li>
);
