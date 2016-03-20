// [1, 2, 3] --> [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
'use strict';
function subsets (set) {
  if (set.length === 0) {
    return [[]];
  } else {
    var curr = set[0];
    var rest = subsets(set.slice(1));
    return rest.map(subEl => [curr].concat(subEl))
                .concat(rest);
  }
};
var list1 = [1, 2, 3, 4];
var result1 = subsets(list1);

var list2 = [1, 2, 3];
var result2 = subsets(list2);
console.log(result1);
console.log('*****************************');
console.log(result2);


// function subsets (set) {
//   if (set.length === 0) {
//     return [[]];
//   } else {
//     var curr = set[0];
//     var rest = subsets(set.slice(1));
//     return rest.map(subEl => {
//       let arr = [curr].concat(subEl);
//       console.log('rest: ', rest, 'curr: ', curr, ' subEl: ', subEl ,'\n arr: ',arr);
//       return arr;
//     }).concat(rest);
//   }
// };



// Process out of memory
// var list100 = (new Array(100)).fill('excited').map((v, i) => i);
// var result100 = subsets(list100);
// console.log(resul100);

/**
 * This is a more elegant way to solve this problem while expects more resources
 * But we can analysis problem start from here.
 * Solve the problem first.
 * Do optimization later.
 */
