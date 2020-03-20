import SwiftUI

struct ContentView: View {

    let size: CGFloat = 80

    @State var isExpanded = false

    var body: some View {
        ZStack {
            ForEach(0..<6) { i in
                Circle()
                    .fill(self.color(at: i))
                    .opacity(0.9)
                    .blendMode(.screen)
                    .frame(width: self.size, height: self.size)
                    .scaleEffect(self.isExpanded ? 1.0 : 0.25)
                    .offset(x: 0, y: self.isExpanded ? -self.size/2 : 2)
                    .rotationEffect(
                        Angle(degrees: Double(i)/6.0 * 360) +
                        Angle(degrees: self.isExpanded ? 90 : 0)
                    )
            }
        }
        .onAppear {
            let animation = Animation.easeInOut(duration: 4.0)
            withAnimation(animation.repeatForever()) {
                self.isExpanded.toggle()
            }
        }

    }

    private func color(at index: Int) -> Color {
        if index < 3 {
            return Color.green1
        } else {
            return Color.green2
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}















extension Color {
    static let green1 = Color(red: 0.38, green: 0.75, blue: 0.64)
    static let green2 = Color(red: 0.32, green: 0.61, blue: 0.63)
}
