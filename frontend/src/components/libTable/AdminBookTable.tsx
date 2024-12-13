import { useEffect, useMemo } from "react";
import {
  MaterialReactTable,
  useMaterialReactTable,
  type MRT_ColumnDef,
} from "material-react-table";
import { BookData, UserData } from "../structs";
import { getLoans, returnBook } from "../api/DatabaseAPI";

interface Props {
  books: BookData[];
  users: UserData[];
  updateBooks: () => void;
}

type BookLoan = {
  user_id: number,
  user_name: string,
  book_id: number
}

export function AdminBookTable({ books, users, updateBooks }: Props) {
  let bookLoans: BookLoan[];

  const fetchLoans = async () => {
    bookLoans = await getLoans();
    console.log(bookLoans);
  }

  const hasOwner = (bookId: number | null) => {
    return bookLoans.find(loan => loan.book_id == bookId);
  }

  useEffect(() => {
    fetchLoans()
  })

  const columns = useMemo<MRT_ColumnDef<BookData>[]>(
    () => [
      {
        accessorKey: "book_id", //access nested data with dot notation
        header: "Book ID",
        size: 50,
      },
      {
        accessorKey: "title",
        header: "Title",
        size: 150,
      },
      {
        accessorKey: "total_pages", //normal accessorKey
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
          // Format the date for display
          const date = new Date(cell.getValue() as string);
          return date.toLocaleDateString(); // Adjust format as needed },
        },
      },
      {
        header: "Owner",
        size: 50,
        Cell: ({ row }) => {
          const bookId = row.original.book_id;
          const bookOwner = bookLoans.find(loan => loan.book_id == bookId);
          const ownerName = users.find(user => user.username == bookOwner?.user_name)
          return ownerName === undefined ? null : ownerName.username;
        },
      },
      {
        header: "Return",
        size: 50,
        Cell: ({ row }) => {
          const handleReturn = async () => {
            const bookId = row.original.book_id
            await returnBook(bookId)
            updateBooks()
          }
          return (hasOwner(row.original.book_id) ?
            <button className="btn btn-success" onClick={handleReturn} >
              Return
            </button> :
            null
          )
        }
      },
      {
        header: "Edit",
        size: 50,
        Cell: ({ row }) => {
          const handleEdit = async () => {
            const bookId = row.original.book_id
            await returnBook(bookId)
            updateBooks()
          }
          return <button className="btn btn-success" onClick={handleEdit} >
            Edit
          </button>
        }
      },
    ],
    []
  );

  const table = useMaterialReactTable<BookData>({
    columns,
    data: books,
  });

  return <MaterialReactTable table={table} />;
}
