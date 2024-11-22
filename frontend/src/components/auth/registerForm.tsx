import { useState } from 'react'
import { checkAvailableLogin, createUser } from '../api/formFuncs'

const RegisterForm = () => {
  const [userLogin, setLogin] = useState('');
  const [userPassword, setPassword] = useState('');

  async function validateForm() {
    const loginAvailable = await checkAvailableLogin(userLogin);
    if(loginAvailable && userPassword.length > 7) {
      let result = await createUser(userLogin, userPassword);
      if(result.status = 200) {
        console.log("SUCCESS")
      } else {
        console.log("ERROR")
      }
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

export default RegisterForm;
