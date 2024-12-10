import Header from "../../components/Header";
import { useState, useEffect } from "react";
import BookDataTable from "../../components/libTable/BookTable";
import { BookData } from "../../components/structs";
import { getBooks } from "../../components/api/DatabaseAPI";

export default function UserDashboard() {
  const [books, setBooks] = useState<BookData[]>([]);

  useEffect(() => {
    const fetchBooks = async () => {
      try {
        const userName = sessionStorage.getItem("userName")
        const bookData = await getBooks(userName)
        console.log(bookData)
        setBooks(bookData)
      } catch (err) {
        console.error(err)
      }
    };

    fetchBooks()
  }, []);
  return (
    <>
      <Header />
      <BookDataTable books={books} />
    </>
  );
}
