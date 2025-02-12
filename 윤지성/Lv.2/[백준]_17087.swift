// https://www.acmicpc.net/problem/17087
import Foundation

let input1 = readLine()!.split(separator: " ").map{ Int(String($0))!}
let input2 = readLine()!.split(separator: " ").map{ Int(String($0))!}
let s = input1[1]
var distance: [Int] = input2.map{ if s > $0 { return s - $0 }
                          else {return $0 - s } }
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a}
    return gcd(b, a % b)
}
if distance.count == 1 { print(distance.last!) }
else if distance.count == 2 { print(gcd(distance[0], distance[1]))}
else {
    var before = gcd(distance[0], distance[1])
    for i in 2..<input1[0] {
        before = gcd(distance[i], before)
        if before == 1 { break }
    }
    print(before)
}
