// https://school.programmers.co.kr/learn/courses/30/lessons/12973

import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = [] 
    
    for char in s {
        guard let last = stack.last else {
            stack.append(char)
            continue
        }
        if last == char {
            stack.popLast() 
        } else { 
            stack.append(char)
        }
    }

    return stack.isEmpty ? 1 : 0
}
