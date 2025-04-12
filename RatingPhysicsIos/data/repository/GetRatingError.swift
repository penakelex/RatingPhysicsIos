import Foundation

enum GetRatingError: Error {
    case canNotAccessServer
    case invalidPassword
}
