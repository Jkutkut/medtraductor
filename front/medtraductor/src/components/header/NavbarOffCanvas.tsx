import {ReactNode} from "react";
import NavbarOffCanvasFooter from "./NavbarOffCanvasFooter";

interface Props {
  id: string;
  title: string;
  children: ReactNode;
};

const NavbarOffCanvas = ({id, title, children}: Props) => {
  return <>
    <button
      className="navbar-toggler" type="button"
      data-bs-toggle="offcanvas" data-bs-target={`#${id}`}
      aria-controls={id} aria-label="Toggle navigation"
    >
      <span className="navbar-toggler-icon"></span>
    </button>
    <div className="offcanvas offcanvas-end" tabIndex={-1} id={id}>
      <div className="offcanvas-header">
        <h5 className="offcanvas-title">{title}</h5>
        <button
          type="button" className="btn-close text-reset"
          data-bs-dismiss="offcanvas" aria-label="Close"
        ></button>
      </div>
      <div className="offcanvas-body mb-4">
        <ul className="navbar-nav justify-content-end flex-grow-1 pe-3 gap-3">
          {children}
        </ul>
      </div>
      <NavbarOffCanvasFooter />
    </div>
  </>;
};

export default NavbarOffCanvas;
