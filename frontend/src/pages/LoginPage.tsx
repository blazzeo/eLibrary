// import { useState } from "react";
import { UserData } from "../components/structs";
import LoginForm from "../components/auth/loginForm";

interface Props {
  sendData: (data: UserData) => void;
}

export function LoginPage({ sendData }: Props) {
  function authorized(authData: UserData) {
    sessionStorage.setItem("authorized", "true");
    sessionStorage.setItem("username", authData.username);
    sessionStorage.setItem("password", authData.password);

    sendData(authData);
  }

  return (
    <>
      <LoginForm authorized={authorized} />
    </>
  );
}
