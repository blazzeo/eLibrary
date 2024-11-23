import { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { BookData } from "./components/structs";
import BookDataTable from "./components/libTable/BookTable";
import { getBooks } from "./components/api/DatabaseAPI";
import { LoginPage } from "./pages/LoginPage";

export default function App() {
  const [books, setBooks] = useState<BookData[]>([]);
  const [authorized, setAuthorized] = useState(
    sessionStorage.getItem("authorized") === "authorized" ? true : false
  );

  function authorize() {
    setAuthorized(true);
  }

  useEffect(() => {
    const fetchBooks = async () => {
      try {
        const bookData = await getBooks();
        console.log(bookData);
        setBooks(bookData);
      } catch (err) {
        console.error(err);
      }
    };

    fetchBooks();
  }, []);

  return authorized ? (
    <BookDataTable books={books} />
  ) : (
    <LoginPage sendData={authorize} />
  );
}
