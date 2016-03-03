'use strict'

function sqrt (x, accuracy) {
  accuracy = accuracy || 0.001

  const square = x => x * x
  const average = (x, y) => (x + y) / 2

  const improve = guess => average(guess, x / guess)
  const isGoodEnough = guess => Math.abs(square(guess) - x) < accuracy

  const sqrtIter = guess => {
    if (isGoodEnough(guess)) {
      return guess
    } else {
      return sqrtIter(improve(guess))
    }
  }

  return sqrtIter(1)
}

console.log(sqrt(2))
console.log(sqrt(3))
console.log(sqrt(4))
console.log(sqrt(5))
console.log(sqrt(25))
console.log(sqrt(52))
