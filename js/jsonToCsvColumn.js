// This exercise from: https://gist.github.com/JeffreyZhao/d131293c3f7db2e552c6
// created by Jeffrey Zhao
'use strict';
Array.prototype.concatAll = function () {
  var results = [];

  this.forEach(subArr => {
    results.push.apply(results, subArr);
  });

  return results;
};

function printLine (array) {
  console.log(array.join(','));
}

function printHeader (obj) {
  /* Print header by using printLine */
  var offset = 0;
  function iter (restNodes) {
    var names = Object.keys(restNodes);

    if (isEnd(restNodes)) {
      return;
    } else {
      offset = max(restNodes.filter(isLeaf).length, offset);
      let results = (new Array(offset))
        .fill(null)
        .concat(restNodes
          .map(node => makeOneNode(node))
          .concatAll()
        );

      restNodes = restNodes
        .map(node => Object.keys(node)
          .map(name => node[name])).concatAll();

      printLine(results);
      return results.concat(iter(restNodes));
    }
  }

  return iter([obj]);
}

function makeOneNode (node) {
  var colNames = Object.keys(node);

  var newArr =colNames
        .map(name => [name].concat(createEmptyTuples(node[name])))
        .concatAll();
  return filterEndComma(newArr);
}

function isLeaf (node) {
  return typeof node !== 'object';
}

function isEnd (node) {
  var nodeNum = Object.keys(node).length;

  var leafNum = Object.keys(node)
    .map(name => node[name])
    .filter(isLeaf)
    .length;

  return leafNum === nodeNum;
}

function createEmptyTuples (obj) {
  var len = Object.keys(obj).length;
  len = (len === 0) ? 0 : len - 1;
  return (new Array(len)).fill(null);
}

function filterEndComma (array) {
  for (let i = array.length - 1; i >= 0; i--) {
    if (array[i] !== null) {
      return array.slice(0, i + 1);
    }
  }
}

function max (a, b) {
  return (a > b) ? a : b;
}

var columns = {
  Process: {
        CpuUsage: 0,
        VirtualMemory: 0,
        PrivateMemory: 0
    },
    Subscriptions: {
        Order: {
            TotalCount: 0,
            LastMinute: 0,
            Failed: 0
        },
        User: {
            TotalCount: 0,
            LastMinute: 0
        }
    }
};
var result = printHeader(columns);
// console.log(result);
// printLine(filterEndComma(result));
// console.log(printHeader(columns.Process.CpuUsage));
