// https://www.acmicpc.net/problem/23971

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Double($0) }
let (h, w, n, m) = (input[0], input[1], input[2], input[3])
print(String(format: "%.0f", ceil(h / (n + 1)) * ceil(w / (m + 1))))
