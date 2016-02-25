function fn (n) {
  if (n < 3) {
    return n;
  }
  // f(n-1), f(n-2), f(n-3), count
  return iter(2, 1, 0, n - 2);
}

function iter (f1, f2, f3, count) {
  var tmp1 = f1;
  var tmp2 = f2;

  f1 = f1 + f2*2 + f3*3;
  f2 = tmp1;
  f3 = tmp2;

  count -= 1;
  if (count === 0) {
    return f1;
  } else {
    return iter(f1, f2, f3, count);
  }
}

function recu (n) {
  if (n < 3) {
    return n;
  }

  return recu(n - 1) + recu(n - 2) * 2 + recu(n - 3) * 3;
}

console.log(fn(5));
console.log(fn(6));
console.log(fn(7));
console.log(fn(8));
console.log(fn(9));

