import Alamofire
import Foundation

private let BASE_URL = "http://45.90.46.187:8000/rating_physics"

class RatingRepositoryImplementation : RatingRepository {
    func getRatingDataByPassword(password: UInt32, fileURL: URL, fileType: CipheredFileType) async throws -> RatingData {
        guard let fileData = (try? Data(contentsOf: fileURL)) else {
            throw GetRatingError.invalidFile
        }
        
        do {
            return try await AF.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(
                        fileData,
                        withName: "file",
                        mimeType: fileType.mimeType()
                    )
                    multipartFormData.append(
                        String(password).data(using: .utf8)!,
                        withName: "password",
                        mimeType: "application/json"
                    )
                },
                to: "\(BASE_URL)/file/decipher"
            )
            .serializingDecodable(RatingData.self)
            .value
        } catch let error as AFError {
            switch error {
            case .sessionTaskFailed(_):
                throw GetRatingError.canNotAccessServer
            default:
                throw GetRatingError.invalidPassword
            }
        } catch {
            throw GetRatingError.invalidPassword
        }
    }
}
