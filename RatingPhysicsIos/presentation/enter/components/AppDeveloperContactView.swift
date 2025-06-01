import SwiftUI

private let TELEGRAM_URL = "https://t.me/penakelex"

struct AppDeveloperContactView: View {
    var body: some View {
        Button(action: {
            if let url = URL(string: TELEGRAM_URL) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack {
                Text(String(localized: "contact_app_developer_label"))
                    .font(.system(size: 14))
                    .padding(.trailing, 2)
                Text(String(localized: "app_developer_name_label"))
                    .font(.system(size: 12))
                    .fontWeight(.light)
                
                Spacer()
                
                Image("telegram_icon")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

struct DeveloperContactView_Previews: PreviewProvider {
    static var previews: some View {
        AppDeveloperContactView()
    }
}
