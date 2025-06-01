import Foundation

enum GetRatingError: Error {
    case canNotAccessServer,
         invalidPassword,
         invalidFile
}
