import Header from "../../components/Header";
import { useState, useEffect } from "react";
import BookDataTable from "../../components/libTable/BookTable";
import { BookData } from "../../components/structs";
import { getBooks } from "../../components/api/DatabaseAPI";

export default function UserDashboard() {
  const [books, setBooks] = useState<BookData[]>([]);

  const fetchBooks = async () => {
    try {
      sessionStorage.setItem("userName", "test")
      const userName = sessionStorage.getItem("userName")
      const bookData = await getBooks(userName)
      setBooks(bookData)
    } catch (err) {
      console.error(err)
    }
  };

  useEffect(() => {
    fetchBooks()
    console.log(books);

  }, []);

  return (
    <>
      <Header />
      <h1>User</h1>
      <BookDataTable books={books} updateBooks={fetchBooks} />
    </>
  );
}
