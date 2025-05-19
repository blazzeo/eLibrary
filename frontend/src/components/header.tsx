import { Link, useNavigate } from "react-router-dom";

export default function Header() {
	const userName = sessionStorage.getItem("userName")
	const userRole = sessionStorage.getItem("userRole")
	const navigate = useNavigate()

	function logout() {
		sessionStorage.clear()
		navigate("/")
	}

	return (
		<div className="container-fluid bg-info py-2">
			<nav className="navbar navbar-expand-md navbar-light">
				<div className="container">
					<Link className="navbar-brand fw-bold text-white" to="/">
						Библиотека
					</Link>

					<div className="collapse navbar-collapse">
						<ul className="navbar-nav me-auto mb-2 mb-md-0">
							{userRole === 'user' && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/bookshelf">Мои книги</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/wishlist">Мои избранные</Link>
									</li>
								</>
							)}
							{userRole === 'admin' && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/usercontrol">Пользователи</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/addbook">Добавить книгу</Link>
									</li>
								</>
							)}
							{userRole === 'moder' && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/usercontrol">Пользователи</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/requests">Запросы</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/createloan">Добавить бронь</Link>
									</li>
								</>
							)}
						</ul>
						<div className="d-flex align-items-center">
							<span className="me-3 text-white">
								{userName}
								<span className="text-dark" style={{ fontFamily: "'Courier New', monospace", fontWeight: "bold" }}>
									:{userRole}
								</span>
							</span>
							<button className="btn btn-outline-light" onClick={logout} title="Выйти">
								<svg width="20px" height="20px" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path d="M15 16.5V19C15 20.1046 14.1046 21 13 21H6C4.89543 21 4 20.1046 4 19V5C4 3.89543 4.89543 3 6 3H13C14.1046 3 15 3.89543 15 5V8.0625M11 12H21M21 12L18.5 9.5M21 12L18.5 14.5"
										stroke="#ffffff" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
								</svg>
							</button>
						</div>
					</div>
				</div>
			</nav>
		</div>
	);
}
