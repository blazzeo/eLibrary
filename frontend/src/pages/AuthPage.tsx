import { UserData } from "../components/structs";
import LoginForm from "../components/auth/LoginForm";
import { useState } from "react";
import RegisterForm from "../components/auth/RegisterForm";

interface Props {
  setRole: (role: string) => void;
}

export function AuthPage({ setRole }: Props) {
  const [noAccount, setNoAccount] = useState(false);

  function authorize(authData: UserData, role: string) {
    sessionStorage.setItem("userName", authData.username);
    sessionStorage.setItem("password", authData.password);

    setRole(role);
  }

  return (
    <>
      {noAccount ? (
        <RegisterForm createAccountCallback={() => setNoAccount(!noAccount)} />
      ) : (
        <LoginForm
          authorizeCallback={authorize}
          noAccountCallback={() => setNoAccount(!noAccount)}
        />
      )}
    </>
  );
}
