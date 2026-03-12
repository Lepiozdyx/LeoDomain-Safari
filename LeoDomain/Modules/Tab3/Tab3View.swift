import SwiftUI

struct Tab3View: View {
    @State private var selectedCategory: SafetyCategory = .wildlife
    
    enum SafetyCategory: String, CaseIterable {
        case wildlife = "Wildlife Safety"
        case travel = "Travel Advice"
        case facts = "Interesting Facts"
        
        var imageName: String {
            switch self {
            case .wildlife: return "safety"
            case .travel: return "advice"
            case .facts: return "facts"
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Safari Tips")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Stay safe and informed on your adventure")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.9))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 60)
                .padding(.bottom, 20)
                .background(
                    LinearGradient(
                        colors: [Color(hex: "FF8C42"), Color(hex: "E63946")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                
                HStack(spacing: 8) {
                    ForEach(SafetyCategory.allCases, id: \.self) { category in
                        Button {
                            withAnimation {
                                selectedCategory = category
                            }
                        } label: {
                            VStack(spacing: 6) {
                                Image(category.imageName)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(selectedCategory == category ? Color(hex: "FF8C42") : .gray)
                                
                                Text(category.rawValue)
                                    .font(.system(size: 12, weight: selectedCategory == category ? .semibold : .regular))
                                    .foregroundColor(selectedCategory == category ? Color(hex: "FF8C42") : .gray)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedCategory == category ? Color(hex: "FFF3E0") : Color(hex: "F5F5F5"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Group {
                    switch selectedCategory {
                    case .wildlife:
                        WildlifeSafetyView()
                    case .travel:
                        TravelAdviceView()
                    case .facts:
                        InterestingFactsView()
                    }
                }
            }
            .padding(.bottom, 100)
        }
        .background(Color(hex: "F5F5F5"))
        .edgesIgnoringSafeArea(.top)
    }
}

struct WildlifeSafetyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "E63946"))
                
                Text("Dangerous Encounters")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                SafetyTipCard(
                    title: "Lion Encounter",
                    situation: "You come upon a lion on foot or it approaches your vehicle",
                    whatToDo: "Stay calm and still. Maintain eye contact. If you need to move, stay inside your vehicle. If on foot with a guide, follow instructions (with guide). Make yourself appear larger. Speak firmly but calmly.",
                    whatNotToDo: "DO NOT run. DO NOT turn your back. DO NOT bend down. DO NOT make sudden movements. DO NOT approach cubs. DO NOT exit vehicle."
                )
                
                SafetyTipCard(
                    title: "Elephant Charge",
                    situation: "An elephant shows signs of aggression - ears spread, trumpeting, mock charges",
                    whatToDo: "Back away slowly and calmly. Give the elephant space. If charging, stand behind your vehicle or a large tree trunk/barrier (safari). If it continues, move behind a tree or vehicle. Follow your guide's instructions.",
                    whatNotToDo: "DO NOT run away (they can run 40 km/h). DO NOT wave arms around. DO NOT make loud noises. DO NOT approach closer than 50 meters. DO NOT get between mother and calf."
                )
                
                SafetyTipCard(
                    title: "Snake Bite",
                    situation: "Someone is bitten by a snake",
                    whatToDo: "Keep the person calm and still to slow venom spread. Identify snake if possible (photo/description) for medical appearance for identification. Get to medical help IMMEDIATELY. Remove jewelry/tight clothing. Clean and bandage. Splint bitten limb below heart level.",
                    whatNotToDo: "DO NOT try to catch or kill the snake. DO NOT cut the wound. DO NOT apply ice. DO NOT apply a tourniquet. DO NOT suck out venom. DO NOT give alcohol or caffeine. DO NOT elevate bite."
                )
                
                SafetyTipCard(
                    title: "Crocodile Encounter",
                    situation: "Crocodile spotted near you or in water you must cross",
                    whatToDo: "Move away from water's edge immediately (at least 5 meters back). If in water and attacked, fight back - target eyes and nostrils (most sensitive snout). Make noise to attract help. Only cross extremely designated safe crossings with guide supervision.",
                    whatNotToDo: "DO NOT swim in rivers or lakes. DO NOT approach water edge. DO NOT feed crocodiles. DO NOT assume shallow water is safe. DO NOT swim at dawn/dusk or night. DO NOT dangle feet/hands in water."
                )
                
                SafetyTipCard(
                    title: "Scorpion Sting",
                    situation: "Someone is stung by a scorpion",
                    whatToDo: "Wash the area with soap and water. Apply cool compress to reduce swelling. Take pain relief if needed. Seek medical attention, especially if symptoms worsen. Keep the affected limb elevated if possible for identification.",
                    whatNotToDo: "DO NOT panic (most stings are not life-threatening). DO NOT cut the sting area. DO NOT apply ice. DO NOT delay seeking medical care if symptoms worsen or person has known allergies."
                )
            }
            .padding(.horizontal, 20)
        }
    }
}

struct TravelAdviceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "FF8C42"))
                
                Text("Travel Advice")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                AdviceCard(
                    title: "Best Time for Safari",
                    content: "Dry season (June-October) offers the best wildlife viewing as animals gather around water sources and vegetation is sparse. However, green season (November-May) brings baby animals, fewer tourists, and lush landscapes. Choose based on your priorities."
                )
                
                AdviceCard(
                    title: "Behaving Near Wild Animals",
                    content: "Always stay quiet and calm. Keep voices low and avoid sudden movements. Never feed animals - it's dangerous and disrupts natural behaviors. Respect their space - use binoculars and zoom lenses instead of getting closer. Listen to your guide's instructions."
                )
                
                AdviceCard(
                    title: "Why Morning Safaris Are Better",
                    content: "Animals are most active during cool early mornings (5-9 AM). Predators often hunt at dawn. Better lighting for photography with soft golden light. Cooler temperatures make animals more visible and active. Less midday heat for both wildlife and visitors."
                )
                
                AdviceCard(
                    title: "Staying Hydrated in Hot Climates",
                    content: "Drink at least 3-4 liters of water daily. Start hydrating the day before your safari. Carry a reusable water bottle. Add electrolyte supplements for long game drives. Limit alcohol and caffeine. Recognize dehydration signs: headache, dizziness, dry mouth."
                )
                
                AdviceCard(
                    title: "Why Binoculars Are Essential",
                    content: "Allows safe wildlife observation from proper distances. Helps spot animals in dense vegetation or far across plains. Enhances bird watching opportunities. Provides better experience than phone camera zoom alone. Recommended: 8×42 or 10×42 for safari use."
                )
                
                AdviceCard(
                    title: "Safari Clothing Tips",
                    content: "Wear neutral colors (khaki, tan, olive) to blend in - avoid bright colors and white. Choose lightweight, breathable fabrics. Long sleeves and pants protect from sun and insects. Layer for cool mornings and warm afternoons. Bring a hat and sunglasses."
                )
            }
            .padding(.horizontal, 20)
        }
    }
}

struct InterestingFactsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: "FFD93D"))
                
                Text("Interesting Facts")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                FactCard(
                    title: "Serengeti Migration",
                    content: "The Great Migration is a natural phenomenon where over 1.5 million wildebeest and 250,000 zebras move across the Serengeti plains in search of fresh grazing and water."
                )
                
                FactCard(
                    title: "Kruger National Park",
                    content: "Kruger National Park is one of the world's oldest protected areas, established in 1898. It covers nearly 20,000 square kilometers and is home to over 12,000 elephants."
                )
                
                FactCard(
                    title: "Victoria Falls",
                    content: "Victoria Falls is the largest curtain of falling water in the world, with a width of 1,708 meters and a height of 108 meters. It's known locally as 'Mosi-oa-Tunya' - The Smoke That Thunders."
                )
                
                FactCard(
                    title: "Mount Kilimanjaro",
                    content: "Mount Kilimanjaro is Africa's highest peak and the world's tallest free-standing mountain. It has three volcanic cones: Kibo, Mawenzi, and Shira, with glaciers rapidly disappearing due to climate change."
                )
                
                FactCard(
                    title: "Sahara Desert",
                    content: "The Sahara Desert is the world's largest hot desert, covering 9 million square kilometers across 11 countries. It's known for its endless golden dunes and ancient caravan routes."
                )
                
                FactCard(
                    title: "Okavango Delta",
                    content: "The Okavango Delta is a unique inland delta and water wonderland in Botswana. It floods during the dry season, creating a pristine waterway ecosystem with over 200,000 large mammals."
                )
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SafetyTipCard: View {
    let title: String
    let situation: String
    let whatToDo: String
    let whatNotToDo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(hex: "E63946"))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Situation:")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                
                Text(situation)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineSpacing(4)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "4CAF50"))
                    
                    Text("What to Do:")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "4CAF50"))
                }
                
                Text(whatToDo)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineSpacing(4)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "E63946"))
                    
                    Text("What NOT to Do:")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "E63946"))
                }
                
                Text(whatNotToDo)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineSpacing(4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "FFE5E5"), lineWidth: 2)
        )
    }
}

struct AdviceCard: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text(content)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "FF8C42").opacity(0.3), lineWidth: 2)
        )
    }
}

struct FactCard: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text(content)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "FFD93D").opacity(0.3), lineWidth: 2)
        )
    }
}

#Preview {
    Tab3View()
}
