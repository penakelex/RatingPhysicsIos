import Foundation

struct PracticalLesson : Decodable {
    let notAttend:  Bool
    let tasks: UInt8?
    
    private enum CodingKeys : String, CodingKey {
        case notAttend = "not_attend"
        case tasks
    }
}
