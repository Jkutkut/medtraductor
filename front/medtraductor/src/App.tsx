import Login from "./components/login/Login";
import Profile from "./components/profile/Profile";
import UserProvider from "./context/UserProvider";
import googleAuth from "./hooks/googleAuth"

function App() {
  const gAuth = googleAuth();
  const {login, profile} = gAuth;
  if (!profile) {
    return <Login login={login} />
  }
  return <>
    <UserProvider gAuth={gAuth}>
      <h1>medtraductor</h1>
      <Profile />
    </UserProvider>
  </>;
}

export default App
