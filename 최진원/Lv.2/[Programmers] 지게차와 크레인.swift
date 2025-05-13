import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    typealias Location = (row: Int, column: Int)
    func stacker(target: String) {
        var reachableLocation = [Location]()
        for row in stringStorage.indices {
            for column in stringStorage[row].indices {
                guard stringStorage[row][column] == target else { continue }
                let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
                for move in moves {
                    let (newRow, newColumn) = (row + move.0, column + move.1)
                    if !(0..<n ~= newRow) || !(0..<m ~= newColumn) { 
                        reachableLocation.append((row: row, column: column))
                        break
                    }
                    if stringStorage[newRow][newColumn] == "empty" {
                        reachableLocation.append((row: row, column: column))
                        break
                    }
                }
            }
        }
        reachableLocation.forEach { (row, column) in
            stringStorage[row][column] = "empty"
            answer -= 1
        }
    }
    func crane(target: String) {
        for row in stringStorage.indices {
            for column in stringStorage[row].indices {
                guard stringStorage[row][column] == target else { continue }
                stringStorage[row][column] = "crane_empty"
                answer -= 1
            }
        }
    }
    func checkReachable() {
        var changed = true
        while changed {
            changed = false
            for row in stringStorage.indices {
                for column in stringStorage[row].indices {
                    guard stringStorage[row][column] == "crane_empty" else { continue }
                    let moves = [(-1, 0), (0, 1), (1, 0), (0, -1)]
                    for move in moves {
                        let (newRow, newColumn) = (row + move.0, column + move.1)
                        if !(0..<n ~= newRow) || !(0..<m ~= newColumn) {
                            stringStorage[row][column] = "empty"
                            changed = true
                            break
                        }
                        if stringStorage[newRow][newColumn] == "empty" {
                            stringStorage[row][column] = "empty"
                            changed = true
                            break
                        }
                    }
                }
            }
        }
    }
    
    let (n, m) = (storage.count, storage.first!.count)
    var answer = n * m
    var stringStorage = storage.map { $0.map { String($0) } }
    requests.forEach { request in
        if request.count == 2 { 
            let target = String(request.first!)
            crane(target: target)
        } else {
            let target = String(request)
            stacker(target: target)
        }
        checkReachable()
    }
    print(answer)
    return answer
}
