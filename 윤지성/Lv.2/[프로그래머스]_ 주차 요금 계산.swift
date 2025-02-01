// https://school.programmers.co.kr/learn/courses/30/lessons/92341
import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var inRecordDict: [Int: String] = [:]
    var timeDict: [Int: Int] = [:]
    records.forEach { record in
        let inputArr = record.split(separator: " ").map{ String($0)}
        let time = inputArr[0]
        let car = Int(inputArr[1])!
        let state = inputArr[2]
        switch state {
            case "IN":
            inRecordDict[car] = time
            case "OUT":
            if let parkingTime = timeDict[car] {
                timeDict[car] = parkingTime + remainingTime(inRecordDict[car]!, time)
            } else {
                timeDict[car] = remainingTime(inRecordDict[car]!, time)
            }
            inRecordDict[car] = nil
            default:
            break
        }
    }
    inRecordDict.keys.forEach { car in
        if let parkingTime = timeDict[car] {
                timeDict[car] = parkingTime + remainingTime(inRecordDict[car]!)
            } else {
                timeDict[car] = remainingTime(inRecordDict[car]!)
            }
    }
    return timeDict.keys.sorted().map{ car in
        var parkingTime = timeDict[car]!
        var fee = fees[1]
        parkingTime -= fees[0]
        if parkingTime > 0 {
            var output = Int(ceil(Double(parkingTime) / Double(fees[2])))
            fee += output * fees[3]
        }
        return fee
    }
}
func remainingTime(_ startTime: String, _ endTime: String = "23:59") -> Int {
    let startInput = startTime.split(separator: ":").map{ Int(String($0))! }
    let endInput = endTime.split(separator: ":").map{ Int(String($0))! }
    return (endInput[0] - startInput[0]) * 60 + (endInput[1] - startInput[1])
}
