// https://school.programmers.co.kr/learn/courses/30/lessons/388351

import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    struct Time {
        var hour: Int
        var minute: Int
        init(timeLog: Int) {
            self.hour = (timeLog / 100) + (timeLog % 100) / 60
            self.minute = (timeLog % 100) % 60
        }
    }
    func diff(_ lhs: Time, _ rhs: Time) -> Int {
        let lhsTotal = lhs.hour * 60 + lhs.minute
        let rhsTotal = rhs.hour * 60 + rhs.minute
        return lhsTotal - rhsTotal
    } 
    var employeeStat = [Bool](repeating: true, count: schedules.count)
    let typedSchedules = schedules.map { Time(timeLog: $0) }
    let typedTimeLogs = timelogs.map { timelog in 
        timelog.map { log in 
            Time(timeLog: log)
        }
    }
    for elapsed in 0..<7 where (startday - 1 + elapsed) % 7 + 1 < 6 {
        for employee in schedules.indices where employeeStat[employee] {
            guard diff(typedTimeLogs[employee][elapsed], typedSchedules[employee]) > 10 else {
                continue
            }
            employeeStat[employee] = false
        }
    }
    return employeeStat.filter { $0 }.count
}
