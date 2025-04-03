// https://www.acmicpc.net/problem/1197
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let v = input[0]
let e = input[1]

var edges: [(Int, Int, Int)] = []
var parents: [Int] = []

for i in 0...v {
    parents.append(i)
}
for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    edges.append((input[0], input[1], input[2]))
}
edges.sort{ $0.2 < $1.2}

var answer: Int = 0
var count: Int = 0
func find(_ val: Int) -> Int {
    if parents[val] != val {
        parents[val] = find(parents[val])
    }
    return parents[val]
}
for (a, b, cost) in edges {
    if count == (v - 1) { break }
    
    let rootA = find(a)
    let rootB = find(b)
    if rootA != rootB {
        parents[rootA > rootB ? rootA : rootB] = rootA > rootB ? rootB :rootA
        answer += cost
        count += 1
    } else { continue }
    
}
print(answer)

/*
 크루스칼 알고리즘을 사용해보았다. 가장 중요한 연산은 union find이다.
 추가하려고 하는 간선의 2 정점이 하나의 집합에 속해있는지를 알아보는 것이다. 즉 둘 관계가 서로소인지를 파악하는 연산이라고 보면된다.
 서로소를 어떻게 파악할 수 있을까? 최상위 부모 정점을 찾아 2개를 비교하는 것이다. 부모가 같다면 같은 집합에 속하는 것이다.
 
 여기에서 문제가 있다. 부모 노드를 찾아가는 과정이다.
 만약 타고 타고 올라가서 n개를 거쳐야 부모 노드를 찾을 수 있다면 탐색에 많은 시간을 투자하게 된다. 그렇다면 이 과정에서 최적화가 필요한 것이다. 한단계씩 부모 노드를 찾는 과정에서 찾은 부모 노드로 update를 하는 것이다.
 그렇다면 다음 연산에 대해서는 n번의 탐색을 거치지 않아도 된다.
 
 아래 블로그에 잘 나와있으니 다시 한번 찾아보자.
 https://blogshine.tistory.com/103
 */
