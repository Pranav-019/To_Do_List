import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title) // Use title property here
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle) // Use subtitle property here
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 1.5, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Sub Title",
                   angle: 15,
                   background: .brown)
    }
}
