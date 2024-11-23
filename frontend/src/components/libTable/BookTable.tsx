import { useMemo } from "react";
import {
  MaterialReactTable,
  useMaterialReactTable,
  type MRT_ColumnDef,
} from "material-react-table";
import { BookData } from "../structs";

interface Props {
  books: BookData[];
}

export default function BookDataTable({ books }: Props) {
  const columns = useMemo<MRT_ColumnDef<BookData>[]>(
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

  const table = useMaterialReactTable<BookData>({
    columns,
    data: books, // используйте переданные данные
  });

  return <MaterialReactTable table={table} />;
}
