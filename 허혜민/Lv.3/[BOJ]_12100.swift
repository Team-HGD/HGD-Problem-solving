// https://www.acmicpc.net/problem/12100 

let n = Int(readLine()!)!
var board: [[Int]] = (0..<n).map{ _ in 
  readLine()!.split(separator: " ").map{ Int($0)! } 
}
var ans: Int = 0 
back(count: 0, num: 0)
print(ans)

func back(count: Int, num: Int) {
  let actions: [() -> Int] = [up, down, left, right]
  if count == 5 {
    ans = max(ans, num)
    return 
  }
  
  for i in 0..<4 {
    let copyBoard = board
    let result = actions[i]()
    back(count: count+1, num: max(num, result))
    board = copyBoard
  }
}

/// 움직인 블록 중 가장 큰 값을 반환 
func up() -> Int {
  var result: Int = 0 
  for col in 0..<n {
    var colArr: [Int] = []
    for row in 0..<n {
      let element = board[row][col]
      if let lastElement = colArr.last, 
      lastElement == 0 {
        _ = colArr.popLast() 
        colArr.append(element)
        result = max(result, element)
      } else if let lastElement = colArr.last, 
      lastElement == element {
        _ = colArr.popLast() 
        colArr.append(element * 2)
        colArr.append(0)
        result = max(result, element * 2)
      } else if element != 0 {
        result = max(result, element)
        colArr.append(element) 
      }
    }
    colUpdate(colArr: colArr, col: col, isReversed: false)
  }
  return result 
}
func down() -> Int {
  var result: Int = 0 
  for col in 0..<n {
    var colArr: [Int] = [] 
    var row = n-1
    while row > -1 {
      let element: Int = board[row][col]
      if let lastElement = colArr.last,
      lastElement == 0 {
         _ = colArr.popLast()
         colArr.append(element)
         result = max(result, element)
      } else if let lastElement = colArr.last,
      lastElement == element {
        _ = colArr.popLast() 
        colArr.append(element * 2)
        colArr.append(0)
        result = max(result, element * 2)
      } else if element != 0 {
        colArr.append(element)
        result = max(result, element)
      } 
      row -= 1 
    }
    colUpdate(colArr: colArr, col: col, isReversed: true)
  }
  return result 
} 
func left() -> Int {
  var result: Int = 0 
  for row in 0..<n {
    var rowArr: [Int] = [] 
    for col in 0..<n {
      let element = board[row][col] 
      if let lastElement = rowArr.last,
      lastElement == 0 {
         _ = rowArr.popLast()
        rowArr.append(element)
        result = max(result, element)
      } else if let lastElement = rowArr.last,
      lastElement == element {
        _ = rowArr.popLast()
        rowArr.append(element * 2)
        rowArr.append(0)
        result = max(result, element * 2)
      } else if element != 0 {
        rowArr.append(element)
        result = max(result, element)
      }
    }
    rowUpdate(rowArr: rowArr, row: row, isReversed: false)
  }
  return result 
}
func right() -> Int {
   var result: Int = 0 
   var row = n-1
  for row in 0..<n {
    var rowArr: [Int] = [] 
    var col = n-1
    while col > -1 {
      let element = board[row][col] 
      if let lastElement = rowArr.last,
      lastElement == 0 {
        _ = rowArr.popLast()
        rowArr.append(element)
        result = max(result, element)
      } else if let lastElement = rowArr.last,
      lastElement == element {
        _ = rowArr.popLast()
        rowArr.append(element * 2)
        rowArr.append(0)
        result = max(result, element * 2)
      } else if element != 0 {
        rowArr.append(element)
        result = max(result, element)
      }
      col -= 1
    }
    rowUpdate(rowArr: rowArr, row: row, isReversed: true)
  }
  return result 
} 

func rowUpdate(rowArr: [Int], row: Int, isReversed: Bool) {
  var rowArr = rowArr
  while rowArr.count != n {
    rowArr.append(0)
  }
  rowArr = isReversed ? rowArr.reversed().map{ $0 } : rowArr 
  board[row] = rowArr
}

func colUpdate(colArr: [Int], col: Int, isReversed: Bool) {
  var colArr = colArr
  while colArr.count != n {
    colArr.append(0)
  }
  colArr = isReversed ? colArr.reversed().map{ $0 } : colArr 
  for (index, element) in colArr.enumerated() {
    board[index][col] = element 
  }
}
