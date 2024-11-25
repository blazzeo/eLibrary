import { UserData } from "../components/structs";
import LoginForm from "../components/auth/LoginForm";
import { useState } from "react";
import RegisterForm from "../components/auth/RegisterForm";

interface Props {
  sendData: (data: UserData) => void;
}

export function LoginPage({ sendData }: Props) {
  const [noAccount, setNoAccount] = useState(false);

  function authorized(authData: UserData) {
    sessionStorage.setItem("authorized", "true");
    sessionStorage.setItem("username", authData.username);
    sessionStorage.setItem("password", authData.password);

    sendData(authData);
  }

  return (
    <>
      {noAccount ? (
        <RegisterForm createAccountCallback={() => setNoAccount(!noAccount)} />
      ) : (
        <LoginForm
          authorized={authorized}
          noAccountCallback={() => setNoAccount(!noAccount)}
        />
      )}
    </>
  );
}
