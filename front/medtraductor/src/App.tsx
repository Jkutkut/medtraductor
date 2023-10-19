import {Navigate, Route, Routes} from "react-router-dom";
import Login from "./components/login/Login";
import Profile from "./components/profile/Profile";
import UserProvider from "./context/UserProvider";
import googleAuth from "./hooks/googleAuth"
import ErrorPage from "./components/errors/ErrorPage";
import Header from "./components/header/Header";
import Browser from "./pages/browser/Browser";
import Question from "./pages/question/Question";
import Questions from "./pages/question/Questions";

function App() {
  const gAuth = googleAuth();
  const {login, logout, profile} = gAuth;
  if (!profile) {
    return <>
      <Routes>
        <Route path="/login" element={<Login login={login} />} />
        <Route path="/*" element={<Navigate to="/login" />} />
      </Routes>
    </>;
  }
  return <>
    <UserProvider gAuth={gAuth}>
      <Header profile={profile} logout={logout} />
      <Routes>
        <Route path="/" element={<Navigate to="/questions"/>} />
        <Route path="profile" element={<Profile />} />
        <Route path="login" element={<Navigate to="/"/>} />
        <Route path="questions" element={<Questions />}>
          <Route index element={<Browser />} />
          <Route path=":id/:title" element={<Question />} />
        </Route>
        <Route path="/*" element={<ErrorPage/>} />
      </Routes>
    </UserProvider>
  </>;
}

export default App
