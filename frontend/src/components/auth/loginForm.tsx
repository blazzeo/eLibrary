import { useState } from 'react'
import { checkUser } from '../api/formFuncs';

const LoginForm = () => {
  const [userLogin, setLogin] = useState('');
  const [userPassword, setPassword] = useState('');

  async function validateForm() {
    const userExists = await checkUser(userLogin, userPassword);
    if (userExists) {
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
      <p className='error_msg'>Invalid Login or Password</p>
      <input type="submit" onClick={validateForm}/>
    </>
  )
}


export default LoginForm;
