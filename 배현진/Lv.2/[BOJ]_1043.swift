// https://www.acmicpc.net/problem/1043

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let truthLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]
let truthCount = truthLine[0]
let truthPeople = truthLine.dropFirst()
var parties: [[Int]] = []
var unionFind = UnionFind(n)
var result = 0

for _ in 0..<m {
    let party = readLine()!.split(separator: " ").map { Int($0)! }
    parties.append(Array(party.dropFirst()))
}

if truthCount > 0 {
    let firstTruthPerson = truthPeople.first!
    for person in truthPeople {
        unionFind.union(firstTruthPerson, person)
    }
}

for party in parties {
    let firstPerson = party.first!
    for person in party {
        unionFind.union(firstPerson, person)
    }
}

for party in parties {
    var canLie = true
    for person in party {
        if truthCount > 0 && unionFind.find(person) == unionFind.find(truthPeople.first!) {
            canLie = false
            break
        }
    }
    if canLie {
        result += 1
    }
}

struct UnionFind {
    var parent: [Int]

    init(_ size: Int) {
        parent = Array(0...size)
    }

    mutating func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    mutating func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        if rootX != rootY {
            parent[rootY] = rootX
        }
    }
}

print(result)
