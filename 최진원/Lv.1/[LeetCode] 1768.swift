// https://leetcode.com/problems/merge-strings-alternately/?envType=study-plan-v2&envId=leetcode-75

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var word1Array = Array(word1)
        var word2Array = Array(word2)
        var arraySuffix = [Character]()
        let diff = word1Array.count - word2Array.count
        var answer = ""
        if diff > 0 {
            arraySuffix = word1.suffix(diff)
        } else if diff < 0 {
            arraySuffix = word2.suffix(-diff)
        }
        for (letter1, letter2) in zip(word1, word2) {
            answer.append(letter1)
            answer.append(letter2)
        }
        arraySuffix.forEach { answer.append($0) }
        return answer
    }
}
