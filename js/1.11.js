function fn (n) {
  if (n < 3) {
    return n
  }
  // f(n-1), f(n-2), f(n-3), count
  return iter(2, 1, 0, n - 2)
}

function iter (f1, f2, f3, count) {
  count -= 1
  if (count === 0) {
    return f1
  } else {
    return iter(
      f1 + f2 * 2 + f3 * 3,
      f1,
      f2,
      count
    )
  }
}

console.log(fn(5))
console.log(fn(6))
console.log(fn(7))
console.log(fn(8))
console.log(fn(9))

