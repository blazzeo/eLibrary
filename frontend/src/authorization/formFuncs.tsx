import { useState } from 'react'
import axios from 'axios'

export async function checkUser(userLogin: string, userPassword: string) {
  const response = await axios.get('/api/checkuser', {
    params: {
      login: userLogin,
      password: userPassword
    }
  });
  if (response.status = 200) {
    return true;
  }
  return false;
}

export async function checkAvailableLogin(userLogin: string) {
  const response = await axios.get('/api/checklogin', {
    params: { login: userLogin }
  });
  return response;
}

export async function createUser(userLogin: string, userPassword: string) {
  const response = await axios.get('/api/createuser', {
    params: {
      login: userLogin,
      password: userPassword
    }
  });
  return response;
}
