// [row1, row2, row3...] while row1 = [col1, col2....]
// The first and second row always return 1
const table = [
  [1],
  [1, 1]
]

const isCalculated = (row, col) => {
  if (table[row] && table[row][col]) {
    return true
  } else {
    return false
  }
}

function pascal (row, col) {
  // If column, row out of range return 0
  if (row === 0 || col === 0 || col > row) return 0

  if (isCalculated(row, col)) {
    return table[row][col]
  } else {
    table[row] = []
    table[row][col] = pascal(row - 1, col) + pascal(row - 1, col - 1)
    return table[row][col]
  }
}

module.exports = pascal
