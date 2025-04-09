// https://www.acmicpc.net/problem/16987

struct Egg {
    var durability: Int
    let weight: Int
    var isBroken: Bool { durability <= 0 }
}

func dfs(handIdx: Int) {
    let brokenEggCount = eggs.filter({ $0.isBroken }).count
    guard handIdx != n else {
        answer = max(answer, brokenEggCount)
        return
    }
    if eggs[handIdx].isBroken || n - brokenEggCount < 2 {
        dfs(handIdx: handIdx + 1)
    } else {
        eggs.indices
        .filter { curIdx in
            curIdx != handIdx && !eggs[curIdx].isBroken 
        }
        .forEach { selectedIdx in
            eggs[handIdx].durability -= eggs[selectedIdx].weight
            eggs[selectedIdx].durability -= eggs[handIdx].weight
            dfs(handIdx: handIdx + 1)
            eggs[handIdx].durability += eggs[selectedIdx].weight
            eggs[selectedIdx].durability += eggs[handIdx].weight
        }
    }
}

let n = Int(readLine()!)!
var eggs = [Egg]()
var answer = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    eggs.append(Egg(durability: input[0], weight: input[1]))
}

dfs(handIdx: 0)
print(answer)
