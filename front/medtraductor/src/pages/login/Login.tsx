interface Props {
  login: () => void;
};

const Login = ({login}: Props) => {
  return <>
    <section className="vh-100">
      <div className="container-fluid h-custom">
        <div className="row d-flex justify-content-center align-items-center h-100">
          <div className="col-md-9 col-lg-6 col-xl-5">
            <h1 className="display-4 text-center mb-5">medtraductor</h1>
            <img
              src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
              className="img-fluid"
              alt="Sample image"
            ></img>
          </div>
          <div className="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
            <div className="text-center text-lg-start mt-4 pt-2">
              <button
                type="button" className="btn btn-primary btn-lg"
                style={{paddingLeft: '2.5rem', paddingRight: '2.5rem'}}
                onClick={login}
              >
                Login with Google 🚀
              </button>
           </div>
          </div>
        </div>
      </div>
    </section>
  </>;
};

export default Login;
