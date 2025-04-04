typealias DeliveryOrder = (from: Int, to: Int, quantity: Int)

let nc = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, c) = (nc[0], nc[1])
let m = Int(readLine()!)!
var deliveryTable = [DeliveryOrder]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    deliveryTable.append((from: input[0], to: input[1], quantity: input[2]))
}
deliveryTable.sort { ($0.to, -$0.from) < ($1.to, -$1.from) }

var answer = 0
var truckCapacity = [Int](repeating: 0, count: n + 1)
deliveryTable.forEach { order in
    let maxCapacity = truckCapacity[order.from..<order.to].max()!
    let availableQuantity = maxCapacity + order.quantity <= c ? order.quantity : c - maxCapacity
    for village in order.from..<order.to {
        truckCapacity[village] += availableQuantity
    }
    answer += availableQuantity
}

print(answer)
