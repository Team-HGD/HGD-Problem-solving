//https://www.acmicpc.net/problem/14499

import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))!}
var boards: [[Int]] = []
let rowLength = input[0]
let colLength = input[1]
var row = input[2]
var col = input[3]
var dice = Dice()
for _ in 0..<rowLength {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    boards.append(input)
}

let instructions = readLine()!.split(separator: " ").compactMap{ Int(String($0))}

if boards[row][col] == 0 { boards[row][col] = dice.bottomNumber } // 주사위 숫자 복사
else {
        let num = boards[row][col]
        boards[row][col] = 0
        dice.getNumAtBottom(num)
}
// 동쪽은 1, 서쪽은 2, 북쪽은 3, 남쪽은 4
for instr in instructions {
    guard (instr == 1 && col < (colLength - 1)) || (instr == 2 && col > 0) || // 주사위가 범위 밖을 나가는 경우
        (instr == 3 && row > 0) || (instr == 4 && row < (rowLength - 1))  else { continue }
    if instr == 1 { col += 1}
    else if instr == 2 { col -= 1}
    else if instr == 3 { row -= 1}
    else if instr == 4 { row += 1}
    
    let num = boards[row][col]
    dice.changeDirection(instr)
    if num == 0 { boards[row][col] = dice.bottomNumber } // 주사위 숫자 복사
    else {
        dice.getNumAtBottom(boards[row][col])
        boards[row][col] = 0
    }
    print(dice.topNumber)
}

struct Dice {
    private var container: [Int] = Array(repeating: 0, count: 6) // 주사위 각 면의 숫자를 저장하는 배열
    
    // 각 면에 대한 인덱스 (0: top, 5: bottom, 1: back, 2: right, 3: left, 4: front)
    var top: Int {
        return container[0]
    }
    
    var bottom: Int {
        return container[5]
    }
    
    var left: Int {
        return container[3]
    }
    
    var right: Int {
        return container[2]
    }
    
    var front: Int {
        return container[4]
    }
    
    var back: Int {
        return container[1]
    }
    
    var topNumber: Int {
        return container[0] // top 면의 숫자
    }
    
    var bottomNumber: Int {
        return container[5] // bottom 면의 숫자
    }
    
    // 주사위의 bottom을 특정 값으로 설정
    mutating func getNumAtBottom(_ value: Int) {
        container[5] = value
    }
    
    // 주사위가 방향에 맞게 회전하는 함수들
    mutating func changeDirection(_ value: Int) {
        if value == 1 { goEast() }
        else if value == 2 { goWest() }
        else if value == 3 { goNorth() }
        else if value == 4 { goSouth() }
    }
    
    // 북쪽으로 이동
    mutating func goNorth() {
        let tempTop = container[0]
        container[0] = container[4]  // top <- front
        container[4] = container[5]  // front <- bottom
        container[5] = container[1]  // bottom <- back
        container[1] = tempTop      // back <- top
    }
    
    // 남쪽으로 이동
    mutating func goSouth() {
        let tempTop = container[0]
        container[0] = container[1]  // top <- back
        container[1] = container[5]  // back <- bottom
        container[5] = container[4]  // bottom <- front
        container[4] = tempTop      // front <- top
    }
    
    // 동쪽으로 이동
    mutating func goEast() {
        let tempTop = container[0]
        container[0] = container[2]  // top <- right
        container[2] = container[5]  // right <- bottom
        container[5] = container[3]  // bottom <- left
        container[3] = tempTop      // left <- top
    }
    
    // 서쪽으로 이동
    mutating func goWest() {
        let tempTop = container[0]
        container[0] = container[3]  // top <- left
        container[3] = container[5]  // left <- bottom
        container[5] = container[2]  // bottom <- right
        container[2] = tempTop      // right <- top
    }
}
/*
 주사위가 이동할 때 특정 면들의 변화를 찾는데 오래 걸렸다. 다른 코드를 살펴보니 되게 심플하게 작성했다.
 switch dir {
         case 1:  // 동쪽
             dice = [dice[3], dice[1], dice[0], dice[5], dice[4], dice[2]]
         case 2:  // 서쪽
             dice = [dice[2], dice[1], dice[5], dice[0], dice[4], dice[3]]
         case 3:  // 북쪽
             dice = [dice[4], dice[0], dice[2], dice[3], dice[5], dice[1]]
         case 4:  // 남쪽
             dice = [dice[1], dice[5], dice[2], dice[3], dice[0], dice[4]]
         default:
             break
     }
 
 사고과정을 생각해보니 각 면에 대해서 이름을 붙이는 작업을 수행했을 거 같다. 그렇다면 각각에 대해서 더 쉽게 할 수 있는 것이다. 
 0번: 상면 (Top)
 •    1번: 하면 (Bottom)
 •    2번: 오른쪽 (Right)
 •    3번: 왼쪽 (Left)
 •    4번: 앞면 (Front)
 •    5번: 뒷면 (Back)

 ~/
