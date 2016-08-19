const accumulate = (combiner, nullValue, termProc, nextProc, conditionProc,lowerBound, upperBound) => {
  const iter = (result, i) => {
    if (i > upperBound) {
      return result;
    } else {
      if (conditionProc(i)) {
        return iter(combiner(result, i), next(i));
      } else {
        return iter(result, next(i));
      }
    }
  };
};

const evenSquareSum = (lowerBound, upperBound) => {
  return accumulate(add, 0, x => (x * x), x => (x + 1), x => (x%2 === 0), lowerBound, upperBound)
};

const relativePrimeProduct = (lowerBound, upperBound) => {
  return accumulate(product, 1, x => (x), x => (x + 1), gcd, lowerBound, upperBound);
}
