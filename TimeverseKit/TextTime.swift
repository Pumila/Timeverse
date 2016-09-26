//
//  TextTime.swift
//  Timeverse
//
//  Created by Mohamed Ted Meftah on 9/26/16.
//  Copyright © 2016 Mohamed Ted Meftah. All rights reserved.
//

import Foundation

struct TextTime {
    static let characters = [Character]("ITLISASTIMEACQUARTERDCTWENTYFIVEXHALFBTENFTOPASTERUNINEONESIXTHREEFOURFIVETWOEIGHTELEVENSEVENTWELVETENSEOCLOCK".characters)
    
    static private let minutes = [
        0: [104, 105, 106, 107, 108, 109],
        5: [28, 29, 30, 31],
        10: [38, 39, 40],
        15: [13, 14, 15, 16, 17, 18, 19],
        20: [22, 23, 24, 25, 26, 27],
        25: [22, 23, 24, 25, 26, 27, 28, 29, 30, 31], //20 + 5
        30: [33, 34, 35, 36]
    ]
    
    static private let hours = [
        1:[55, 56, 57],
        2:[74, 75, 76],
        3:[61, 62, 63, 64, 65],
        4:[66, 67, 68, 69],
        5:[70, 71, 72, 73],
        6:[58, 59, 60],
        7:[88, 89, 90, 91, 92],
        8:[77, 78, 79, 80, 81],
        9:[51, 52, 53, 54],
        10:[99, 100, 101],
        11:[82, 83, 84, 85, 86, 87],
        12:[93, 94, 95, 96, 97, 98]
    ]
    
    static private let words = [
        "IT": [0, 1],
        "IS": [3, 4],
        "A": [11],
        "TO": [42, 43],
        "PAST": [44, 45, 46, 47],
        ]
    
    static func getActiveChars(hour: Int, minute: Int)->[Int] {
        var hour = hour, minute = minute
        var modifier = "PAST"
        var activeChars:[Int] = []
        
        if (minute > 30) {
            modifier = "TO"
            hour += 1
            minute = 60 - minute
        }
        
        hour = hour == 0 ? 12 : hour
        
        activeChars += words["IT"]!
        activeChars += words["IS"]!
        
        if (minute == 0) {
            activeChars += hours[hour]!
            activeChars += minutes[0]!
        } else {
            if(minute == 15) { activeChars += words["A"]! }
            activeChars += minutes[minute]!
            activeChars += words[modifier]!
            activeChars += hours[hour]!
        }
        
        return activeChars
    }
}
