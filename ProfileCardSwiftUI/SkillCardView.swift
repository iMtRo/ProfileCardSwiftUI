import SwiftUI

struct SkillCardView: View {
    
    @EnvironmentObject var infoBool: profileViewModel

    var body: some View {
        ZStack{
           //Background Shape
           Rectangle()
                .clipShape(CustomShape(
                    corner: [.bottomRight,.topLeft,.bottomLeft,.topRight], radii: infoBool.shapechange ? 15 : 35
                ))
                .foregroundColor(Color("darkEnd"))
                .frame(width: infoBool.shapechange ? 300 : 30, height: infoBool.shapechange ? 350 : 30, alignment: .center)
                .offset(x: infoBool.shapechange ? 0 : -123, y: infoBool.shapechange ? 0 : -147)
                .animation(Animation.easeInOut(duration: 1.5).delay(1).repeatCount(1))
                .onAppear { infoBool.shapechange.toggle() }
            
            VStack{
                HStack{
                    //Skill Opacity
                    Text("Skills")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .scaleEffect(infoBool.skillsopac ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                        .onAppear {
                            infoBool.skillsopac.toggle()
                        }
                        Spacer().frame(width: 180, height: 0, alignment: .center)
                }
                    
                Spacer().frame(width: 0, height: 20, alignment: .center)
                    
                //Skills
                HStack{
                    // Android Opacity
                    ZStack{
                        Rectangle()
                            .frame(width: 45, height: 30, alignment: .center)
                            .foregroundColor(.clear)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                            
                        Text("IOS")
                            .foregroundColor(.white)
                    }
                    .scaleEffect(infoBool.androidopac ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                        .onAppear {
                            infoBool.androidopac.toggle()
                        }
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 85, height: 30, alignment: .center)
                            .foregroundColor(.clear)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                        
                            Text("MacOS")
                                .foregroundColor(.white)
                        }
                            .scaleEffect(infoBool.iosopac ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                            .onAppear {
                                infoBool.iosopac.toggle()
                            }
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 75, height: 30, alignment: .center)
                                .foregroundColor(.clear)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                                
                                Text("WatchOS")
                                    .foregroundColor(.white)
                            }
                            .scaleEffect(infoBool.unityopac ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                            .onAppear { infoBool.unityopac.toggle() }
                    }.padding()
                    
                    //SocialMedia
                    HStack{
                        Image("facebook")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .scaleEffect(infoBool.facebooksh ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                            .onAppear { infoBool.facebooksh.toggle() }
                       
                        
                        Image("insta")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .scaleEffect(infoBool.instagramsh ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                            .onAppear { infoBool.instagramsh.toggle() }
                        
                        Image("linked")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                            .scaleEffect(infoBool.linkedinsh ? 1 : 0)
                            .animation(Animation.easeInOut(duration: 1).delay(2).repeatCount(1))
                            .onAppear { infoBool.linkedinsh.toggle() }
                    }
            }
            
        }.onDisappear(){
            infoBool.shapechange = false
            infoBool.skillsopac = false
            infoBool.androidopac = false
            infoBool.iosopac = false
            infoBool.unityopac = false
            infoBool.facebooksh = false
            infoBool.instagramsh = false
            infoBool.linkedinsh = false
        }
    }
}

struct SkillCardView_Previews: PreviewProvider {
    static var previews: some View {
        SkillCardView()
    }
}
