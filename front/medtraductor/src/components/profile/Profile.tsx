import {useContext} from "react";
import UserContext from "../../context/UserContext";

interface Props {

};

const Profile = ({}: Props) => {
  const { gAuth: {profile, logout}} = useContext(UserContext);
  return <>
    <div>
      <img src={profile.picture} alt="user image" />
      <h3>User Logged in</h3>
      <p>Name: {profile.name}</p>
      <p>Email Address: {profile.email}</p>
      <button onClick={logout}>Log out</button>
    </div>
  </>;
};

export default Profile;
