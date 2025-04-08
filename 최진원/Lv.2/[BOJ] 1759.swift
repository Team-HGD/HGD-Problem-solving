// https://www.acmicpc.net/problem/1759

func dfs(vowelCount: Int, consonantCount: Int, curIdx: Int) {
    if passwordCandidate.count == l {
        guard vowelCount >= 1 && consonantCount >= 2 else { return }
        print(passwordCandidate)
        return
    }
    for idx in curIdx..<characters.count {
        let char = String(characters[idx])
        let isVowel = vowels.contains(char)
        passwordCandidate += char
        dfs(
            vowelCount: isVowel ? vowelCount + 1 : vowelCount,
            consonantCount: isVowel ? consonantCount : consonantCount + 1,
            curIdx: idx + 1
        )
        passwordCandidate.removeLast()
    }
}

let lc = readLine()!.split(separator: " ").compactMap { Int($0) }
let (l, c) = (lc[0], lc[1])
let characters = readLine()!.split(separator: " ").sorted()
let vowels: Set<String> = ["a", "e", "i", "o", "u"]
var passwordCandidate = ""
dfs(vowelCount: 0, consonantCount: 0, curIdx: 0)
