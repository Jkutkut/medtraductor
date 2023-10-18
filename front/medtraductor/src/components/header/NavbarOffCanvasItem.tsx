import {ReactNode} from "react";

interface Props {
  title: ReactNode;
  children: ReactNode;
};

const NavbarOffCanvasItem = ({title, children}: Props) => {
  return <>
    <li className="nav-item d-flex justify-content-between align-items-center">
      <span className="nav-link">{title}</span>
      <div className="text-end col-4 d-grid">
        {children}
      </div>
    </li>
  </>;
};

export default NavbarOffCanvasItem;
