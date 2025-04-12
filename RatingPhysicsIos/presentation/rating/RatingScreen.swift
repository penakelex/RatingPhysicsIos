import Foundation
import SwiftUI

struct RatingScreen : View {
    let useCases: RatingUseCases
    let password: UInt32
    let fileURL: URL
    let type: CipheredFileType
    
    @StateObject private var viewModel = RatingViewModel()
    
    let onBackButtonClick: (UInt32, URL) -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                onBackButtonClick(password, fileURL)
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text(String(localized: "back_button_label"))
                }
            }
            
            switch viewModel.data {
            case .loading:
                LoadingView()
            case .loadded:
                RatingDataView(ratingData: viewModel.ratingData)
            case.noStudentData:
                ZStack(alignment: .center) {
                    Text(String(localized: "student_not_found_label"))
                }
            case.serverInaccessible:
                ZStack(alignment: .center) {
                    Text(String(localized: "server_inaccessible_label"))
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.load(useCases: useCases, password: password, fileURL: fileURL, type: type)
        }
    }
}
