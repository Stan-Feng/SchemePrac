'use strict';
// TODO: Given an integer n, find all pairs from 0 to n such that (i, j) where i + j is prime number
/**
 * The solving process can be divided into three parts:
 *    1. Construct Pairs --> [[1, 0], [2, 1], [2, 0].......]
 *      - Enumerate from 1 to (n - 1) and for each number i map from 0 to (i - 1) return a pair
 *    2. Filter sum-prime number
 *    3. Mapping out to final result
 */
 function makeSumPrimePair (num) {
   const makePairProc = i => {
     return enumerateInterval(0, i - 1)
      .map(j => [i, j]);
   };

   return flatmap(enumerateInterval(1, num), makePairProc)
     .filter(isSumPrime)
     .map(el => ({ i: el[0], j: el[1], result: el[0] + el[1]}));
 }

function enumerateInterval (start, end) {
  const result = new Array(end - start);

  for (let i = 0, val = start; val <= end; val++, i++) {
    result[i] = val;
  }

  return result;
};

// var duplicate = n => [n, n]
// flatmap([1, 2, 3], duplicate) ==> [1, 1, 2, 2, 3, 3]
function flatmap (sequence, proc) {
  return sequence
    .map(i => (proc(i)))
    .reduce((accu, curr) => (accu.concat(curr)));
}

function isSumPrime (pair) {
  const isPrime = (x) => {
    for (let i = 2; i < x; i++) {
      if (x % i === 0) {
        return false;
      }
    }
    return true;
  };

  return isPrime(pair[0] + pair[1]);
}

console.log(makeSumPrimePair(6));
