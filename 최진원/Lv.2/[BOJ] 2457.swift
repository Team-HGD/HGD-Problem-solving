typealias Period = (start: Int, end: Int)

func convertDate(month: Int, day: Int) -> Int {
    let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return monthDays.prefix(month - 1).reduce(0) { $0 + $1 } + day
}

let n = Int(readLine()!)!
var flowers = [Period]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let start = convertDate(month: input[0], day: input[1])
    let end = convertDate(month: input[2], day: input[3])
    flowers.append((max(start, 60), min(end, 335)))
}

flowers.sort { $0.start < $1.start }

var pointer = 0
var currentDay = 60
var answer = 0
var maxEnd = 0

while pointer < n && currentDay < 335 {
    var found = false
    while pointer < n && flowers[pointer].start <= currentDay {
        maxEnd = max(maxEnd, flowers[pointer].end)
        pointer += 1
        found = true
    }
    if !found { break }
    currentDay = maxEnd
    answer += 1
    if currentDay >= 335 { break }
}

print(currentDay >= 335 ? answer : 0)