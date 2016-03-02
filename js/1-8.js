'use strict';
function cube (x) {
  const square = x => x * x;
  const cube = x => x * x * x;
  const improve = (x, y) => (x / (y * y) + y * 2) / 3;
  const isEnough = (x, guess) => Math.abs(cube(guess) - x) < 0.001;

  const cubeIter = (x, guess) => {
    if (isEnough(x, guess)) {
      return guess;
    } else {
      return cubeIter(x, improve(x, guess));
    }
  };

  return cubeIter(x, 1.0);
}

console.log(cube(27));
