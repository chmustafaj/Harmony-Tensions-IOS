//
//  Utils.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 09/03/2023.
//

import Foundation

public class Utils{
    
   




    let songsString = ["Ah-Leu-Cha", "An Oscar For Treadwell", "Another Hair Do", "Anthropology"]


    

    func getSeventh(_ key: String) -> Int {
        switch key {
        case "C":
            return 5
        case "G":
            return 6
        case "D":
            return 7
        case "A":
            return 8
        case "E":
            return 9
        case "B":
            return 10
        case "F#":
            return 11
        case "Db":
            return 0
        case "Ab":
            return 1
        case "Eb":
            return 2
        case "Bb":
            return 3
        case "F":
            return 4
        default:
            return 0
        }
    }

    func getSecond(_ key: String) -> Int {
        switch key {
        case "C":
            return 2
        case "G":
            return 3
        case "D":
            return 4
        case "A":
            return 5
        case "E":
            return 6
        case "B":
            return 7
        case "F#":
            return 8
        case "Db":
            return 9
        case "Ab":
            return 10
        case "Eb":
            return 11
        case "Bb":
            return 0
        case "F":
            return 1
        default:
            return 0
        }
    }

    func getFifth(_ key: String) -> Int {
        switch key {
        case "C":
            return 1
        case "G":
            return 2
        case "D":
            return 3
        case "A":
            return 4
        case "E":
            return 5
        case "B":
            return 6
        case "F#":
            return 7
        case "Db":
            return 8
        case "Ab":
            return 9
        case "Eb":
            return 10
        case "Bb":
            return 11
        case "F":
            return 0
        default:
            return 0
        }
    }

    func getThird(_ key: String) -> Int {
        switch key {
        case "C":
            return 4
        case "G":
            return 5
        case "D":
            return 6
        case "A":
            return 7
        case "E":
            return 8
        case "B":
            return 9
        case "F#":
            return 10
        case "Db":
            return 11
        case "Ab":
            return 0
        case "Eb":
            return 1
        case "Bb":
            return 2
        case "F":
            return 3
        default:
            return 0
        }
    }
    func getSixth(_ key: String) -> Int {
        switch key {
        case "C":
            return 3
        case "G":
            return 4
        case "D":
            return 5
        case "A":
            return 6
        case "E":
            return 7
        case "B":
            return 8
        case "F#":
            return 9
        case "Db":
            return 10
        case "Ab":
            return 11
        case "Eb":
            return 0
        case "Bb":
            return 1
        case "F":
            return 2
        default:
            return 0
        }
    }

    func getFourth(_ key: String) -> Int {
        switch key {
        case "C":
            return 11
        case "G":
            return 0
        case "D":
            return 1
        case "A":
            return 2
        case "E":
            return 3
        case "B":
            return 4
        case "F#":
            return 5
        case "Db":
            return 6
        case "Ab":
            return 7
        case "Eb":
            return 8
        case "Bb":
            return 9
        case "F":
            return 10
        default:
            return 0
        }
    }

  func getFirst(_ key: String) -> Int {
        switch key {
        case "C":
            return 0
        case "G":
            return 1
        case "D":
            return 2
        case "A":
            return 3
        case "E":
            return 4
        case "B":
            return 5
        case "F#":
            return 6
        case "Db":
            return 7
        case "Ab":
            return 8
        case "Eb":
            return 9
        case "Bb":
            return 10
        case "F":
            return 11
        default:
            return 0
        }
    }
    func getSecondaryDominant(secondaryDominantNumber: Int, key: String) -> Int {
        var secondaryDom: Int
        
        switch key {
        case "C":
            return secondaryDominantNumber
        case "G":
            return secondaryDominantNumber + 1
        case "D":
            return secondaryDominantNumber + 2
        case "A":
            return secondaryDominantNumber + 3
        case "E":
            return secondaryDominantNumber + 4
        case "B":
            return secondaryDominantNumber + 5
        case "F#":
            secondaryDom = secondaryDominantNumber + 6
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Db":
            secondaryDom = secondaryDominantNumber + 7
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Ab":
            secondaryDom = secondaryDominantNumber + 8
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Eb":
            secondaryDom = secondaryDominantNumber + 9
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Bb":
            secondaryDom = secondaryDominantNumber + 10
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "F":
            secondaryDom = secondaryDominantNumber + 11
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        default:
            return 0
        }
    }
    func getDiminished(_ diminished: Int, _ key: String) -> Int {
        var diminishedNo: Int
        switch key {
            case "C":
                diminishedNo = diminished + 6
                return diminishedNo
            case "G":
                diminishedNo = diminished + 7
                return diminishedNo
            case "D":
                diminishedNo = diminished + 8
                return diminishedNo
            case "A":
                diminishedNo = diminished + 9
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "E":
                diminishedNo = diminished + 10
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "B":
                diminishedNo = diminished + 11
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "F#":
                diminishedNo = diminished + 12
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Db":
                diminishedNo = diminished + 13
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Ab":
                diminishedNo = diminished + 14
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Eb":
                diminishedNo = diminished + 15
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Bb":
                diminishedNo = diminished + 16
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "F":
                diminishedNo = diminished + 17
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            default:
                return 0
        }
    }
    func getDominant(secondaryDominant: Int, key: String) -> Int { //The dominant to go to is determined by the secondary dominant we are on
    let random = Int.random(in: 0...1) //One of two dominants can be selected, based on the secondary dominant we are on
    switch secondaryDominant {
    case 1: //referring to v7/1
    if random == 0 {
    return getFirst(key)
    } else {
    return getFifth(key)
    }
    case 0: //referring to v7/iv
    if random == 0 {
    return getFirst(key)
    } else {
    return getFourth(key)
    }
    case 2: //referring to v7/v
    if random == 0 {
    return getSecond(key)
    } else {
    return getFifth(key)
    }
    case 3: //referring to v7/ii
    if random == 0 {
    return getSecond(key)
    } else {
    return getSixth(key)
    }
    case 5: //referring to v7/vi
    if random == 0 {
    return getSixth(key)
    } else {
    return getThird(key)
    }
    case 4: //referring to v7/iii
    if random == 0 {
    return getThird(key)
    } else {
    return getSeventh(key)
    }
    default:
    break
    }
    return 0
    }
    func getStepFromNote(key: String, note: String) -> Int {
        switch key {
        case "C":
            switch note {
            case "C":
                return 1
            case "D":
                return 2
            case "G":
                return 5
            case "A":
                return 6
            case "E":
                return 3
            case "B":
                return 7
            default:
                return 1
            }
        case "G":
            switch note {
            case "G":
                return 1
            case "D":
                return 5
            case "A":
                return 2
            case "E":
                return 6
            case "B":
                return 3
            case "F#":
                return 7
            default:
                return 1
            }
        case "D":
            switch note {
            case "A":
                return 5
            case "E":
                return 2
            case "B":
                return 6
            case "F#":
                return 3
            case "Db":
                return 7
            default:
                return 1
            }
        case "A":
            switch note {
            case "A":
                return 1
            case "E":
                return 5
            case "B":
                return 2
            case "F#":
                return 6
            case "Db":
                return 3
            case "Ab":
                return 7
            default:
                return 1
            }
        case "E":
            switch note {
            case "E":
                return 1
            case "B":
                return 5
            case "F#":
                return 2
            case "Db":
                return 6
            case "Ab":
                return 3
            case "Eb":
                return 7
            default:
                return 1
            }
        case "B":
            switch note {
            case "B":
                return 1
            case "F#":
                return 5
            case "Db":
                return 2
            case "Ab":
                return 6
            case "Eb":
                return 3
            case "Bb":
                return 7
            default:
                return 1
            }
        case "F#":
            switch note {
            case "F#":
                return 1
            case "Db":
                return 5
            case "Ab":
                return 2
            case "Eb":
                return 6
            case "Bb":
                return 3
            case "F":
                return 7
            default:
                return 1
            }
        case "Db":
            switch note {
            case "Db":
                return 1
            case "Ab":
                return 5
            case "Eb":
                return 2
            case "Bb":
                return 6
            case "F":
                return 3
            case "C":
                return 7
            default:
                return 1
            }
        case "Ab":
            switch note {
            case "Ab":
                return 1
            case "Eb":
                return 5
            case "Bb":
                return 2
            case "F":
                return 6
            case "C":
                return 3
            case "G":
                return 7
            default:
                return 1
            }
        case "Eb":
            switch note {
            case "Eb":
                return 1
            case "Bb":
                return 5
            case "F":
                return 2
            case "C":
                return 6
            case "G":
                return 3
            case "D":
                return 7
            default:
                return 1
            }
        case "Bb":
            switch note {
            case "Bb":
                return 1
            case "F":
                return 5
            case "C":
                return 2
            case "G":
                return 6
            case "D":
                return 3
            case "A":
                return 7
            default:
                return 1
            }
        case "F":
            switch note {
            case "F":
                return 1
            case "C":
                return 5
            case "G":
                return 2
            case "D":
                return 6
            case "A":
                return 3
            case "E":
                return 7
            default:
                return 1
            }
        default:
            return 1
        }
    }

}
