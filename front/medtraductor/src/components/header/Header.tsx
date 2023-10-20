import {Link} from "react-router-dom";
import {GoogleProfile} from "../../hooks/googleAuth";
import Navbar from "./Navbar";
import NavbarOffCanvas from "./NavbarOffCanvas";
import NavbarOffCanvasItem from "./NavbarOffCanvasItem";

interface Props {
  profile: GoogleProfile;
  logout: () => void;
};

const Header = ({profile, logout}: Props) => {
  return <>
    <Navbar>
      <Link to="/" className="navbar-brand">Home</Link>
      <Link to="/questions" className="nav-link">Questions</Link>
      <NavbarOffCanvas id="offcanvasNavbar" title="Menu">
        <NavbarOffCanvasItem title="Profile">
          <Link to="/profile"
            className="btn btn-outline-primary btn-sm"
          >
            Profile
          </Link>
        </NavbarOffCanvasItem>
        <NavbarOffCanvasItem title="Found a 🐛?">
          <button type="button" className="btn btn-outline-warning btn-sm">
            Report bug
          </button>
        </NavbarOffCanvasItem>
      </NavbarOffCanvas>
    </Navbar>
  </>;
};

export default Header;
