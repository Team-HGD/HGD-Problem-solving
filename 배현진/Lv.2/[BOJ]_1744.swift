// https://www.acmicpc.net/problem/1744

func calculateArry() {
  let N = Int(readLine()!)!

  var sum = 0
  var negativeArr = [Int]()
  var positiveArr = [Int]()

  for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 1 {
      sum += 1
    } else if input <= 0 {
      negativeArr.append(input)
    } else if input > 0 {
      positiveArr.append(input)
    }
  }

  positiveArr.sort(by: <)
  negativeArr.sort(by: >)

  while !positiveArr.isEmpty {
    if positiveArr.count == 1 {
      sum += positiveArr.removeLast()
      break
    }

    let num1 = positiveArr.removeLast()
    let num2 = positiveArr.removeLast()
    sum += (num1 * num2)
  }

  while !negativeArr.isEmpty {
    if negativeArr.count == 1 {
      sum += negativeArr.removeLast()
      break
    }

    let num1 = negativeArr.removeLast()
    let num2 = negativeArr.removeLast()
    sum += (num1 * num2)
  }

  print(sum)
}

calculateArry()
