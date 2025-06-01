
import Foundation
import SwiftUI

struct TableDeveloperView : View {
    var body: some View {
        HStack(alignment: .center) {
            Text(String(localized: "table_developer_label"))
                .font(.system(size: 14))
                .padding(.trailing, 2)
            Text(String(localized: "table_developer_name_label"))
                .font(.system(size: 12))
                .fontWeight(.light)
        }
    }
}

struct TableDeveloperView_Previews : PreviewProvider {
    static var previews: some View {
        TableDeveloperView()
    }
}
