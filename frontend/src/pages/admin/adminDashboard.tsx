import Header from "../../components/Header";
import { useState, useEffect } from "react";
import { BookData, UserData } from "../../components/structs";
import { getBooks, getUsers } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import { AdminBookTable } from "../../components/libTable/AdminBookTable";
import { UserTable } from "../../components/libTable/UserTable";
import { AddBookForm } from "../../components/forms/AddBookForm";
import { EditBookForm } from "../../components/forms/EditBookForm";

export default function AdminDashboard() {
  const [books, setBooks] = useState<BookData[]>([]);
  const [users, setUsers] = useState<UserData[]>([]);
  const [editBook, setEditBook] = useState<BookData | null>(null); // To track if we need to show the overlay

  const fetchUsers = async () => {
    try {
      const fetchedUsers = await getUsers();
      setUsers(fetchedUsers);
    } catch (err) {
      console.error(err);
    }
  };

  const fetchBooks = async () => {
    try {
      const userName = sessionStorage.getItem("userName");
      const bookData = await getBooks(userName);
      setBooks(bookData);
    } catch (err) {
      console.error(err);
    }
  };

  const editBookCallback = (book: BookData) => {
    setEditBook(book); // Set the book to be edited
  };

  const closeEditBookModal = () => {
    setEditBook(null); // Close the modal by setting editBook to null
  };

  useEffect(() => {
    fetchUsers();
    fetchBooks();
  }, []);

  return (
    <>
      <Header />
      <Routes>
        <Route
          path="/"
          element={
            <AdminBookTable
              books={books}
              users={users}
              updateBooks={fetchBooks}
              editBook={editBookCallback}
            />
          }
        />
        <Route
          path="/usercontrol"
          element={<UserTable users={users} updateUsers={fetchUsers} />}
        />
        <Route
          path="/addbook"
          element={<AddBookForm updateBooks={fetchBooks} />}
        />
      </Routes>

      {/* Modal Overlay for EditBookForm */}
      {editBook && (
        <div className="modal-overlay">
          <div className="modal-content">
            <button className="close-btn" onClick={closeEditBookModal}>
              &times;
            </button>
            <EditBookForm book={editBook} updateBooks={fetchBooks} />
          </div>
        </div>
      )}

      <style>{`
        .modal-overlay {
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: rgba(0, 0, 0, 0.5);
          display: flex;
          justify-content: center;
          align-items: center;
          z-index: 1000;
        }

        .modal-content {
          background-color: white;
          padding: 20px;
          border-radius: 8px;
          position: relative;
          max-width: 600px;
          width: 100%;
        }

        .close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
          font-size: 24px;
          border: none;
          background: transparent;
          cursor: pointer;
        }
      `}</style>
    </>
  );
}
