// https://www.acmicpc.net/problem/18869

import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let n = input[0]
let m = input[1]
var universes: [[Int]] = []
var answer: Int = 0
(1...n).forEach {
    _ in
    var planets = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    let sortedPlanets = Array(Set(planets)).sorted()
    
    for (idx, planet) in planets.enumerated() {
        var lt = 0
        var rt = sortedPlanets.count - 1
        
        while lt <= rt {
            let mid = (lt + rt) / 2
            let sortedPlanet = sortedPlanets[mid]
            if planet == sortedPlanet {
                planets[idx] = mid
                break
            } else if planet < sortedPlanet { rt = mid - 1}
            else if planet > sortedPlanet { lt = mid + 1}
        }
    }
    universes.append(planets)
}

for i in 0...(n - 2) {
    let firstUniverse = universes[i]
    for j in (i + 1)...(n - 1) {
        if firstUniverse == universes[j] { answer += 1}
    }
}
print(answer)
