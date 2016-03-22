'use strict';
// Recursion definition of factorial
// function mul (...args) {
//   if (args.length <= 2) {
//     return args[0] * args[1];
//   } else {
//     return args[0] * mul(...args.slice(1));
//   }
// }

function reduce (arr, fn, initial) {
  var total = initial;
  for (let i = 0; i < arr.length; i++) {
    total = fn(total, arr[i]);
  }

  return total;
}


// Thunk, a thunk is a computation hasn't been evaluated yet.
function add_thunk (x) {
  return function () {
    return x;
  };
}

function add (a, b) {
  return a + b;
}

// All the abstraction in functional programming you made
// is combination composition or some lower level abstractions
function add_two (fn1, fn2) {
  return add(fn1(), fn2());
}

function add_n (arr) {
  if (arr.length === 0) {
    return 0;
  } else if (arr.length === 1) {
    return arr[0];
  } else {
    return add_two(add_thunk(arr[0]), add_thunk(arr[1])) + add_n(arr.slice(2));
  }
}

function add_n_tail (arr) {
  function iter (result, restArr) {
    if (restArr.length === 0) {
      return result;
    } else if (restArr.length === 1) {
      return result + restArr[0];
    } else {
      return iter(result +
                    add_two(add_thunk(restArr[0]), add_thunk(restArr[1])),
                  restArr.slice(2));
    }
  }

  return iter(0, arr);
}

function add_map_reduce (arr) {
  return reduce(arr, function(total, el) {
    return total += el;
  }, 0);
}

console.log(add_n([1, 2, 3, 4, 5, 6]));
console.log(add_n_tail([1, 2, 3, 4, 5]));
console.log(add_map_reduce([1, 2, 3, 4, 5]));
