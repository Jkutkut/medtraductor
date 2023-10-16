import {GoogleLogin, GoogleOAuthProvider} from "@react-oauth/google"

function App() {
  const responseMessage = (response: any) => {
    console.log(response);
  };
  const errorMessage = (error: any = null) => {
    console.log(error);
  };

  return (
    <>
      <h1>App</h1>
      <GoogleLogin onSuccess={responseMessage} onError={errorMessage} />
    </>
  )
}

export default App
