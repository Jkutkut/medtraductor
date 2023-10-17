interface Props {

};

const ErrorPage = ({}: Props) => {
  return <div>
    <h1>ErrorPage</h1>
    <button onClick={() => window.location.href = "/"}>Go to home</button>
  </div>;
};

export default ErrorPage;
