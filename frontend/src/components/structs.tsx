export type UserData = {
	username: string;
	password: string;
};

export type BookData = {
	book_id: number | null;
	title: string;
	authors: string[];
	genres: string[];
	total_pages: number;
	rating: number;
	isbn: string;
	published_date: Date;
	loan_status: number;
};

export type BookLoan = {
	user_id: number;
	user_name: string;
	book_id: number;
	borrow_date: Date;
	return_date: Date;
};
