import { useState } from "react";
import { useMemo } from "react";
import {
  MaterialReactTable,
  useMaterialReactTable,
  type MRT_ColumnDef,
} from "material-react-table";

type Book = {
  book_id: number;
  title: string;
  total_pages: number;
  rating: number;
  isbn: string;
  published_date: Date;
};

interface Props {
  books: Book[];
}

export default function BookTable({ books }: Props) {
  const [booksArr] = useState<Book[]>(books);

  const columns = useMemo<MRT_ColumnDef<Book>[]>(
    () => [
      {
        accessorKey: "book_id", //access nested data with dot notation
        header: "Book ID",
        size: 150,
      },
      {
        accessorKey: "title",
        header: "Title",
        size: 150,
      },
      {
        accessorKey: "total_pages", //normal accessorKey
        header: "Pages",
        size: 150,
      },
      {
        accessorKey: "rating",
        header: "Rating",
        size: 150,
      },
      {
        accessorKey: "isbn",
        header: "ISBN",
        size: 200,
      },
      {
        accessorKey: "published_date",
        header: "Published",
        size: 150,
        Cell: ({ cell }) => {
          // Format the date for display
          const date = new Date(cell.getValue() as string);
          return date.toLocaleDateString(); // Adjust format as needed },
        },
      },
    ],
    []
  );

  const table = useMaterialReactTable<Book>({
    columns,
    data: booksArr, //data must be memoized or stable (useState, useMemo, defined outside of this component, etc.)
  });

  return <MaterialReactTable table={table} />;
}
