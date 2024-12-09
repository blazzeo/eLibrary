export type UserData = {
  username: string;
  password: string;
};

export type BookData = {
  book_id: number | null;
  title: string;
  total_pages: number;
  rating: number;
  isbn: string;
  published_date: Date;
};
