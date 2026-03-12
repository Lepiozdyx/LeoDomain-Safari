import SwiftUI

struct Tab1View: View {
    @State private var selectedTab: ContentTab = .wildlife
    @State private var selectedAnimal: AnimalModelProtocol?
    @State private var selectedPlace: PlaceModelProtocol?
    @State private var showAnimalDetail = false
    @State private var showPlaceDetail = false
    
    enum ContentTab {
        case wildlife
        case places
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("About Africa")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Discover African wildlife and iconic destinations")
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
                
                HStack(spacing: 12) {
                    Button {
                        withAnimation {
                            selectedTab = .wildlife
                        }
                    } label: {
                        Text("Wildlife")
                            .font(.system(size: 16, weight: selectedTab == .wildlife ? .semibold : .medium))
                            .foregroundColor(selectedTab == .wildlife ? .white : .gray)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedTab == .wildlife ? Color(hex: "FF8C42") : Color(hex: "F5F5F5"))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    
                    Button {
                        withAnimation {
                            selectedTab = .places
                        }
                    } label: {
                        Text("Must-Visit Places")
                            .font(.system(size: 16, weight: selectedTab == .places ? .semibold : .medium))
                            .foregroundColor(selectedTab == .places ? .white : .gray)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(selectedTab == .places ? Color(hex: "FF8C42") : Color(hex: "F5F5F5"))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                }
                .padding(.horizontal, 20)
                
                if selectedTab == .wildlife {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Safari Wildlife Guide")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                        
                        Text("Discover animals you may encounter during your African adventure")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ], spacing: 12) {
                            ForEach(AnimalFactory.getAllAnimals(), id: \.id) { animal in
                                AnimalCardView(animal: animal)
                                    .onTapGesture {
                                        selectedAnimal = animal
                                        showAnimalDetail = true
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 8)
                } else {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Iconic African Destinations")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                        
                        Text("Explore the most breathtaking places in Africa")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                        
                        VStack(spacing: 16) {
                            ForEach(PlaceFactory.getAllPlaces(), id: \.id) { place in
                                PlaceDetailCardView(place: place)
                                    .onTapGesture {
                                        selectedPlace = place
                                        showPlaceDetail = true
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.bottom, 100)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $showAnimalDetail) { [selectedAnimal] in
            if let animal = selectedAnimal {
                AnimalDetailView(animal: animal)
            }
        }
        .fullScreenCover(isPresented: $showPlaceDetail) { [selectedPlace] in
            if let place = selectedPlace {
                PlaceDetailView(place: place)
            }
        }
    }
}

struct AnimalCardView: View {
    let animal: AnimalModelProtocol
    var isSE: Bool { UIScreen.isIphoneSEClassic }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(animal.image())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .clipped()
            
            LinearGradient(
                colors: [Color.clear, Color.black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            Text(animal.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(12)
                .padding(.leading, isSE ? 10.fitW : 0)
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 20.fitW, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct PlaceDetailCardView: View {
    let place: PlaceModelProtocol
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(place.image())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack {
                Text(place.placeName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(place.country)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Color(hex: "FF8C42"))
            }
            
            Text(place.descriptionPlace)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineLimit(3)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    Tab1View()
}
