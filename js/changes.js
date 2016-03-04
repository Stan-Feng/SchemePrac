function countChange (amount) {
  const coinsMap = {
    1: 1,
    2: 5,
    3: 10,
    4: 25,
    5: 50
  };

  function cc (amount, kind) {
    if (amount < 0 || kind === 0) {
      return 0;
    }

    if (amount === 0) {
      return 1;
    }

    return cc(amount, kind - 1) + cc((amount - coinsMap[kind]), kind);
  }

  return cc(amount, 5);
}

module.exports = countChange;
