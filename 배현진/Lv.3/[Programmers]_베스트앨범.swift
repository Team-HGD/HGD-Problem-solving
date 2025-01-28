// https://school.programmers.co.kr/learn/courses/30/lessons/42579

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genreCount: [String: Int] = [:]
    var genreSongs: [String: [(id: Int, playCount: Int)]] = [:]

    for i in 0..<genres.count {
        let genre = genres[i]
        let playCount = plays[i]
        let song = (id: i, playCount: playCount)
        if genreCount[genre] != nil {
            genreCount[genre]! += playCount
            genreSongs[genre]!.append(song)
        } else {
            genreCount[genre] = playCount
            genreSongs[genre] = [song]
        }
    }

    for (genre, songs) in genreSongs {
        genreSongs[genre] = songs.sorted {
            if $0.playCount == $1.playCount {
                return $0.id < $1.id
            }
            return $0.playCount > $1.playCount
        }
    }

    let sortedGenres = genreCount.keys.sorted {
        return genreCount[$0]! > genreCount[$1]!
    }

    var result: [Int] = []
    for genre in sortedGenres {
        if let songs = genreSongs[genre] {
            for i in 0..<min(2, songs.count) {
                result.append(songs[i].id)
            }
        }
    }

    return result
}
