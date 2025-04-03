// https://www.acmicpc.net/problem/1700

func findDeviceToUnplug() -> Int {
    var deviceToUnplug = 0
    var farthestUsageIndex = 0
    for device in plugged {
        guard let nextUsage = schedule[device].last else { return device }
        guard nextUsage > farthestUsageIndex else { continue }
        farthestUsageIndex = nextUsage
        deviceToUnplug = device
    }
    return deviceToUnplug
}

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let order = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])

var plugged = Set<Int>()
var schedule = [[Int]](repeating: [], count: order.max()! + 1)
var answer = 0
order.enumerated().forEach { schedule[$1].append($0) }
schedule = schedule.map { Array($0.reversed()) }
order.forEach { device in
    schedule[device].removeLast()
    guard !plugged.contains(device) else { return }
    if plugged.count == n { 
        let toUnplug = findDeviceToUnplug()
        plugged.remove(toUnplug)
        answer += 1
    }
    plugged.insert(device)
}
print(answer)