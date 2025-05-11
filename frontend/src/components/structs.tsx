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
	book_id: number;
	user_id: number;
	user_name: string;
	borrow_date: Date;
	return_date: Date;
};

export type BookWish = {
	book_id: number;
	book_title: string;
	user_id: number;
	user_name: string;
	request_date: Date;
}

export type BookInfo = {
	book_info: {
		book: {
			book_id: number;
			title: string;
			published_date: Date;
			total_pages: number;
			isbn: number;
			authors: string[];
			genres: string[];
			owner: {
				user_id: number;
				user_name: string;
				borrow_date: Date;
				return_date: Date;
			}
		};
		extension_request: Date;
		wishlist: {
			user_id: number;
			user_name: string;
			request_date: Date;
		}[];
	};
	updateBooks: () => void;
}
