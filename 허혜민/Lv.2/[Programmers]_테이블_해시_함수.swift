// https://school.programmers.co.kr/learn/courses/30/lessons/147354

import Foundation

func solution(
    _ data:[[Int]],
    _ col:Int,
    _ row_begin:Int,
    _ row_end:Int
) -> Int {
    let sortedData = data.sorted {
        if $0[col-1] < $1[col-1] {
            return true
        } else if $0[col-1] == $1[col-1], 
        $0[0] > $1[0] {
            return true 
        }
        return false 
    }[row_begin-1..<row_end]
    
    return zip(sortedData, (row_begin...row_end))
    .map { data, i in 
        data.map{ $0 % i }.reduce(0, +)
    }
    .reduce(0, ^)
}
