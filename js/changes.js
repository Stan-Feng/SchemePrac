function countChange (amount) {
  return cc(amount, 5)
}

function cc (amount, kind) {
  if (amount === 0) {
    return 1
  }

  if (amount < 0 || kind === 0) {
    return 0
  }

  return cc(amount, kind - 1) + cc((amount - coinsMap[kind]), kind)
}

const coinsMap = {
  1: 1,
  2: 5,
  3: 10,
  4: 25,
  5: 50
}

module.exports = countChange
