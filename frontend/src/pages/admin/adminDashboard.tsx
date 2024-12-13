import Header from "../../components/Header";
import { useState, useEffect } from "react";
import { BookData, UserData } from "../../components/structs";
import { getBooks, getUsers } from "../../components/api/DatabaseAPI";
import { Route, Routes } from "react-router";
import { AdminBookTable } from "../../components/libTable/AdminBookTable";
import { BookConrolPanel } from "./BookControlPanel";
import { UserTable } from "../../components/libTable/UserTable";

export default function AdminDashboard() {
  const [books, setBooks] = useState<BookData[]>([]);
  const [users, setUsers] = useState<UserData[]>([]);

  const fetchUsers = async () => {
    try {
      const fetchedUsers = await getUsers();
      setUsers(fetchedUsers);
    } catch (err) {
      console.error(err);
    }
  }

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
    fetchUsers()
    console.log(books);
  }, []);

  return (
    <>
      <Header />
      <h1>Admin</h1>
      <Routes>
        <Route path="/" element={
          <AdminBookTable books={books} users={users} updateBooks={fetchBooks} />
        } />
        <Route path="/usercontrol" element={
          <UserTable users={users} updateUsers={fetchUsers} />
        } />
        <Route path="/bookcontrol" element={
          <BookConrolPanel books={books} updateBooks={fetchBooks} />
        } />
      </Routes>
    </>
  )
}
