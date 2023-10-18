interface FutureParser<FROM, TO> {
  (data: FROM): Promise<TO>;
};

export type {FutureParser};
