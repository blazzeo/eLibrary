import { useState } from "react";
import { BookData } from "../structs";
import { editBook } from "../api/DatabaseAPI";

interface Props {
  book: BookData | null;
  updateBooks: () => void;
}

export function EditBookForm({ book, updateBooks }: Props) {

  if (!book) {
    return <div>No book found</div>; // If no book found, render an error
  }

  const [title, setTitle] = useState(book.title);
  const [totalPages, setTotalPages] = useState<number>(book.total_pages);
  const [rating, setRating] = useState<number>(book.rating);
  const [isbn, setIsbn] = useState(book.isbn);
  const [publishedDate, setPublishedDate] = useState<Date | string>(new Date(book.published_date));
  const [error, setError] = useState<null | string>(null);
  const [success, setSuccess] = useState<null | string>(null);

  const validateForm = (): boolean => {
    if (!title || !totalPages || !rating || !publishedDate) {
      setError("All fields are required!");
      return false;
    }
    return true;
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (!validateForm()) return;

    setError(null);
    setSuccess(null);

    const updatedBook: BookData = {
      book_id: book.book_id,
      title: title,
      total_pages: totalPages,
      rating: rating,
      isbn: isbn,
      published_date: new Date(publishedDate || Date.now()),
      loan_status: book.loan_status, // Keep the original loan status
    };

    try {
      const response = await editBook(updatedBook);
      console.log(response);

      if (!response || response[0].edit_book == false) {
        throw new Error("Failed to update the book");
      }

      setTitle("");
      setTotalPages(0);
      setRating(0);
      setIsbn("");
      setPublishedDate(""); // Reset date
      setSuccess("Book updated successfully!");
      updateBooks();
    } catch (error) {
      setError(error instanceof Error ? error.message : "Unknown error occurred.");
    }
  };

  return (
    <div className="container mt-5">
      <h2 className="mb-4">Edit Book</h2>
      <form onSubmit={handleSubmit} className="needs-validation" noValidate>
        <div className="mb-3">
          <label htmlFor="title" className="form-label">
            Title
          </label>
          <input
            type="text"
            id="title"
            className="form-control"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="totalPages" className="form-label">
            Total Pages
          </label>
          <input
            type="number"
            id="totalPages"
            className="form-control"
            value={totalPages}
            onChange={(e) => setTotalPages(Number(e.target.value))}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="rating" className="form-label">
            Rating
          </label>
          <input
            type="number"
            id="rating"
            step="0.01"
            className="form-control"
            value={rating}
            onChange={(e) => setRating(Number(e.target.value))}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="isbn" className="form-label">
            ISBN
          </label>
          <input
            type="text"
            id="isbn"
            className="form-control"
            value={isbn}
            onChange={(e) => setIsbn(e.target.value)}
            required
          />
        </div>
        <div className="mb-3">
          <label htmlFor="publishedDate" className="form-label">
            Published Date
          </label>
          <input
            type="date"
            id="publishedDate"
            className="form-control"
            value={publishedDate.toLocaleString()}
            onChange={(e) => setPublishedDate(e.target.value.toString())}
            required
          />
        </div>
        <button type="submit" className="btn btn-primary">
          Save Changes
        </button>
      </form>

      {error && (
        <div className="mt-3">
          <div className="alert alert-danger" role="alert">
            {error}
          </div>
        </div>
      )}

      {success && (
        <div className="mt-3">
          <div className="alert alert-success" role="alert">
            {success}
          </div>
        </div>
      )}
    </div>
  );
}
