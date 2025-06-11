// https://www.acmicpc.net/source/95219982

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (h, w, x, y) = (input[0], input[1], input[2], input[3])
var arrayB = [[Int]]()
for _ in 0..<h + x {
    arrayB.append(readLine()!.split(separator: " ").compactMap { Int($0) })
}
var arrayA = arrayB.map { $0.prefix(w) }.prefix(h)
for i in arrayA.indices {
    for j in arrayA[i].indices {
        if x..<h ~= i && y..<w ~= j {
            arrayA[i][j] = arrayB[i][j] - arrayA[i - x][j - y]
        }
    }
}
arrayA.forEach { line in
    line.enumerated().forEach { print($0.element, terminator: $0.offset == line.count - 1 ? "\n" : " ") }
}
