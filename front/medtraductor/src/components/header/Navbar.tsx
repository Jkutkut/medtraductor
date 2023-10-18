import {ReactNode} from "react";

interface Props {
  children: ReactNode;
};

const Navbar = ({children}: Props) => {
  return <>
    <nav className="navbar navbar-expand-lg">
      <div className="container-fluid">
        {children}
      </div>
    </nav>
  </>;
};

export default Navbar;
