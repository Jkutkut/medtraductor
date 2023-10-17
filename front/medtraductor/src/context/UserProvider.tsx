import {GoogleAuth} from "../hooks/googleAuth";
import UserContext from "./UserContext";

interface Props {
  gAuth: GoogleAuth;
  children: React.ReactNode;
};

interface Value {
  gAuth: GoogleAuth;
};

const UserProvider = ({gAuth, children}: Props) => {
  const value: Value = {
    gAuth,
  };

  return (
    <UserContext.Provider value={value}>
      {children}
    </UserContext.Provider>
  );
};

export default UserProvider;
