import { useState } from 'react'
import { checkAvailableLogin, checkUser, createUser } from './formFuncs';

export default function loginForm() {
  const [userLogin, setLogin] = useState('');
  const [userPassword, setPassword] = useState('');

  async function validateForm() {
    const loginAvailable = await checkAvailableLogin(userLogin);
    if(loginAvailable && userPassword.length > 7) {
      createUser(userLogin, userPassword);
    }
  }

  return (
    <>
      <h1>Register Form</h1>
      <input type="text" content={userLogin} placeholder="Login"/>
      <input type="password" content={userPassword} placeholder="Password"/>
      <input type="submit" onClick={validateForm}/>
    </>
  )
}

