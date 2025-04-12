import Foundation

class Module {
    static let ratingRepository: RatingRepository = RatingRepositoryImplementation()

    static let ratingUseCases = RatingUseCases(ratingRepository: ratingRepository)
}
