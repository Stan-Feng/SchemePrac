 // Given a set [1, 2, 3] return all permutations of this set
 // The problem can be reduced of generating fewer elements than S.
 // In the terminal case, we work on our empty list which means no element.

function flatmap (sequence, proc) {
 return sequence
   .map(i => (proc (i)))
   .reduce((accu, curr) => (accu.concat(curr)));
}

function permutations (set) {
  if (set.length === 0) {
    return [[]];
  } else {
      return flatmap(set,
          x => permutations(remove(x, set))
          .map(y => [x].concat(y)));
  }
//  Without flatmap it can be written like this
//   return set.map(
//       x => permutations(remove(x, set))
//       .map(y => [x].concat(y)))
//     .reduce((accu, curr) => (accu.concat(curr)));
// But if we want to make a more abstarct more general procedure
// which can be resued in future development. 'flatmap' is the right way.
}

function remove (item, sequence) {
  return sequence.filter(el => (el !== item));
}
console.log(permutations([1, 2, 3, 4]));
