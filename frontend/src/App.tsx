// import { useState } from "react";
import "bootstrap/dist/css/bootstrap.css";
import { LoginPage } from "./pages/LoginPage";
import { UserData } from "./components/structs";

export default function App() {
  function sendData(userData: UserData) {
    console.log(userData.username);
  }

  return <LoginPage sendData={sendData} />;
}
