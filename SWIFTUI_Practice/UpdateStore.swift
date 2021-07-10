import SwiftUI
import Combine

class UpdateStore : ObservableObject
{
    @Published var updates : [Update] = updateData
    

}
