'use strict';
const halve = x => x / 2;
const double = x => x + x;

const mul = (a, b) => {
  const iter = (a, b, product) => {
    if (b === 0 || a === 0) {
      return product;
    } else if (b % 2 === 0) {
      return iter(double(a), halve(b), product);
    } else {
      return iter(a, b - 1, product + a);
    }
  };

  return iter(a, b, 0);
};

module.exports = mul;
