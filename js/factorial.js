'use strict';
function factorial (n) {
  const product = 1;
  const counter = 1;

  function iter (product, counter, maxCount) {
    if (counter == maxCount) {
      return product * counter;
    } else {
      return iter(product * counter, counter + 1, maxCount);
    }
  }

  return iter(product, counter, n);
}

function f (n) {
  if (n === 1) {
    return 1;
  } else {
    return f(n - 1) * n;
  }
}

console.log(factorial(5));
console.log(factorial(6));
console.log(factorial(7));

console.log(f(5));
