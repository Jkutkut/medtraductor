import {ReactNode} from "react";
import {Link} from "react-router-dom";

interface Props {
  wanted?: string;
  children: ReactNode[] | ReactNode;
};

const Error404 = ({wanted, children}: Props) => {
  if (!wanted) {
    wanted = 'URL';
  }
  if (!Array.isArray(children)) {
    children = [children];
  }
  const btns = [
    ...children,
    <Link to="/" className="btn btn-primary">Go Home</Link>
  ];
  return <>
    {/*404: the requested {wanted} does not exist.*/}
    <div className="container">
      <div className="text-center mt-5">
        <h1 className="display-4">404</h1>
        <p className="lead">Oops! Page not found.</p>
        <p>Sorry, the {wanted} you are looking for might be in another universe.</p>
        <div className="mt-5">
          {btns.map((btn, i) =>
            <div key={i} className="row p-3">
              {btn}
            </div>
          )}
        </div>
      </div>
    </div>
  </>;
};

export default Error404;
