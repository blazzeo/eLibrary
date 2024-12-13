import { BookData } from "../../components/structs";
import { Route, Routes } from "react-router";

interface Props {
  books: BookData[];
  updateBooks: () => void;
}

export function BookConrolPanel({ books, updateBooks }: Props) {

  return (
    <Routes>
    </Routes>
  )
}
