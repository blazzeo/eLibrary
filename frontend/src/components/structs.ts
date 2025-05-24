export interface Author {
    author_id: number;
    first_name: string;
    middle_name: string | null;
    last_name: string | null;
    full_name: string;
}

export interface AuthorInput {
    first_name: string;
    middle_name: string | null;
    last_name: string | null;
}

export interface BookData {
    book_id: number;
    title: string;
    authors: AuthorInput[];
    genres: string[];
    total_pages: number;
    rating: number;
    isbn: number;
    published_date: Date;
    borrow_date: Date;
    return_date: Date;
    loan_status: number;
}

export interface BookInfo {
    book: {
        book_id: number;
        title: string;
        authors: string[];
        genres: string[];
        total_pages: number;
        rating: number;
        isbn: number;
        published_date: Date;
    };
    owner: {
        user_id: number;
        user_name: string;
        borrow_date: Date;
        return_date: Date;
    } | null;
    extension_request: Date | null;
    wishlist: Array<{
        user_id: number;
        user_name: string;
        request_date: Date;
    }> | null;
}

export interface UserData {
    user_id: number;
    user_name: string;
    user_role: string;
    registration_date: Date;
    loans: Array<{
        book_id: number;
        borrow_date: Date;
        return_date: Date;
    }> | null;
    wishlist: Array<{
        book_id: number;
        request_date: Date;
    }> | null;
    extension_requests: Array<{
        book_id: number;
        request_date: Date;
    }> | null;
} 