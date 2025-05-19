// https://school.programmers.co.kr/learn/courses/30/lessons/340211

import Foundation

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    struct Location: Equatable, Hashable {
        var row: Int
        var column: Int
    }
    struct RouteKey: Hashable {
        let from: Location
        let to: Location
    }
    func findShortestRoute(from start: Location, to destination: Location) -> [Location] {
        let key = RouteKey(from: start, to: destination)
        if let cached = dp[key] {
            return cached
        }
        var path = [Location]()
        var (r1, c1) = (start.row, start.column)
        let (r2, c2) = (destination.row, destination.column)

        while r1 != r2 {
            r1 += (r1 < r2 ? 1 : -1)
            path.append(Location(row: r1, column: c1))
        }
        while c1 != c2 {
            c1 += (c1 < c2 ? 1 : -1)
            path.append(Location(row: r1, column: c1))
        }
        dp[key] = path
        return path
    }
    var answer = 0
    let (r, c) = (points.map { $0[0] }.max() ?? 0, points.map { $0[1] }.max() ?? 0)
    var pointsTable = [Int: Location]()
    var dp = [RouteKey: [Location]]()
    points.enumerated().forEach { (idx, location) in
        pointsTable[idx + 1] = Location(row: location[0], column: location[1]) 
    }
    var shortestRoutes = [[Location]](repeating: [], count: routes.count + 1)
    for (idx, route) in routes.enumerated() {
        let robotIndex = idx + 1
        for (routeIndex, point) in route.enumerated() {
            let destination = pointsTable[point]!
            if routeIndex == 0 {
                shortestRoutes[robotIndex].append(destination)
                continue
            }
            let start = shortestRoutes[robotIndex].last!
            shortestRoutes[robotIndex].append(contentsOf: findShortestRoute(from: start, to: destination))
        }
    }
    let maxRouteLength = shortestRoutes.map { $0.count }.max() ?? 0
    for time in 0..<maxRouteLength {
        var locationCounter = [Location: Int]()
        for robot in 1...routes.count where shortestRoutes[robot].indices ~= time {
            let location = shortestRoutes[robot][time]
            locationCounter[location, default: 0] += 1
        }
        answer += locationCounter.values.filter { $0 >= 2 }.count
    }
    return answer
}