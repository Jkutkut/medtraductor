import { ReactNode } from 'react';

interface Props {
  children: ReactNode;
};

const ShareCurrentPage = ({ children }: Props) => {
  const shareUrl = () => {
    const url = window.location.href;
    navigator.clipboard.writeText(url);
    alert("Copied to clipboard!");
  };
  return <>
    <div
      id="url-copy"
      onClick={shareUrl}
    >
      {children}
    </div>
  </>;
};

export default ShareCurrentPage;
