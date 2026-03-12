import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case 0:
                    Tab1View()
                case 1:
                    Tab2View()
                case 2:
                    Tab3View()
                default:
                    MockView()
                }
            }
            
            HStack(spacing: 0) {
                TabBarButton(
                    icon: "tab1",
                    title: "About Africa",
                    isSelected: selectedTab == 0
                ) {
                    selectedTab = 0
                }
                
                TabBarButton(
                    icon: "tab2",
                    title: "Travel Planner",
                    isSelected: selectedTab == 1
                ) {
                    selectedTab = 1
                }
                
                TabBarButton(
                    icon: "tab3",
                    title: "Safari Tips",
                    isSelected: selectedTab == 2
                ) {
                    selectedTab = 2
                }
            }
            .frame(height: 90.fitH)
            .padding([.bottom, .horizontal])
            .background(
                LinearGradient(
                    colors: [Color(hex: "E63946"), Color(hex: "FF8C42")],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.system(size: 13, weight: isSelected ? .semibold : .medium))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                isSelected ? Color.white.opacity(0.25) : Color.clear
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, isSelected ? 8 : 4)
        }
    }
}

struct MockView: View {
    var body: some View {
        ZStack {
            Color.white
            
            Text("Mock View")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.gray)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    TabBarView()
}
