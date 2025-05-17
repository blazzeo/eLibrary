import { BookInfo } from "../structs";

interface LoanListItemProps {
	book: BookInfo;
	loanDate: string;
	onCancel: () => void;
	onExtend: () => void;
}

export const LoanListItem = ({ book, loanDate, onCancel, onExtend }: LoanListItemProps) => (
	<li className="list-group-item py-2 border-0">
		<div className="d-flex justify-content-between align-items-center px-0">
			<div className="d-flex gap-3 align-items-center">
				<span className="text-success fs-4 lh-1">📖</span>
				<div>
					<strong>{book.book.title}</strong>
					<div className="small text-muted">До {loanDate}</div>
				</div>
			</div>
			<div className="btn-group btn-group-sm">
				<button className="btn btn-outline-primary" onClick={onExtend}>Продлить</button>
				<button className="btn btn-outline-danger" onClick={onCancel}>Аннулировать</button>
			</div>
		</div>
	</li>
);
