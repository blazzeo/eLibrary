import LoginForm from "../components/auth/loginForm";
import RegisterForm from "../components/auth/registerForm";
import { useState } from "react";

interface Props {
	setRole: (role: string) => void;
}

export function AuthPage({ setRole }: Props) {
	const [noAccount, setNoAccount] = useState(false);

	function authorize(user_name: string, role: string) {
		sessionStorage.setItem("userName", user_name);
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
