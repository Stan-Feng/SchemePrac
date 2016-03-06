'use strict';
const inc = x => x + 1;
const cube = x => x * x * x;

const sum = (term, a, next, b) => {
  if (a > b) {
    return 0;
  } else {
    return term(a) + sum(term, next(a), next, b);
  }
};

const simpson = (f, a, b, n) => {
  const h = (b - a) / n;
  const yk = k => f(a + h * k);

  const term = k => {
    var factor;
    if (k === 0 || k === n) {
      factor = 1;
    } else if (k % 2 !== 0) {
      factor = 4;
    } else {
      factor = 2;
    }

    return factor * yk(k);
  };

  return h / 3 * sum(term, 0, inc, 1000);
};

module.expots = simpson;
