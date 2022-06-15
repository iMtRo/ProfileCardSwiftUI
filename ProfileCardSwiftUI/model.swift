import Foundation

class profileViewModel: ObservableObject {
    
    @Published var profileImage: Bool = false
    @Published var UserName: Bool = false
    @Published var UserJob: Bool = false
    
    @Published var buttonToggle = false
    @Published var arrowanim = false
    
    
    @Published var shapechange = false
    @Published var skillsopac = false
    @Published var androidopac = false
    @Published var iosopac = false
    @Published var unityopac = false
    @Published var facebooksh = false
    @Published var instagramsh = false
    @Published var linkedinsh = false
    
}
