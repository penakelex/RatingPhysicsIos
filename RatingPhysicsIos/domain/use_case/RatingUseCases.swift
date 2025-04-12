class RatingUseCases {
    let getRatingUseCase: GetRatingUseCase
    
    init(ratingRepository: RatingRepository) {
        self.getRatingUseCase = GetRatingUseCase(repository: ratingRepository)
    }
}
