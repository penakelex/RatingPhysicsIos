import SwiftUI

@main
struct RatingPhysicsApp: App {
    private let useCases = RatingUseCases(ratingRepository: RatingRepositoryImplementation())
    
    @State private var screen = Screen.enter(nil)
    var body: some Scene {
        WindowGroup {
            switch screen {
            case .enter(let data):
                EnterScreen(savedData: data) { password, url, type in
                    screen = .rating(password, url, type)
                }
            case .rating(let password, let url, let type):
                RatingScreen(useCases: useCases, password: password, fileURL: url, type: type) { password, url in
                    screen = .enter((password, url))
                }
            }
        }
    }
}

enum Screen {
    case enter((UInt32, URL)?),
         rating(UInt32, URL, CipheredFileType)
}
