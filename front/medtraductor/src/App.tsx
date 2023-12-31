import {Navigate, Route, Routes, useSearchParams} from "react-router-dom";
import Login from "./pages/login/Login";
import Profile from "./components/profile/Profile";
import UserProvider from "./context/UserProvider";
import googleAuth from "./hooks/googleAuth"
import ErrorPage from "./components/errors/ErrorPage";
import Header from "./components/header/Header";
import Browser from "./pages/browser/Browser";
import QuestionDetail from "./pages/question/QuestionDetail";
import Questions from "./pages/question/Questions";
import SaveUrlAndRedirect from "./components/router/SaveUrlAndRedirect";
import Loading from "./components/loading/Loading";

const App = () => {
  const gAuth = googleAuth();
  const {isLoading, login, logout, profile} = gAuth;
  const [searchParams] = useSearchParams();
  if (isLoading) {
    return <Loading/>;
  }
  if (!profile) {
    return <>
      <Routes>
        <Route path="/login" element={<Login login={login} />} />
        <Route path="/*" element={<SaveUrlAndRedirect to="/login"/>} />
      </Routes>
    </>;
  }
  if (searchParams.has("then")) {
    return <Navigate to={searchParams.get("then") || "/"} replace={true} />;
  }
  return <>
    <UserProvider gAuth={gAuth}>
      <Header profile={profile} logout={logout} />
      <div className="mx-2 pb-3">
        <Routes>
          <Route path="/" element={<Navigate to="/questions"/>} />
          <Route path="profile" element={<Profile />} />
          <Route path="login" element={<Navigate to="/"/>} />
          <Route path="questions" element={<Questions />}>
            <Route index element={<Browser />} />
            <Route path=":id/:title" element={<QuestionDetail />} />
          </Route>
          <Route path="/*" element={<ErrorPage/>} />
        </Routes>
      </div>
    </UserProvider>
  </>;
}

export default App
