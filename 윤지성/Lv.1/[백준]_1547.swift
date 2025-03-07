// https://www.acmicpc.net/problem/1547
import Foundation

let t = Int(readLine()!)!
var posistion = 1

(1...t).forEach { _ in
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
    if arr[0] == posistion {
        posistion = arr[1]
    } else if arr[1] == posistion {
        posistion = arr[0]
    }
}
print(posistion)
