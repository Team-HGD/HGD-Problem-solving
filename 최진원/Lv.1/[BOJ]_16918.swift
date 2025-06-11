// https://www.acmicpc.net/problem/16918

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (r, c, n) = (input[0], input[1], input[2])
var initState = [[Character]]()
for _ in 0..<r {
    initState.append(Array(readLine()!))
}
let fullState = [[Character]](repeating: [Character](repeating: "O", count: c), count: r)

var currentState = initState
var emptySpace = [(row: Int, column: Int)]()
for row in currentState.indices {
    for column in currentState[row].indices {
        if currentState[row][column] == "O" {
            emptySpace.append((row, column))
            for move in [(0, -1), (1, 0), (0, 1), (-1, 0)] {
                let (newRow, newColumn) = (row + move.0, column + move.1)
                guard 0..<r ~= newRow && 0..<c ~= newColumn else { continue }
                emptySpace.append((newRow, newColumn))
            }
        }
    }
}
var boomState1 = fullState
emptySpace.forEach { (row, column) in
    boomState1[row][column] = "."
}
emptySpace = []
currentState = boomState1
for row in currentState.indices {
    for column in currentState[row].indices {
        if currentState[row][column] == "O" {
            emptySpace.append((row, column))
            for move in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
                let (newRow, newColumn) = (row + move.0, column + move.1)
                guard 0..<r ~= newRow && 0..<c ~= newColumn else { continue }
                emptySpace.append((newRow, newColumn))
            }
        }
    }
}
var boomState2 = fullState
emptySpace.forEach { (row, column) in
    boomState2[row][column] = "."
}
if n == 1 {
    initState.forEach { line in
        line.enumerated().forEach { print($0.element, terminator: $0.offset == line.count - 1 ? "\n" : "") }
    }
} else if n % 2 == 0 {
    fullState.forEach { line in
        line.enumerated().forEach { print($0.element, terminator: $0.offset == line.count - 1 ? "\n" : "") }
    }
} else if n % 4 == 3 {
    boomState1.forEach { line in
        line.enumerated().forEach { print($0.element, terminator: $0.offset == line.count - 1 ? "\n" : "") }
    }
} else if n % 4 == 1 {
    boomState2.forEach { line in
        line.enumerated().forEach { print($0.element, terminator: $0.offset == line.count - 1 ? "\n" : "") }
    }
} 

// full 2 4 6...
// boom1 3 7 11
// init 1
// boom2 5 9...