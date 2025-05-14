import LoginForm from "../components/auth/loginForm";
import RegisterForm from "../components/auth/registerForm";
import { UserData } from "../components/structs";
import { useState } from "react";

interface Props {
	setRole: (role: string) => void;
}

export function AuthPage({ setRole }: Props) {
	const [noAccount, setNoAccount] = useState(false);

	function authorize(authData: UserData, role: string) {
		sessionStorage.setItem("userName", authData.user_name);
		sessionStorage.setItem("password", authData.user_password);

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
