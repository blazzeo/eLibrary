import axios from "axios";
import { UserData } from "../structs";

const BACK_PORT = 5000;

export async function checkUser({ username, password }: UserData) {
  const response = await axios.get(`localhost:${BACK_PORT}/api/checkuser`, {
    params: {
      login: username,
      password: password,
    },
  });
  if (response.status == 200) {
    return true;
  }
  return false;
}

export async function checkAvailableLogin(userLogin: string) {
  const response = await axios.get(`localhost:${BACK_PORT}/api/checklogin`, {
    params: { login: userLogin },
  });
  return response;
}

export async function createUser({ username, password }: UserData) {
  const response = await axios.get(`localhost:${BACK_PORT}/api/createuser`, {
    params: {
      login: username,
      password: password,
    },
  });
  return response;
}
