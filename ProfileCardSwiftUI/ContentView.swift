


// Maxmudov Ilyos

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top){
            FinalView()
            
            Text("\t\tIlyos \n Maxmudov")
                .foregroundColor(.white)
                .fontWeight(.black)
                .font(.system(size: 35))
                .padding(.top, 70)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Color Extension
extension Color{
    static let darkStart = Color("darkStart")
    static let darkEnd = Color("darkEnd")
}

struct FinalView: View {
    var body: some View {
        ZStack{
            BaseCard()
            SideButton()
        }
        
    }
}


struct BaseCard: View {
    
    @EnvironmentObject var infoBool: profileViewModel
    
    var body: some View {
        ZStack{
            Color("darkStart").opacity(1).edgesIgnoringSafeArea(.all)
            
            
            RoundedRectangle(cornerRadius: 35)
                .foregroundColor(.darkStart)
                .frame(width: 300, height: 350, alignment: .center)
                .shadow(color: Color.white.opacity(0.3), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.3), radius: 10, x: -5, y: -5)
            
            
            
            VStack{
                Image("mainwizard")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .scaleEffect(infoBool.profileImage ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1.2).delay(1).repeatCount(1))
                    .onAppear {
                        infoBool.profileImage.toggle()
                    }
                
                Text("Ilyos Maxmudov")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .scaleEffect(infoBool.UserName ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1.8).delay(1).repeatCount(1))
                    .onAppear {
                        infoBool.UserName.toggle()
                    }
                
                Text("IOS Developer")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .scaleEffect(infoBool.UserJob ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1).delay(1).repeatCount(1))
                    .onAppear {
                        infoBool.UserJob.toggle()
                    }
            }
        }
    }
}

struct SideButton: View {
    
    @EnvironmentObject var infoBool: profileViewModel
    
    var body: some View {
        ZStack{
            Button(action: {
                infoBool.buttonToggle = true
                infoBool.profileImage = false
                infoBool.UserName = false
                infoBool.UserJob = false
            }){
                ZStack{
                    Rectangle()
                        .clipShape(CustomShape(
                            corner: [.bottomRight,.topLeft], radii: 35
                        ))
                        .frame(width: 65, height: 65, alignment: .center)
                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 5, y: 5)
                        .foregroundColor(.white)
                        .shadow(radius: 7)
                    
                    ZStack{
                        Image(systemName: "arrow.right")
                            .resizable()
                            .foregroundColor(Color("darkStart"))
                            .frame(width: 35, height: 20, alignment: .center)
                            .rotationEffect(.degrees(40))
                    }
                }
            }
            
            Rectangle()
                .clipShape(CustomShape(
                    corner: [.bottomRight,.topLeft], radii: 35
                ))
                .frame(width: 70, height: 70, alignment: .center)
                .offset(x: -237, y: -287)
                .foregroundColor(Color("darkEnd"))
        }.offset(x: 123, y: 147)
        
        if infoBool.buttonToggle{
            SkillCardView()
            
            ZStack{
                Rectangle()
                    .clipShape(CustomShape(
                        corner: [.bottomRight,.topLeft], radii: 35
                    ))
                    .frame(width: 65, height: 65, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(radius: 7)
                
                ZStack{
                    Image(systemName: "arrow.right")
                        .resizable()
                        .foregroundColor(Color("darkStart"))
                        .frame(width: 35, height: 20, alignment: .center)
                        .rotationEffect(.degrees(infoBool.arrowanim ? 220 : 40))
                        .animation(Animation.easeInOut(duration: 1.5).delay(1).repeatCount(1))
                        .onAppear {
                            infoBool.arrowanim.toggle()
                        }
                    }
            }.offset(x: 123, y: 147)
                .onTapGesture {
                    infoBool.buttonToggle = false
                    infoBool.arrowanim = false
                    infoBool.profileImage = true
                    infoBool.UserName = true
                    infoBool.UserJob = true
                }
        }
    
    }
}


