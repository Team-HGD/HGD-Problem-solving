// https://school.programmers.co.kr/learn/courses/30/lessons/389478

import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    var boxes = [[Int]](repeating: [Int](repeating: -1, count: w), count: n / w + 1)
    var floor = 0
    for boxNum in stride(from: 1, through: n, by: w) {
        if (boxNum / w) % 2 == 1 {
            boxes[floor] = Array(stride(from: boxNum + w - 1, through: boxNum, by: -1))
        } else {
            boxes[floor] = Array(boxNum..<boxNum + w)
        }
        floor += 1
    }
    var numIndex = 0
    boxes.forEach {
        guard let firstIndex = $0.firstIndex(where: { $0 == num }) else { return }
        numIndex = firstIndex
    }
    return boxes.map { $0[numIndex] }.filter { $0 >= num && $0 <= n }.count
}
