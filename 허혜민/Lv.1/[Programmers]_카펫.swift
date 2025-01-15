// https://school.programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    let area = brown + yellow 
    let sqrt = pow(Double(area), 0.5)
    
    for i in 1...Int(sqrt+1) {
        if area % i == 0, 
        ((area / i) + i - 2) * 2 == brown {
            return [area/i, i]
        }
    }
    
    return [-1]
}
