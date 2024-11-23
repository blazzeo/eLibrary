import axios, { AxiosResponse } from "axios";
import { BookData, UserData } from "../structs";

const BACK_PORT = 3000;

export async function checkUser({ username, password }: UserData) {
  const response = await axios.get(
    `http://localhost:${BACK_PORT}/api/checkuser`,
    {
      params: {
        login: username,
        password: password,
      },
    }
  );
  if (response.status == 200) {
    return true;
  }
  return false;
}

export async function checkAvailableLogin(userLogin: string) {
  const response = await axios.get(
    `http://localhost:${BACK_PORT}/api/checklogin`,
    {
      params: { login: userLogin },
    }
  );
  return response;
}

export async function createUser({ username, password }: UserData) {
  const response = await axios.get(
    `http://localhost:${BACK_PORT}/api/createuser`,
    {
      params: {
        login: username,
        password: password,
      },
    }
  );
  return response;
}

export async function getBooks() {
  try {
    const response: AxiosResponse<BookData[]> = await axios.get(
      `http://localhost:${BACK_PORT}/api/get_books`
    );

    return response.data;
  } catch (error) {
    console.error("Error fetching books:", error);
    throw error; // Можно выбросить ошибку дальше или вернуть значение по умолчанию
  }
}
