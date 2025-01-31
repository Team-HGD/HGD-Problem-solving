// https://www.acmicpc.net/problem/17387

typealias Point = (x: Int, y: Int)
typealias LineSeg = (Point, Point)
enum CCWcase: Int {
    case cw = -1
    case ccw = 1
    case straight = 0
}

func onSeg(_ p1: Point, _ p2: Point, _ p3: Point) -> Bool {
    return min(p1.x, p2.x) <= p3.x && p3.x <= max(p1.x, p2.x) && min(p1.y, p2.y) <= p3.y && p3.y <= max(p1.y, p2.y)
}

func calCCW(_ p1: Point, _ p2: Point, _ p3: Point) -> CCWcase {
    let ccwValue = (p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x)
    if ccwValue > 0 {
        return .ccw
    } else if ccwValue < 0 {
        return .cw
    } else {
        return .straight
    }
}

let input1 = readLine()!.split(separator: " ").compactMap { Int($0) }
let input2 = readLine()!.split(separator: " ").compactMap { Int($0) }

var l1: LineSeg = ((input1[0], input1[1]), (input1[2], input1[3]))
var l2: LineSeg = ((input2[0], input2[1]), (input2[2], input2[3]))


let c1 = calCCW(l1.0, l1.1, l2.0).rawValue
let c2 = calCCW(l1.0, l1.1, l2.1).rawValue
let c3 = calCCW(l2.0, l2.1, l1.0).rawValue
let c4 = calCCW(l2.0, l2.1, l1.1).rawValue

let l1CCWcheck = c1 * c2 <= 0
let l2CCWcheck = c3 * c4 <= 0

if l1CCWcheck && l2CCWcheck {
    if c1 == 0 && c2 == 0 && c3 == 0 && c4 == 0 { 
        if onSeg(l1.0, l1.1, l2.0) || onSeg(l1.0, l1.1, l2.1) ||
           onSeg(l2.0, l2.1, l1.0) || onSeg(l2.0, l2.1, l1.1) {
            print(1)
        } else {
            print(0)
        }
    } else {
        print(1)
    }
} else {
    print(0)
}
