//https://www.acmicpc.net/problem/13549
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))!}
var curIdx = input[0]
var sisterIdx = input[1]

var anotherDp: [(Int, Int)] = [(curIdx, 0)]
var visited: [Int: Int] = [curIdx : 0]
var temp: [(Int, Int)] = []
var answer: Int = 100_000 + 1

func findMinimumTime() -> Int {
    while !anotherDp.isEmpty {
        temp = []
        for value in anotherDp {
            let num = value.0
            let time = value.1
            checkMinimumNumber((num - 1, time + 1))
            
            if sisterIdx > num {
                checkMinimumNumber((num + 1, time + 1))
            
                let afterDifference = 2 * num - sisterIdx > 0 ? 2 * num - sisterIdx: sisterIdx - 2 * num
                let currentDifference = sisterIdx - num
                if currentDifference > afterDifference {
                    checkMinimumNumber((num * 2, time))
                }
            }
        }
        anotherDp = temp
    }
    return visited[sisterIdx]!
}

func checkMinimumNumber(_ value: (Int, Int)) {
    let num = value.0
    let moveCnt = value.1
    guard num >= 0 else { return }
    if let count = visited[num] {
            if moveCnt < count {
                visited[num] = moveCnt
                temp.append(value)
            }
        } else {
            visited[num] = moveCnt
            temp.append(value)
        }
}

print(findMinimumTime())

/*
 dp로 풀었다.
 좌표별로 해당 좌표에 도착할 때 걸리는 최소 시간을 저장할 배열을 세팅해놓는다.
 해당 좌표를 기준으로 +1, -1, 2* 를 수행하고 걸리는 시간과 함께 다음 턴에 탐색할 좌표를 저장해놓은 배열에 저장한다.
 dp로 풀기 위해서는 각각의 제한이 있어야 한다. 무조건적으로 3개의 경우를 탐색한다면 시간복잡도 측면에서 매우 비효율적일것이다.
 
 기존 좌표가 목표보다 작을 경우에만 +1, *2만 하고
 *2 인 경우에는 이동할 경우의 차이가 현재 위치의 차이보다 작을 경우에만 수행하는 것이다.
 
 -1에 대해서 제한을 했으나 이 부분이 잘못되었다. -1 을 할 경우 *2할 때 최적을 찾아주기 때문에 이 부분에서 제한을 걸어두면 안된다.
 그리고 무조건 *2가 많은 경우가 최적일 확률이 높으므로 도달 할 경우에 탐색을 멈춰서는 안된다.
 
 내가 *2, +1에 대해서 제한을 해두었고 이미 탐색을 마친 좌표에 대해서 더 큰 시간이 걸리는 경우에는 그 연산(+1, -1, *2)를 수행하여 탐색하지 않도록 제한을 해두었다.
 따라서 탐색할 배열이 빌 때까지 탐색을 하도록 하는 것이 맞다.
 
 */


