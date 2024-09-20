import { useState } from 'react'

export default function loginForm() {
  const [userMail, setMail] = useState('');
  const [userLogin, setLogin] = useState('');
  const [userPassword, setPassword] = useState('');

  function validateForm() {
    if(checkAvailableMail(userMail) && 
        checkAvailableLogin(userLogin) && 
        userPassword.length > 7) {
      createUser(userMail, userLogin, userPassword);
    }
  }

  return (
    <>
      <h1>Register Form</h1>
      <input type="email" content={userMail} placeholder="Email"/>
      <input type="text" content={userLogin} placeholder="Login"/>
      <input type="password" content={userPassword} placeholder="Password"/>
      <input type="submit" onClick={validateForm}/>
    </>
  )
}

