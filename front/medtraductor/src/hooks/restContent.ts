import {useEffect, useState} from "react";
import DBQueryResponse from "../rest/model/DBQueryResponse";

const restContent = <T>(
  ft: () => Promise<T>
) => {
  const [data, setData] = useState<T | null>(null);
  const isLoading = data === null;
  const isError = !isLoading && data === null;

  useEffect(() => {
    ft().then(setData);
  }, []);
  return {data, isLoading, isError};
};

const restSingleContent = <T>(
  ft: () => Promise<DBQueryResponse<T>>,
) => {
  const [data, setData] = useState<T | null>(null);
  const [isError, setIsError] = useState(false);
  const isLoading = data === null && !isError;

  useEffect(() => {
    ft().then((result: DBQueryResponse<T>) => {
      if (result.size != 1) {
        console.warn("restSingleContent", "Expected a single result. Got " + result.size);
        setIsError(true);
        return;
      }
      setData(result.data[0]);
    });
  }, []);

  return {data, isLoading, isError};
};

export {restContent, restSingleContent};
