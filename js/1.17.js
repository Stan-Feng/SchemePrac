'use strict';

function mul (a, b) {
  var sum = 0;
  const halve = x => x / 2;
  const double = x => x + x;

  const iter = (a, b) => {
    console.log(a, b);

    if (b / 2 === 1) {
      return sum + double(a);
    }

    const isEven = (halve(b) % 2 === 0);
    if (isEven) {
      sum += double(a);
      return iter(a, halve(b));
    } else {
      sum += double(a) + a;
      return iter(a, halve(b - 1));
    }

  };


  // Boundaries Situation
  if (b === 0 || a === 0) {
    return 0;
  } else if (b === 1) {
    return a;
  }

  if (b % 2 === 0) {
    return iter(a, b);
  } else {
    return a + iter(a, b - 1);
  }
}

module.exports = mul;
