import Foundation

enum CipheredFileType {
    case rpf, zip
    
    static func fromString(_ string: String) -> CipheredFileType? {
        switch (string) {
        case "rpf": return .rpf
        case "zip": return .zip
        default: return nil
        }
    }
    
    func mimeType() -> String {
        switch (self) {
        case .rpf: return "application/octet-stream"
        case .zip: return "application/zip"
        }
    }
}
