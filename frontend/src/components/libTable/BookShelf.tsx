import { useMemo } from "react";
import {
  MaterialReactTable,
  useMaterialReactTable,
  type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../structs";
import { returnBook } from "../api/DatabaseAPI";

interface Props {
  books: BookData[];
  updateBooks: () => void;
}

export function BookShelf({ books, updateBooks }: Props) {
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
        accessorKey: "loan_status",
        header: "Action",
        size: 50,
        Cell: ({ row }) => {
          const handleReturn = async () => {
            const bookId = row.original.book_id
            await returnBook(bookId)
            updateBooks()
          }
          return <button className="btn btn-success" onClick={handleReturn}>
            Return
          </button>
        },
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
