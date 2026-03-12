import Foundation

protocol AnimalModelProtocol {
    var id: UUID { get }
    var name: String { get }
    var animalDescription: String { get }
    var about: String { get }
    var whereCanYouSeeIt: String { get }
    var safetyTips: String { get }
    
    func image() -> String
}

extension AnimalModelProtocol {
    func image() -> String {
        return self.name
    }
}

struct Lion: AnimalModelProtocol {
    let id = UUID()
    let name = "Lion"
    let animalDescription = "The king of the savanna, known for their majestic manes and social pride structure."
    let about = "Lions are the second-largest living cat species, after tigers. They are social animals living in groups called prides, typically consisting of related females, their cubs, and a small number of adult males. Male lions are distinctive for their thick manes, which signal health and vitality to potential mates."
    let whereCanYouSeeIt = "Best seen in Serengeti National Park (Tanzania), Kruger National Park (South Africa), and Masai Mara (Kenya). Lions are most active during dawn and dusk."
    let safetyTips = "Stay inside vehicle at all times. Never approach a lion on foot. Avoid loud noises or sudden movements. If a lion approaches your vehicle, remain calm and quiet. Never run from a lion."
}

struct Elephant: AnimalModelProtocol {
    let id = UUID()
    let name = "Elephant"
    let animalDescription = "Earth's largest land mammal, highly intelligent and deeply social."
    let about = "African elephants are remarkable for their intelligence, strong family bonds, and complex social structures. They communicate through vocalizations, body language, and infrasound. Elephants are keystone species that shape their ecosystems by creating water holes and clearings."
    let whereCanYouSeeIt = "Chobe National Park (Botswana), Amboseli National Park (Kenya), and Etosha National Park (Namibia) offer excellent elephant viewing opportunities."
    let safetyTips = "Keep a safe distance of at least 50 meters. Avoid loud noises or sudden movements. Never position yourself between a mother and calf. If an elephant flaps its ears and trumpets, it's showing aggression - slowly back away."
}

struct Giraffe: AnimalModelProtocol {
    let id = UUID()
    let name = "Giraffe"
    let animalDescription = "The world's tallest mammal with a distinctive long neck and spotted coat."
    let about = "Giraffes can grow up to 18 feet tall and have a unique cardiovascular system to pump blood to their brain. Their long necks allow them to browse leaves from tall acacia trees. Each giraffe has a unique spot pattern, like human fingerprints."
    let whereCanYouSeeIt = "Common in Serengeti, Kruger, and Samburu National Reserve (Kenya). Often seen browsing on acacia trees in open savanna."
    let safetyTips = "Generally peaceful animals, but keep a respectful distance. Their kicks can be deadly if threatened. Never approach a mother with a calf. Observe from vehicles."
}

struct Zebra: AnimalModelProtocol {
    let id = UUID()
    let name = "Zebra"
    let animalDescription = "Distinctive black and white striped horses of the African plains."
    let about = "Each zebra has a unique stripe pattern. These stripes may help with temperature regulation, confuse predators, and serve as individual identification within herds. Zebras are social animals that live in family groups led by a stallion."
    let whereCanYouSeeIt = "Abundant in Serengeti, Masai Mara, and Etosha. Often seen in large herds during the Great Migration."
    let safetyTips = "Can be unpredictable and may bite or kick if threatened. Keep distance and stay in vehicle. Males can be territorial during breeding season."
}

struct Rhinoceros: AnimalModelProtocol {
    let id = UUID()
    let name = "Rhinoceros"
    let animalDescription = "Ancient armored giants, critically endangered and fiercely protected."
    let about = "Both black and white rhinos are found in Africa. Despite their names, both are gray - the 'white' name comes from the Afrikaans word 'wijd' (wide), referring to their mouth shape. Rhinos have poor eyesight but excellent hearing and smell."
    let whereCanYouSeeIt = "Best viewing in Hluhluwe-iMfolozi Park (South Africa), Lake Nakuru (Kenya), and private conservancies. Sightings require patience as populations are small."
    let safetyTips = "Extremely dangerous when threatened. Can charge at speeds up to 30 mph. Keep maximum distance. Never leave vehicle. If on foot with a guide, follow instructions immediately."
}

struct Leopard: AnimalModelProtocol {
    let id = UUID()
    let name = "Leopard"
    let animalDescription = "Elusive spotted cats known for their strength and tree-climbing abilities."
    let about = "Leopards are solitary, nocturnal hunters with incredible strength - they can drag prey twice their weight up into trees. They are the most widespread of the big cats and highly adaptable to various habitats."
    let whereCanYouSeeIt = "Difficult to spot due to their elusive nature. South Luangwa (Zambia), Sabi Sands (South Africa), and Masai Mara offer good chances. Look in trees during daytime."
    let safetyTips = "Rarely seen but potentially dangerous. Never approach on foot. If you encounter one, back away slowly while facing it. Do not run. Stay in vehicle during safaris."
}

struct Cheetah: AnimalModelProtocol {
    let id = UUID()
    let name = "Cheetah"
    let animalDescription = "The fastest land animal, built for incredible speed."
    let about = "Cheetahs can reach speeds of 70 mph in short bursts. Unlike other big cats, they cannot roar but make chirping sounds. Their distinctive black 'tear marks' help reduce sun glare while hunting. They hunt during daytime to avoid competition with other predators."
    let whereCanYouSeeIt = "Serengeti plains, Masai Mara, and Kgalagadi Transfrontier Park. Look for them on open plains and termite mounds which they use as lookout points."
    let safetyTips = "Less aggressive than other big cats but still wild predators. Keep distance. They are more timid and will usually avoid humans. Never corner or chase. Stay in vehicle."
}

struct Hyena: AnimalModelProtocol {
    let id = UUID()
    let name = "Hyena"
    let animalDescription = "Intelligent scavengers and skilled hunters with powerful jaws."
    let about = "Contrary to popular belief, spotted hyenas are successful hunters, not just scavengers. They live in female-dominated clans with complex social structures. Their bone-crushing jaws can exert immense pressure."
    let whereCanYouSeeIt = "Common in most East African parks, especially Serengeti, Kruger, and Ngorongoro Crater. Often heard at night with their distinctive laughing calls."
    let safetyTips = "Can be dangerous, especially in groups. Keep windows closed at night in camps. Never feed them. They can bite through bones and are not afraid of humans."
}

struct Crocodile: AnimalModelProtocol {
    let id = UUID()
    let name = "Crocodile"
    let animalDescription = "Ancient reptilian predators that rule African waterways."
    let about = "Nile crocodiles can grow over 16 feet long and live for decades. They are ambush predators with the strongest bite force of any animal. They can remain motionless for hours waiting for prey."
    let whereCanYouSeeIt = "Chobe River (Botswana), Mara River (Kenya/Tanzania), and Lake Kariba (Zimbabwe). Often seen basking on riverbanks."
    let safetyTips = "NEVER stand close to water edges. Keep at least 5 meters from the waterline. Never swim in rivers or lakes. Crocodiles can launch from water at incredible speed. Extremely dangerous."
}

struct AfricanBuffalo: AnimalModelProtocol {
    let id = UUID()
    let name = "African Buffalo"
    let animalDescription = "Formidable herd animals, one of Africa's most dangerous."
    let about = "Cape buffalo are part of the 'Big Five' and known for their unpredictable nature. They live in large herds and have excellent memories. Old bulls can be particularly dangerous when solitary."
    let whereCanYouSeeIt = "Common in most major parks including Kruger, Serengeti, and Chobe. Often seen near water sources in large herds."
    let safetyTips = "One of Africa's most dangerous animals. Never approach on foot. Wounded or solitary bulls are extremely aggressive. Keep distance and stay in vehicle. They can attack without warning."
}

struct Hippopotamus: AnimalModelProtocol {
    let id = UUID()
    let name = "Hippopotamus"
    let animalDescription = "Deceptively dangerous semi-aquatic giants."
    let about = "Despite their docile appearance, hippos are considered one of Africa's most dangerous animals, causing more human fatalities than most other large animals. They spend days in water to keep cool and graze on land at night."
    let whereCanYouSeeIt = "Okavango Delta (Botswana), Chobe River, and St Lucia (South Africa). Best viewed from boats or observation points."
    let safetyTips = "Extremely territorial and aggressive. Never get between a hippo and water. Can run faster than humans on land. Keep distance from rivers at night when they graze. Very dangerous."
}

struct Warthog: AnimalModelProtocol {
    let id = UUID()
    let name = "Warthog"
    let animalDescription = "Comical-looking wild pigs with distinctive tusks and facial warts."
    let about = "Warthogs are named for the facial warts that males develop. They live in family groups and are surprisingly fast runners. They often use abandoned aardvark burrows for shelter and enter them backwards so they can defend against predators."
    let whereCanYouSeeIt = "Very common throughout sub-Saharan Africa. Found in all major safari parks including Serengeti, Kruger, and Chobe."
    let safetyTips = "Generally harmless and will run away from humans. Males can be aggressive during mating season. Keep respectful distance, especially from mothers with young."
}

struct Jackal: AnimalModelProtocol {
    let id = UUID()
    let name = "Jackal"
    let animalDescription = "Cunning opportunistic scavengers and hunters."
    let about = "Black-backed and side-striped jackals are found in Africa. They are monogamous and mate for life. Jackals are adaptable omnivores eating everything from insects to small antelopes. They often follow larger predators to scavenge."
    let whereCanYouSeeIt = "Common in Serengeti, Ngorongoro Crater, and Etosha National Park. Often seen at dawn and dusk."
    let safetyTips = "Generally shy and avoid humans. Can carry rabies, so never approach or feed them. Keep food secured in camps."
}

struct Baboon: AnimalModelProtocol {
    let id = UUID()
    let name = "Baboon"
    let animalDescription = "Highly intelligent and social primates living in large troops."
    let about = "Baboons live in complex hierarchical troops of up to 200 individuals. They are highly intelligent and adaptable, with intricate social behaviors. Dominant males have distinctive manes and large canine teeth."
    let whereCanYouSeeIt = "Very common throughout Africa. Found in Kruger, Chobe, and near human settlements. Often seen along roadsides."
    let safetyTips = "Can be aggressive, especially males. NEVER feed them - they become dangerous and dependent. Secure all food and close windows in camps. Keep distance and avoid eye contact with dominant males."
}

struct Meerkat: AnimalModelProtocol {
    let id = UUID()
    let name = "Meerkat"
    let animalDescription = "Small, charismatic members of the mongoose family famous for their upright posture."
    let about = "Meerkats live in underground burrow systems in groups called 'mobs'. They take turns standing guard on their hind legs while others forage. They are immune to some venoms and eat scorpions and snakes."
    let whereCanYouSeeIt = "Kalahari Desert areas, especially Makgadikgadi Pans (Botswana) and specialized meerkat experiences in South Africa."
    let safetyTips = "Small and generally harmless but can bite if cornered or handled. Wild meerkats should not be approached or touched. Observe from a distance."
}

struct Ostrich: AnimalModelProtocol {
    let id = UUID()
    let name = "Ostrich"
    let animalDescription = "The world's largest and fastest-running bird."
    let about = "Ostriches can run up to 45 mph and have the largest eyes of any land animal. Males perform elaborate courtship dances. Despite the myth, they don't bury their heads in sand - they lower their heads to check on eggs in their ground nests."
    let whereCanYouSeeIt = "Common in open savanna areas throughout East and Southern Africa. Often seen in Etosha, Kruger, and Serengeti."
    let safetyTips = "Can be dangerous - their kicks are powerful enough to kill a lion. Keep distance, especially from nesting birds. Stay in vehicle if they show aggression."
}

struct Flamingo: AnimalModelProtocol {
    let id = UUID()
    let name = "Flamingo"
    let animalDescription = "Stunning pink wading birds that gather in massive flocks."
    let about = "Flamingos get their pink color from carotenoids in their diet of algae and small crustaceans. They can number in the millions at alkaline lakes. They filter-feed with their unique curved beaks held upside down in water."
    let whereCanYouSeeIt = "Lake Nakuru and Lake Bogoria (Kenya), Lake Natron (Tanzania). Spectacular mass gatherings create pink landscapes."
    let safetyTips = "Harmless to humans. Keep respectful distance to avoid disturbing large flocks. The alkaline lakes they inhabit can be caustic to skin."
}

struct Serval: AnimalModelProtocol {
    let id = UUID()
    let name = "Serval"
    let animalDescription = "Elegant medium-sized wild cat with distinctive large ears and spotted coat."
    let about = "Servals have the longest legs relative to body size of any cat, and the largest ears. They have a 50% hunting success rate, making powerful leaps to catch birds and rodents. They are mostly nocturnal and solitary."
    let whereCanYouSeeIt = "Difficult to spot. Best chances in Ngorongoro Crater, Serengeti, and wetland areas. Active at dawn and dusk."
    let safetyTips = "Shy and avoid humans. Wild predators that should not be approached. Rarely dangerous but can defend themselves if cornered."
}

struct Caracal: AnimalModelProtocol {
    let id = UUID()
    let name = "Caracal"
    let animalDescription = "Striking medium-sized wild cat with distinctive black-tufted ears."
    let about = "Caracals are known for their incredible agility and can leap 10 feet high to catch birds in mid-flight. The name comes from the Turkish word 'karakulak' meaning black ear. They are solitary and mostly nocturnal."
    let whereCanYouSeeIt = "Very elusive and rare to spot. Found in Kgalagadi, Kruger, and dry savanna areas. Mostly nocturnal."
    let safetyTips = "Extremely shy and avoid humans. Rarely seen and not considered dangerous to people. Observe from distance if spotted."
}

struct HoneyBadger: AnimalModelProtocol {
    let id = UUID()
    let name = "Honey Badger"
    let animalDescription = "Fearless and tenacious small carnivores known for their aggressive nature."
    let about = "Honey badgers have earned a reputation as one of the most fearless animals. They have thick loose skin that protects against bee stings and predator attacks. They are omnivores and incredibly strong for their size, often taking on animals much larger."
    let whereCanYouSeeIt = "Rare to spot due to low population density. Found across Africa but most commonly in Kruger, Kgalagadi, and Okavango."
    let safetyTips = "Extremely aggressive when threatened. Can attack animals much larger including lions. Give wide berth. Never approach or corner one."
}

struct Pangolin: AnimalModelProtocol {
    let id = UUID()
    let name = "Pangolin"
    let animalDescription = "The world's most trafficked mammal, covered in protective scales."
    let about = "Pangolins are the only mammals wholly covered in scales made of keratin. They feed exclusively on ants and termites, consuming up to 70 million insects per year. When threatened, they curl into a tight ball. Critically endangered due to illegal wildlife trade."
    let whereCanYouSeeIt = "Extremely rare and endangered. Occasional sightings in Kruger and private reserves in Southern Africa. Mostly nocturnal."
    let safetyTips = "Harmless and shy. If you're extremely fortunate to see one, observe quietly from a distance. Never disturb or attempt to touch. Report sightings to park authorities."
}

struct SecretaryBird: AnimalModelProtocol {
    let id = UUID()
    let name = "Secretary Bird"
    let animalDescription = "Distinctive long-legged bird of prey that hunts by stomping on snakes."
    let about = "Secretary birds are unique raptors that hunt on foot, using powerful kicks to kill prey including venomous snakes. They can deliver kicks with a force five times their body weight. Named for their black head feathers that resemble quill pens secretaries used to tuck behind their ears."
    let whereCanYouSeeIt = "Serengeti, Kruger, and Masai Mara grasslands. Often seen walking through open plains hunting."
    let safetyTips = "Not dangerous to humans. Keep respectful distance to observe their fascinating hunting behavior. They are generally tolerant of vehicles."
}

class AnimalFactory {
    static func getAllAnimals() -> [AnimalModelProtocol] {
        return [
            Lion(),
            Elephant(),
            Giraffe(),
            Zebra(),
            Rhinoceros(),
            Leopard(),
            Cheetah(),
            Hyena(),
            Crocodile(),
            AfricanBuffalo(),
            Hippopotamus(),
            Warthog(),
            Jackal(),
            Baboon(),
            Meerkat(),
            Ostrich(),
            Flamingo(),
            Serval(),
            Caracal(),
            HoneyBadger(),
            Pangolin(),
            SecretaryBird()
        ]
    }
    
    static func getAnimal(byName name: String) -> AnimalModelProtocol? {
        return getAllAnimals().first { $0.name == name }
    }
    
    static func getRandomAnimal() -> AnimalModelProtocol {
        return getAllAnimals().randomElement()!
    }
}
