'use strict'

function expt (base, power) {
  if (power % 2 !== 0) {
    return base * exptIter(base, power - 1)
  } else {
    return exptIter(base, power)
  }
}

function exptIter (base, power) {
  // console.log(power)
  if (power === 1) {
    return base
  } else if (power === 0) {
    return 1
  } else {
    return exptIter(base, power / 2) * exptIter(base, power / 2)
  }
}

console.log(expt(5, 2))

function iterExpt (base, power) {
  var a = 1

  function _iter (base, power) {
    if (power === 0) {
      return a
    } else if (power % 2 === 0) {
      return _iter(square(base), power / 2)
    } else {
      a *= base
      return _iter(base, power - 1)
    }
  }

  return _iter(base, power)
}

function square (x) {
  return x * x
}

console.log(iterExpt(2, 10))
