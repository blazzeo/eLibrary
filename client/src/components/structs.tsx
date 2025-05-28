export type Author = {
	author_id: number;
	first_name: string;
	middle_name: string | null;
	last_name: string | null;
	full_name: string;
}

export type AuthorInput = {
	first_name: string;
	middle_name: string | null;
	last_name: string | null;
}

export type Loan = {
	book_id: number;
	borrow_date: Date;
	return_date: Date;
}

export type WishlistItem = {
	book_id: number;
	request_date: Date;
}

export type ExtensionRequest = {
	book_id: number;
	request_date: Date;
}

export type UserData = {
	user_id: number;
	user_name: string;
	user_role: string;
	registration_date: Date;
	telegram_chat_id: string | null;

	loans: Loan[] | null;
	wishlist: WishlistItem[] | null;
	extension_requests: ExtensionRequest[] | null;
}

export type BookData = {
	book_id: number;
	title: string;
	authors: string[];
	genres: string[];
	total_pages: number;
	rating: number;
	isbn: number;
	published_date: Date;
	borrow_date: Date;
	return_date: Date;
	loan_status: 0 | 1 | 3;
	is_in_my_wishlist: boolean;
};

export type BookLoan = {
	book_id: number;
	user_id: number;
	user_name: string;
	borrow_date: Date;
	return_date: Date;
};

export type BookInfo = {
	book: {
		book_id: number;
		title: string;
		published_date: Date;
		total_pages: number;
		rating: number;
		isbn: number;
		authors: string[];
		genres: string[];
	}
	owner: {
		user_id: number;
		user_name: string;
		borrow_date: Date;
		return_date: Date;
	}
	extension_request: Date
	wishlist: {
		user_id: number;
		user_name: string;
		request_date: Date;
	}[];
}
