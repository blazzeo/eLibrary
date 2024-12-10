import axios, { AxiosResponse } from "axios";
import { BookData, UserData } from "../structs";

const BACK_PORT = 3000;

export async function checkUser({ username, password }: UserData) {
  try {
    const response = await axios.get(
      `http://localhost:${BACK_PORT}/api/checkuser`,
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
      `http://localhost:${BACK_PORT}/api/checklogin`,
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
      `http://localhost:${BACK_PORT}/api/createuser`,
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

export async function getBooks(userId: number) {
  try {
    const response: AxiosResponse<BookData[]> = await axios.get(
      `http://localhost:${BACK_PORT}/api/getbooks?user_id=${userId}`
    );

    return response.data;
  } catch (error) {
    console.error("Error fetching books:", error);
    throw error;
  }
}

export async function addBook(book: BookData) {
  try {
    const response = await axios.post(`http://localhost:${BACK_PORT}/api/addbook`, book)
    return response.data
  } catch (error) {
    console.error(error)
    throw error
  }
}
