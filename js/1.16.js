'use strict';
function iterExpt (base, power) {
  var a = 1;

  function _iter (base, power) {
    if (power === 0) {
      return a;
    } else if (power % 2 === 0) {
      return _iter(square(base), power / 2);
    } else {
      a *= base;
      return _iter(base, power - 1);
    }
  }

  return _iter(base, power);
}

function square (x) {
  return x * x;
}
