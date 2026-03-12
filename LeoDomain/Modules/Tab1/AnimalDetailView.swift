import SwiftUI

struct AnimalDetailView: View {
    @Environment(\.dismiss) var dismiss
    let animal: AnimalModelProtocol
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image(animal.image())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    LinearGradient(
                        colors: [Color.clear, Color.black.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                    VStack(alignment: .leading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.top, 50)
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(animal.name)
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(animal.animalDescription)
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.95))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 24)
                    }
                }
                .frame(height: 300)
                
                VStack(spacing: 16) {
                    InfoSection(
                        icon: "info.circle.fill",
                        title: "About",
                        content: animal.about,
                        iconColor: Color(hex: "FF8C42")
                    )
                    
                    InfoSection(
                        icon: "mappin.circle.fill",
                        title: "Where You Can See It",
                        content: animal.whereCanYouSeeIt,
                        iconColor: Color(hex: "FF8C42")
                    )
                    
                    InfoSection(
                        icon: "shield.fill",
                        title: "Safety Tips",
                        content: animal.safetyTips,
                        iconColor: Color(hex: "E63946"),
                        titleColor: Color(hex: "E63946")
                    )
                }
                .padding(20)
            }
        }
        .background(Color(hex: "F5F5F5"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct InfoSection: View {
    let icon: String
    let title: String
    let content: String
    let iconColor: Color
    var titleColor: Color?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(iconColor)
                
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(titleColor ?? .black)
            }
            
            Text(content)
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    AnimalDetailView(animal: Lion())
}
