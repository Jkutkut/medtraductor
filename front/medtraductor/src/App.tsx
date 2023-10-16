import googleAuth from "./hooks/googleAuth"

function App() {
  const {login, logout, profile} = googleAuth();
  return (
    <>
      <h1>medtraductor</h1>
      {profile && <>
        <div>
          <img src={profile.picture} alt="user image" />
          <h3>User Logged in</h3>
          <p>Name: {profile.name}</p>
          <p>Email Address: {profile.email}</p>
          <button onClick={logout}>Log out</button>
        </div>
      </> || <>
          <button onClick={() => login()}>Sign in with Google 🚀 </button>
        </>
      }
    </>)
}

export default App
