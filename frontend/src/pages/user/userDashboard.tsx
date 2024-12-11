import Header from "../../components/Header";
import { useState, useEffect } from "react";
import BookDataTable from "../../components/libTable/BookTable";
import { BookData } from "../../components/structs";
import { getBooks } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import { BookShelf } from "../../components/libTable/BookShelf";

export default function UserDashboard() {
  const [books, setBooks] = useState<BookData[]>([]);

  const fetchBooks = async () => {
    try {
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
      <Routes>
        <Route path="/" element={
          <BookDataTable books={books} updateBooks={fetchBooks} />
        } />
        <Route path="/mybooks" element={
          <BookShelf books={books.filter(x => x.loan_status === 1)} updateBooks={fetchBooks} />
        } />
      </Routes>
    </>
  );
}
