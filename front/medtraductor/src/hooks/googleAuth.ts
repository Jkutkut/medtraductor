import {TokenResponse, googleLogout, useGoogleLogin} from "@react-oauth/google";
import {useEffect, useState} from "react"

interface GoogleProfile {
  id: string;
  name: string;
  email: string;
  verified_email: boolean;
  given_name: string;
  family_name: string;
  picture: string;
  locale: string;
}

const googleAuth = () => {
  // TODO load profile on demand
  // TODO handle old tokens
  const [user, setUser] = useState<TokenResponse | null>(null);
  const [profile, setProfile] = useState<GoogleProfile | null>(null);

  const saveCredentials = (user: any) => {
    setUser(user);
    sessionStorage.setItem('user', JSON.stringify(user));
  };

  const login = useGoogleLogin({
    onSuccess: (user) => saveCredentials(user),
    onError: (error) => console.error('Login Failed:', error)
  });

  const logout = () => {
    googleLogout();
    setProfile(null);
    sessionStorage.removeItem('user');
  };

  useEffect(() => {
    if (!user) {
      const user = sessionStorage.getItem('user');
      if (!user) {
        return;
      }
      setUser(JSON.parse(user) as TokenResponse);
      return;
    }
    console.info('Login Success:', user);
    fetch(`https://www.googleapis.com/oauth2/v1/userinfo`, {
      method: 'GET',
      headers: {
        Authorization: `Bearer ${user.access_token}`,
        Accept: 'application/json'
      }
    }).then(async (res) => {
      if (res.status !== 200) {
        throw new Error(res.statusText);
      }
      return await res.json();
    })
    .then((profile) => {
      console.info('profile', profile);
      setProfile(profile);
    }).catch((err) => {
      console.error(err);
      logout();
    });
  }, [user]);


  return {login, logout, user, profile};
}

export default googleAuth;
