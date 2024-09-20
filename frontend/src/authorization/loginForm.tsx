import { useState } from 'react'

function loginForm() {
  const [userLogin, setLogin] = useState('');
  const [userPassword, setPassword] = useState('');

  function validateForm() {
    if (checkUser(userLogin, userPassword)) {
      //  Success
    } else {
      //  Error
    }
  }

  return (
    <>
      <h1>Login Form</h1>
      <input type="text" content={userLogin} placeholder="Login"/>
      <input type="password" placeholder="Password"/>
      <input type="submit" onClick={validateForm}/>
    </>
  )
}


export default loginForm;
