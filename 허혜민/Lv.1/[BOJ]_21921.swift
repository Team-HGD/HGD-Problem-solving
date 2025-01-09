// https://www.acmicpc.net/problem/21921

func main_21921() {
    let nX = readLine()!.split(separator: " ").map{ Int($0)! }
    let (n, x) = (nX[0], nX[1])
    let visitor = readLine()!.split(separator: " ").map{ Int($0)! }
    var maxVisitor = visitor[0...x-1].reduce(0, +)
    var maxDay = 1
    var sum = maxVisitor
    for i in x..<n {
        sum = sum - visitor[i-x] + visitor[i]
        if maxVisitor < sum {
            maxVisitor = sum
            maxDay = 1
        } else if maxVisitor != 0, maxVisitor == sum {
            maxDay += 1
        }
    }

    print(maxVisitor == 0 ? "SAD" : maxVisitor)
    print(maxVisitor == 0 ? "" : maxDay, terminator: "")
}
main_21921()
