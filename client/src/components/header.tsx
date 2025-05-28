import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";
import { useLibrary } from "../context/libraryContext";
import { useAuth } from "../context/authContext";

export default function Header() {
	const navigate = useNavigate();
	const { user, clearLibraryState } = useLibrary();
	const { logout } = useAuth();
	const [isOpen, setIsOpen] = useState(false);

	const handleLogout = () => {
		clearLibraryState(); // Сначала очищаем состояние библиотеки
		logout(); // Затем выполняем выход через AuthContext
	};

	return (
		<div className="container-fluid bg-info py-2">
			<nav className="navbar navbar-expand-md navbar-light">
				<div className="container">
					<Link className="navbar-brand fw-bold text-white" to="/">
						Библиотека
					</Link>

					{/* Toggle button */}
					<button
						className="navbar-toggler"
						type="button"
						onClick={() => setIsOpen(!isOpen)}
					>
						<span className="navbar-toggler-icon"></span>
					</button>

					{/* Collapsible menu */}
					<div className={`collapse navbar-collapse ${isOpen ? "show" : ""}`}>
						<ul className="navbar-nav me-auto mb-2 mb-md-0">
							{user?.user_role === "user" && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/bookshelf">
											Мои книги
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/wishlist">
											Мои брони
										</Link>
									</li>
								</>
							)}
							{user?.user_role === "admin" && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/usercontrol">
											Пользователи
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/requests">
											Запросы
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/addbook">
											Добавить книгу
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/createmoder">
											Добавить пользователя
										</Link>
									</li>
								</>
							)}
							{user?.user_role === "moder" && (
								<>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/usercontrol">
											Пользователи
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/requests">
											Запросы
										</Link>
									</li>
									<li className="nav-item">
										<Link className="nav-link text-white" to="/createloan">
											Добавить бронь
										</Link>
									</li>
								</>
							)}
						</ul>
						<div className="d-flex align-items-center">
							<span className="me-3 text-white">
								{user?.user_name}
								<span
									className="text-dark"
									style={{ fontFamily: "'Courier New', monospace", fontWeight: "bold" }}
								>
									:{user?.user_role}
								</span>
							</span>
							{/* Profile Button */}
							<button
								className="btn btn-outline-light me-2" // Added me-2 for margin between buttons
								onClick={() => navigate('/profile')} // Navigate to /profile on click
								title="Мой профиль"
							>
								Мой профиль
							</button>

							{/* Original Logout Button */}
							<button className="btn btn-outline-light" onClick={handleLogout} title="Выйти">
								<svg
									width="20px"
									height="20px"
									viewBox="0 0 24 24"
									fill="none"
									xmlns="http://www.w3.org/2000/svg"
								>
									<path
										d="M15 16.5V19C15 20.1046 14.1046 21 13 21H6C4.89543 21 4 20.1046 4 19V5C4 3.89543 4.89543 3 6 3H13C14.1046 3 15 3.89543 15 5V8.0625M11 12H21M21 12L18.5 9.5M21 12L18.5 14.5"
										stroke="#ffffff"
										strokeWidth="2"
										strokeLinecap="round"
										strokeLinejoin="round"
									/>
								</svg>
							</button>
						</div>
					</div>
				</div>
			</nav>
		</div>
	);
}
