import Foundation

class GetRatingUseCase {
    private let repository: RatingRepository
    
    init(repository: RatingRepository) {
        self.repository = repository
    }
    
    func callAsFunction(password: UInt32, fileURL: URL, type: CipheredFileType) async throws -> RatingData {
        return try await repository.getRatingDataByPassword(password: password, fileURL: fileURL, fileType: type)
    }
}
