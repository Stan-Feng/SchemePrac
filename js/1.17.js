const halve = x => x / 2;
const double = x => x + x;

function mul (a, b) {
  if (b === 0 || a === 0) {
    return 0;
  }

  if (b % 2 === 0) {
    return double(mul(a, halve(b)));
  } else {
    return a + mul(a, b - 1);
  }
  // const iter = (a, b) => {
  //   // Base Case
  //   if (b === 2) {
  //     return double(a);
  //   } else if (b === 3){
  //     return a + double(a);
  //   }
  //
  //
  //   if (b % 2 === 0) {
  //     return double(iter(a, halve(b)));
  //   } else {
  //     return a + double(iter(a, halve(b - 1)));
  //   }
  // };
  //
  // // Boundaries Situation
  // if (b === 0 || a === 0) {
  //   return 0;
  // } else if (b === 1) {
  //   return a;
  // }
  //
  // // Enter iter
  // if (b % 2 === 0) {
  //   return iter(a, b);
  // } else {
  //   return a + iter(a, b - 1);
  // }
}

module.exports = mul;
