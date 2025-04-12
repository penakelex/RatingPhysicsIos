import Foundation

protocol RatingRepository {
    func getRatingDataByPassword(password: UInt32, fileURL: URL, fileType: CipheredFileType) async throws -> RatingData
}
