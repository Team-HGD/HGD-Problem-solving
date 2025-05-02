typealias DPNode = (center: Int, right: Int)

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var fixedSeats = Set<Int>()
for _ in 0..<m {
    fixedSeats.insert(Int(readLine()!)!)
}
var dp = [DPNode](repeating: (center: 0, right: 0), count: n + 1)
dp[1] = (center: 1, right: 0)

if n > 1 {
    for seatNumber in 2...n {
        if fixedSeats.contains(seatNumber) || fixedSeats.contains(seatNumber - 1) {
            dp[seatNumber].center = dp[seatNumber - 1].center + dp[seatNumber - 1].right
        } else {
            dp[seatNumber].center = dp[seatNumber - 1].center + dp[seatNumber - 1].right
            dp[seatNumber].right = dp[seatNumber - 1].center
        }
    }
}

print(dp[n].center + dp[n].right)
