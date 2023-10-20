import {useEffect, useState} from "react";
import DBQueryResponse from "../rest/model/DBQueryResponse";

const restContent = <T>(
  request: Promise<T>
) => {
  const r = request;
  const [data, setData] = useState<T | null>(null);
  const isLoading = data === null;
  const isError = !isLoading && data === null;

  useEffect(() => {
    r.then(setData);
  });
  return {data, isLoading, isError};
};

const restSingleContent = <T>(
  // {request}: Props2<T>
  request: Promise<DBQueryResponse<T>>
) => {
  const r = request;
  const [data, setData] = useState<T | null>(null);
  const [isError, setIsError] = useState(false);
  const isLoading = data === null && !isError;

  useEffect(() => {
    r.then((response) => {
      if (response.size != 1) {
        console.log("Error: expected 1 result, got " + response.data.length);
        setIsError(true);
        return;
      }
      setData(response.data[0]);
    });
  }, []);

  return {data, isLoading, isError};
};

export {restContent, restSingleContent};
