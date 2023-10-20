import {Navigate, useLocation} from "react-router-dom";

interface Props {
  to: string;
  field?: string;
};

const SaveUrlAndRedirect = ({to, field}: Props) => {
  if (!field) {
    field = "then";
  }
  const {pathname} = useLocation();
  return <Navigate to={`${to}?${field}=${pathname}`} />;
};

export default SaveUrlAndRedirect;
