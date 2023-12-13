

import Foundation
import SwiftData

@Model
class Nota: Identifiable
{
    var id : String
    var name : String
    
    init ( name: String )
    {
        self.name=name
        self.id = UUID().uuidString
    }
}
