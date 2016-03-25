// [row1, row2, row3...] while row1 = [col1, col2....]
// The first and second row always return 1
const table = [
  [1],
  [1, 1]
];

const isCalculated = (row, col) => {
  if (table[row] && table[row][col]) {
    return true;
  } else {
    return false;
  }
};

function pascal (row, col) {
  // If column, row out of range return 0
  if (row === 0 || col === 0 || col > row) return 0;

  if (isCalculated(row, col)) {
    return table[row][col];
  } else {
    table[row] = [];
    table[row][col] = pascal(row - 1, col) + pascal(row - 1, col - 1);
    return table[row][col];
  }
}

function pascal (n) {
  var result = [[1], [1, 1]];

  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return result;
  }

  function iter (curr, result) {
    if (curr === (n + 1)) {
      return result;
    } else {
      return iter(curr + 1, updateNewLine(result));
    }
  }

  return iter(3, result);
}

function updateNewLine (result) {
  var bottomLine = result[result.length - 1];

  var mid = enumerateSumPair(bottomLine);
  var newLine = [1].concat(mid).concat(1);
  result.push(newLine);

  return result;
}

function enumerateSumPair (arr) {
  return arr.slice(0, arr.length - 1)
    .map((e, i) => e + arr[i + 1]);
}

console.log(pascal(5));

module.exports = pascal;
