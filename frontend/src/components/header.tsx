import { Link, useNavigate } from "react-router-dom";

export default function Header() {
  const userName = sessionStorage.getItem("userName")
  const userRole = sessionStorage.getItem("userRole")
  const navigate = useNavigate()

  function logout() {
    sessionStorage.clear()
    navigate("/")
    console.log("cleck");
  }

  return (
    <div className="container">
      <nav className="navbar navbar-expand-md navbar-light">
        <div className="container-fluid">
          <Link className="navbar-brand" to="/">Library</Link>
          {userRole === 'user' ? <Link className="nav-link" to="/mybooks">Book Shelf</Link> : null}
          {userRole === 'admin' ? <Link className="nav-link" to="/usercontrol">User Control</Link> : null}
          {userRole === 'admin' ? <Link className="nav-link" to="/addbook">AddBook</Link> : null}
          <div className="d-flex align-items-center">
            <span className="me-3">
              {userName}
              <span className="text-success" style={{ fontFamily: "'Courier New', monospace", fontWeight: "bold" }}>
                :{userRole}
              </span>
            </span>
            <button className="btn btn-outline-danger" onClick={logout}>
              <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M15 16.5V19C15 20.1046 14.1046 21 13 21H6C4.89543 21 4 20.1046 4 19V5C4 3.89543 4.89543 3 6 3H13C14.1046 3 15 3.89543 15 5V8.0625M11 12H21M21 12L18.5 9.5M21 12L18.5 14.5" stroke="#000000" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </button>
          </div>
        </div>
      </nav >
    </div >
  );
}
