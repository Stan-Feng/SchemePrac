'use strict';
function factorial (n) {
  const product = 1;
  const counter = 1;

  function iter (product, counter, maxCount) {
    if (counter === maxCount) {
      return product * counter;
    } else {
      return iter(product * counter, counter + 1, maxCount);
    }
  }

  return iter(product, counter, n);
}

module.exports = factorial;
