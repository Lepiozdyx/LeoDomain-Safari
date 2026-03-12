import Foundation

protocol PlaceModelProtocol {
    var id: UUID { get }
    var country: String { get }
    var placeName: String { get }
    var descriptionPlace: String { get }
    var bestTime: String { get }
    var interestingFacts: String { get }
    
    func image() -> String
}

extension PlaceModelProtocol {
    func image() -> String {
        return self.placeName
    }
}

struct SerengetiNationalPark: PlaceModelProtocol {
    let id = UUID()
    let country = "Tanzania"
    let placeName = "Serengeti National Park"
    let descriptionPlace = "Witness the greatest wildlife spectacle on Earth - the Great Migration. Endless plains teeming with wildlife."
    let bestTime = "June to October for the migration river crossings. December to March for calving season."
    let interestingFacts = """
    • Home to over 1.5 million wildebeest and 250,000 zebras during the migration
    • The name 'Serengeti' comes from the Maasai word 'siringet', meaning 'endless plains'
    • Over 500 bird species recorded
    • Contains the highest concentration of lions in Africa
    """
}

struct KrugerNationalPark: PlaceModelProtocol {
    let id = UUID()
    let country = "South Africa"
    let placeName = "Kruger National Park"
    let descriptionPlace = "One of Africa's largest game reserves with exceptional Big Five viewing and excellent infrastructure."
    let bestTime = "May to September (dry season) for best wildlife viewing. Animals congregate around water sources."
    let interestingFacts = """
    • Size of Wales - nearly 20,000 square kilometers
    • Over 12,000 elephants roam the park
    • 147 mammal species including the Big Five
    • One of the world's oldest protected areas, established in 1898
    """
}

struct VictoriaFalls: PlaceModelProtocol {
    let id = UUID()
    let country = "Zambia / Zimbabwe"
    let placeName = "Victoria Falls"
    let descriptionPlace = "The largest curtain of falling water in the world. Known locally as 'Mosi-oa-Tunya' - The Smoke That Thunders."
    let bestTime = "February to May for maximum water flow. September to December for lower water levels and activities like Devil's Pool."
    let interestingFacts = """
    • Twice the height of Niagara Falls
    • 1,708 meters wide and 108 meters high
    • Spray can be seen from 30 kilometers away
    • UNESCO World Heritage Site since 1989
    """
}

struct MountKilimanjaro: PlaceModelProtocol {
    let id = UUID()
    let country = "Tanzania"
    let placeName = "Mount Kilimanjaro"
    let descriptionPlace = "Africa's highest peak and the world's tallest free-standing mountain. A bucket-list climb with stunning glaciers."
    let bestTime = "January to March and June to October for best climbing conditions. Avoid April-May rainy season."
    let interestingFacts = """
    • 5,895 meters (19,341 feet) at Uhuru Peak
    • Three volcanic cones: Kibo, Mawenzi, and Shira
    • Glaciers are rapidly disappearing due to climate change
    • Over 35,000 people attempt to summit each year
    """
}

struct SaharaDesert: PlaceModelProtocol {
    let id = UUID()
    let country = "North Africa"
    let placeName = "Sahara Desert"
    let descriptionPlace = "The world's largest hot desert. Endless golden dunes and ancient caravan routes under starlit skies."
    let bestTime = "October to April when temperatures are more moderate. Summer can exceed 50°C (122°F)."
    let interestingFacts = """
    • Covers 9 million square kilometers across 11 countries
    • Only about 25% is sand dunes - most is gravel plains
    • Home to ancient rock art dating back thousands of years
    • Can experience temperatures from -10°C to 50°C
    """
}

struct OkavangoDelta: PlaceModelProtocol {
    let id = UUID()
    let country = "Botswana"
    let placeName = "Okavango Delta"
    let descriptionPlace = "A unique inland delta and water wonderland. Explore pristine waterways by mokoro (traditional canoe)."
    let bestTime = "May to October (dry season) when water levels are high and wildlife concentrates around channels."
    let interestingFacts = """
    • The world's largest inland delta
    • Floods during dry season (counterintuitive!)
    • 15,000 square kilometers of pristine wilderness
    • Over 200,000 large mammals including rare species
    """
}

class PlaceFactory {
    static func getAllPlaces() -> [PlaceModelProtocol] {
        return [
            SerengetiNationalPark(),
            KrugerNationalPark(),
            VictoriaFalls(),
            MountKilimanjaro(),
            SaharaDesert(),
            OkavangoDelta()
        ]
    }
    
    static func getPlace(byName name: String) -> PlaceModelProtocol? {
        return getAllPlaces().first { $0.placeName == name }
    }
    
    static func getRandomPlace() -> PlaceModelProtocol {
        return getAllPlaces().randomElement()!
    }
}
