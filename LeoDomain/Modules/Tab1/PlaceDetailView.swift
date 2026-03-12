import SwiftUI

struct PlaceDetailView: View {
    @Environment(\.dismiss) var dismiss
    let place: PlaceModelProtocol
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image(place.image())
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
                            HStack(spacing: 6) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "FFD93D"))
                                
                                Text(place.country)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color(hex: "FFD93D"))
                            }
                            
                            Text(place.placeName)
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 24)
                    }
                }
                .frame(height: 300)
                
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(place.descriptionPlace)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    PlaceInfoSection(
                        icon: "calendar",
                        title: "Best Time to Visit",
                        content: place.bestTime,
                        iconColor: Color(hex: "FF8C42")
                    )
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "lightbulb.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(hex: "FFD93D"))
                            
                            Text("Interesting Facts")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(place.interestingFacts.components(separatedBy: "\n"), id: \.self) { fact in
                                if !fact.isEmpty {
                                    HStack(alignment: .top, spacing: 8) {
                                        Circle()
                                            .fill(Color(hex: "FF8C42"))
                                            .frame(width: 6, height: 6)
                                            .padding(.top, 6)
                                        
                                        Text(fact.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "•", with: "").trimmingCharacters(in: .whitespaces))
                                            .font(.system(size: 15))
                                            .foregroundColor(.gray)
                                            .lineSpacing(4)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(20)
            }
        }
        .background(Color(hex: "F5F5F5"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct PlaceInfoSection: View {
    let icon: String
    let title: String
    let content: String
    let iconColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(iconColor)
                
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
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
    PlaceDetailView(place: SerengetiNationalPark())
}
