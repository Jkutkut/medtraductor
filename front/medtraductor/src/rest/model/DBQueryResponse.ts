interface DBQueryResponse<T> {
  data: T[];
  size: number;
};

export default DBQueryResponse;
