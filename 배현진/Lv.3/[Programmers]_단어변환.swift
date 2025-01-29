// https://school.programmers.co.kr/learn/courses/30/lessons/43163

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target){
        return 0
    }

    var queue = [String]()
    var visited = Array(repeating: false, count: words.count)
    var count = 0

    queue.append(begin)
    while !queue.isEmpty{
        let now = queue.popLast()!
        if(now == target) { break }

        for idx in 0..<words.count{
            if !visited[idx]{
                if wordCompare(now, words[idx]){
                    queue.append(words[idx])
                    visited[idx] = true
                }
            }
        }
        count += 1
    }

    return count
}

func wordCompare(_ word1: String, _ word2: String) -> Bool{
    var count = 0
    let wordArr1 = Array(word1)
    let wordArr2 = Array(word2)

    for i in 0..<wordArr1.count{
        if wordArr1[i] != wordArr2[i]{
            count += 1
        }

        if count > 1{
            return false
        }
    }

    return true
}
