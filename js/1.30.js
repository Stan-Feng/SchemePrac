'use strict';
const sum = (term, a, next, b) => {
  const iter = (a, result) => {
    if (a > b) {
      return result;
    } else {
      return iter(next(a), result + term(a));
    }
  };

  return iter(a, 0);
};
