//https://www.acmicpc.net/problem/17404
import Foundation

let n = Int(readLine()!)!
var colors: [[Int]] = []
(1...n).forEach { _ in
    let color = readLine()!.split(separator: " ").map{ Int(String($0))!}
    colors.append(color)
}

func getColorPrice(_ colors: [[Int]], _ startsWith: Int) -> Int {
    var red: Int = (1000 + 1) * 2
    var green: Int = (1000 + 1) * 2
    var blue: Int = (1000 + 1) * 2
        let red2 = colors[1][0]
        let green2 = colors[1][1]
        let blue2 = colors[1][2]
        switch startsWith {
            case 0:
            let red1 = colors[0][0]
            blue = red1 + blue2
            green = red1 + green2
            case 1:
            let green1 = colors[0][1]
            red = green1 + red2
            blue = green1 + blue2
            case 2:
            let blue1 = colors[0][2]
            red = blue1 + red2
            green = blue1 + green2
        default:
            break
        }
    if n == 2 { return (min(red, min(blue, green))) }
    for i in 2...(n - 1) {
        let tempRed = min(green + colors[i][0], blue + colors[i][0])
        let tempGreen = min(red + colors[i][1], blue + colors[i][1])
        let tempBlue = min(red + colors[i][2], green + colors[i][2])
        red = tempRed
        green = tempGreen
        blue = tempBlue
    }
    if startsWith == 0 { return min(green, blue)}
    else if startsWith == 1 { return min(red, blue)}
    else { return min(red, green)}
}
let redMinimum = getColorPrice(colors, 0)
let greenMinimum = getColorPrice(colors, 1)
let blueMinimum = getColorPrice(colors, 2)

print(min(min(redMinimum, greenMinimum), blueMinimum))
