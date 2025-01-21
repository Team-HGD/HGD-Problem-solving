// https://school.programmers.co.kr/learn/courses/30/lessons/12911

import Foundation

func solution(_ n:Int) -> Int {
    let count = calculateOne(num: n)
    
    for i in n+1..<1000000 {
        if count == calculateOne(num: i) {
            return i
        }
    }
    return n
}

func calculateOne(num: Int) -> Int {
    var result = 0 
    var num = num 
    
    while num > 1 {
        let mod = num % 2
        if mod == 1 {
            result += 1
        }
        num = num / 2 
    }
    
    return (num == 1) ? result + 1 : result
}
