// https://school.programmers.co.kr/learn/courses/30/lessons/42839?language=swift

import Foundation

func solution(_ numbers:String) -> Int {
    let arr = numbers.map { String($0) }
    var result: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: arr.count)
    var number = ""

    func isPrime(_ n: Int) -> Bool {
      guard n > 1 else { return false }
      guard n != 2 else { return true }

      var isPrime = true

      for i in 2...Int((sqrt(Double(n))))+1 {
        if n % i == 0 {
          isPrime = false
          break
        }
      }
      return isPrime
    }

    func DFS(_ depth: Int, _ string : String, _ count: Int) {
      if depth == count {
        if let number = Int(string) {
          if isPrime(number) && !result.contains(number) {
          result.append(number)
        }
      }
    } else {
      for i in 0..<arr.count {
        if visited[i] == false {
          number += arr[i]
          visited[i] = true
          DFS(depth + 1, number, count)
          visited[i] = false
          number = string
        }
      }
    }
  }

  for i in 1...arr.count {
    DFS(0, "", i)
  }

  return result.count
}
