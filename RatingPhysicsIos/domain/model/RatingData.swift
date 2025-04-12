import Foundation

struct RatingData : Decodable {
    let fullName: String
    let group: String
    let summary: Float16
    let ratingGroup: UInt8
    let ratingFlow: UInt16
    let colloquium: UInt8?
    let cgtCw: Float16
    let lw: UInt8?
    let it: UInt8?
    let essay: UInt8?
    let nirs: UInt8?
    let sumPractice: UInt16
    let omissions: UInt8
    let practicalLessons: [PracticalLesson]
    let cgts: [UInt8?]
    
    private enum CodingKeys : String, CodingKey {
        case fullName = "full_name"
        case group
        case summary
        case ratingGroup = "rating_group"
        case ratingFlow = "rating_flow"
        case colloquium
        case cgtCw = "cgt_cw"
        case lw
        case it
        case nirs
        case essay
        case sumPractice = "sum_practice"
        case omissions
        case practicalLessons = "practical_lessons"
        case cgts
    }
}
