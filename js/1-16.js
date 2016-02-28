'use strict';

function expt (base, power) {
  if (power % 2 !== 0) {
    return base * exptIter(base, power - 1);
  } else {
    return exptIter(base, power);
  }
}

function exptIter (base, power) {
  // console.log(power);
  if (power === 1) {
    return base;
  } else if (power === 0) {
    return 1;
  } else {
    return exptIter(base, power / 2) * exptIter(base, power / 2);
  }
}

console.log(expt(5, 2));
