import { useState } from "react";
import GuestPage from "./components/GuestPage";
import UserPage from "./components/UserPage";
import "./App.css";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  function login() {
    setIsLoggedIn(true);
  }

  function logout() {
    setIsLoggedIn(false);
  }

  return (
    <div className="container">
      <h1>Flight Ticket Booking Application</h1>

      {isLoggedIn ? (
        <>
          <button onClick={logout}>Logout</button>
          <UserPage />
        </>
      ) : (
        <>
          <button onClick={login}>Login</button>
          <GuestPage />
        </>
      )}
    </div>
  );
}

export default App;