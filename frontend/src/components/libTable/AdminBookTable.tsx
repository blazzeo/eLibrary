import { useEffect, useState, useMemo } from "react";
import {
  MaterialReactTable,
  useMaterialReactTable,
  type MRT_ColumnDef,
} from "material-react-table";
import { BookData, UserData, BookLoan } from "../structs";
import { getLoans, returnBook } from "../api/DatabaseAPI";

interface Props {
  books: BookData[];
  users: UserData[];
  updateBooks: () => void;
}

export function AdminBookTable({ books, users, updateBooks }: Props) {
  const [bookLoans, setBookLoans] = useState<BookLoan[]>([]); // Состояние для хранение данных о займах

  const fetchLoans = async () => {
    const loans = await getLoans();
    setBookLoans(loans);
  };

  useEffect(() => {
    fetchLoans();
  }, []); // Загружаем данные только один раз при монтировании компонента

  const hasOwner = (bookId: number): boolean => {
    return !!bookLoans.find((loan) => loan.book_id === bookId);
  };

  // Проверка, что пользователи уже загружены
  const getOwnerName = (bookId: number): string | null => {
    const bookOwner = bookLoans.find((loan) => loan.book_id === bookId);
    if (bookOwner) {
      // Проверяем, что users не пустой
      if (users.length === 0) {
        console.warn("Users data is empty");
        return null;
      }
      console.log(users);
      const owner = users.find((user) => user.user_name === bookOwner.user_name);
      return owner ? owner.user_name : "Unknown Owner";
    }
    return null; // Если владельца нет
  };

  const columns = useMemo<MRT_ColumnDef<BookData>[]>(
    () => [
      {
        accessorKey: "book_id",
        header: "Book ID",
        size: 50,
      },
      {
        accessorKey: "title",
        header: "Title",
        size: 150,
      },
      {
        accessorKey: "total_pages",
        header: "Pages",
        size: 50,
      },
      {
        accessorKey: "rating",
        header: "Rating",
        size: 50,
      },
      {
        accessorKey: "published_date",
        header: "Published",
        size: 50,
        Cell: ({ cell }) => {
          const date = new Date(cell.getValue() as string);
          return date.toLocaleDateString();
        },
      },
      {
        header: "Owner",
        size: 50,
        Cell: ({ row }) => {
          const bookId = row.original.book_id;
          const ownerName = getOwnerName(bookId);
          return ownerName || "Available"; // Если владельца нет, выводим "Available"
        },
      },
      {
        header: "Return",
        size: 50,
        Cell: ({ row }) => {
          const handleReturn = async () => {
            const bookId = row.original.book_id;
            await returnBook(bookId);
            setBookLoans((prevLoans) => prevLoans.filter((loan) => loan.book_id !== bookId));
            updateBooks();
          };

          return hasOwner(row.original.book_id) ? (
            <button className="btn btn-success" onClick={handleReturn}>
              Return
            </button>
          ) : null;
        },
      },
      {
        header: "Edit",
        size: 50,
        Cell: ({ row }) => {
          const handleEdit = () => {
            console.log("Edit functionality is not yet implemented.");
            // Реализуйте функциональность редактирования по мере необходимости
          };
          return (
            <button className="btn btn-success" onClick={handleEdit}>
              Edit
            </button>
          );
        },
      },
    ],
    [bookLoans, users] // Пересчитываем столбцы при изменении данных о книгах и пользователях
  );

  const table = useMaterialReactTable<BookData>({
    columns,
    data: books,
  });

  return <MaterialReactTable table={table} />;
}
