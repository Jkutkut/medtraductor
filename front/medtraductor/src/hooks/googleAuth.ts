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
};

interface GoogleAuth {
  isLoading: boolean;
  login: () => void;
  logout: () => void;
  user: TokenResponse | null;
  profile: GoogleProfile | null;
};

const loadUser = (): TokenResponse | null => {
  const user = sessionStorage.getItem('user');
  if (!user) {
    return null;
  }
  return JSON.parse(user) as TokenResponse;
};


const googleAuth = () => {
  // TODO load profile on demand
  // TODO handle old tokens
  const [user, setUser] = useState<TokenResponse | null>(loadUser());
  const [profile, setProfile] = useState<GoogleProfile | null>(null);
  const [isLoading, setIsLoading] = useState<boolean>(false);

  const saveCredentials = (user: any) => {
    setUser(user);
    sessionStorage.setItem('user', JSON.stringify(user));
  };

  const gLogin = useGoogleLogin({
    onSuccess: (user) => {
      saveCredentials(user);
      setIsLoading(false);
    },
    onError: (error) => {
      console.error('Login Failed:', error);
      setIsLoading(false);
    }
  });

  const login = () => {
    setIsLoading(true);
    gLogin();
  };

  const logout = () => {
    googleLogout();
    setProfile(null);
    sessionStorage.removeItem('user');
  };

  useEffect(() => {
    if (!user) {
      return;
    }
    // console.info('Login Success:', user);
    setIsLoading(true);
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
      // console.info('profile', profile);
      setProfile(profile);
    }).catch((err) => {
      console.error(err);
      logout();
    })
    .finally(() => setIsLoading(false));
  }, [user]);

  const auth: GoogleAuth = {isLoading, login, logout, user, profile};
  return auth;
}

export default googleAuth;
export type {GoogleAuth, GoogleProfile};
