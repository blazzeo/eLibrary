import axios, { AxiosResponse } from "axios";
import { BookData, UserData } from "../structs";

const SERVER = 'http://localhost:3000'

export async function checkUser({ username, password }: UserData) {
  try {
    const response = await axios.get(
      SERVER + `/api/checkuser`,
      {
        params: {
          login: username,
          password: password,
        },
      }
    );
    return response.data;
  } catch (error) {
    console.error(`Error checking user: ${error}`);
    throw error;
  }
}

export async function checkAvailableLogin(userLogin: string) {
  try {
    const response = await axios.get(
      SERVER + `/api/checklogin`,
      {
        params: { login: userLogin },
      }
    );
    return response.data;
  } catch (error) {
    console.error("Error checking login:", error);
    throw error;
  }
}

export async function createUser({ username, password }: UserData) {
  try {
    const response = await axios.get(
      SERVER + `/api/createuser`,
      {
        params: {
          login: username,
          password: password,
        },
      }
    );
    return response.data;
  } catch (error) {
    console.error(`Error creating user: ${error}`);
    throw error;
  }
}

export async function getBooks(username: string | null) {
  try {
    if (username === null)
      throw "invalid username"
    const response: AxiosResponse<BookData[]> = await axios.get(
      SERVER + `/api/getbooks?username=${username}`
    );

    return response.data;
  } catch (error) {
    console.error("Error fetching books:", error);
    throw error;
  }
}

export async function addBook(book: BookData) {
  try {
    const response = await axios.post(SERVER + `/api/addbook`, book)
    return response.data
  } catch (error) {
    console.error(error)
    throw error
  }
}

export async function borrowBook(username: string | null, bookId: number | null) {
  try {
    if (username === null || bookId === null)
      throw 'invalid username or bookid'
    const response = await axios.post(SERVER + `/api/borrowbook`, { user_name: username, book_id: bookId })
    return response.data
  } catch (error) {
    console.error(error)
    throw error
  }
}

export async function returnBook(bookId: number | null) {
  try {
    if (bookId === null)
      throw 'invalid bookid'
    const response = await axios.post(SERVER + `/api/returnbook`, { book_id: bookId })
    return response.data
  } catch (error) {
    console.error(error)
    throw error
  }
}
