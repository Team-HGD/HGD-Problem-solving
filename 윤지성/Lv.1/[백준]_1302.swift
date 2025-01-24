// https://www.acmicpc.net/problem/1302
import Foundation

let n = Int(readLine()!)!
var books: [String: Int] = [:]
var maximum = 0
var answer = ""

(0 ..< n).forEach { _ in
    let bookName = readLine()!
    if let bookCnt = books[bookName] {
        books[bookName] = bookCnt + 1
    } else {
        books[bookName] = 1
    }
}
books.keys.sorted().forEach { book in
    if let cnt = books[book] {
      if maximum < cnt {
        maximum = cnt
        answer = book
    }
  }
}
print(answer)
