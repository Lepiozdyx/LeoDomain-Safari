import SwiftUI
import SwiftData

struct PackingListView: View {
    @State private var checkedItems: Set<String> = []
    @State private var packingHistory: [PackingHistoryModel] = []
    
    private let context = AppDataContainer.shared.container.mainContext
    
    private let packingItems: [(category: String, items: [String])] = [
        ("Clothing", [
            "Wide-brimmed hat",
            "Lightweight long-sleeve shirts",
            "Comfortable hiking boots",
            "Neutral colored clothing (khaki/tan)",
            "Light jacket for cool mornings"
        ]),
        ("Equipment", [
            "Camera with zoom lens",
            "Binoculars",
            "Power bank",
            "Headlamp/flashlight",
            "Reusable water bottle"
        ]),
        ("Safety", [
            "Sunscreen (SPF 50+)",
            "Insect repellent with DEET",
            "First aid kit",
            "Malaria prophylaxis",
            "Hand sanitizer"
        ])
    ]
    
    private var totalItems: Int {
        packingItems.reduce(0) { $0 + $1.items.count }
    }
    
    private var progress: Double {
        totalItems > 0 ? Double(checkedItems.count) / Double(totalItems) : 0
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 8) {
                        Image(systemName: "cube.box")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "FF8C42"))
                        
                        Text("Safari Packing List")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Packing Progress")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text("\(checkedItems.count) / \(totalItems) items packed")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color(hex: "FF8C42"))
                            
                            Spacer()
                            
                            Text("\(Int(progress * 100))%")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color(hex: "FFD93D"))
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "F5F5F5"))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "FFD93D"))
                                    .frame(width: geometry.size.width * progress, height: 8)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding(16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Button {
                        completePacking()
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 18))
                            
                            Text("Complete Packing")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color(hex: "FFD93D"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack(spacing: 16) {
                    ForEach(packingItems, id: \.category) { section in
                        PackingSectionView(
                            category: section.category,
                            items: section.items,
                            checkedItems: $checkedItems
                        )
                    }
                }
                .padding(.horizontal, 20)
                
                if !packingHistory.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Packing History")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            ForEach(packingHistory, id: \.id) { history in
                                PackingHistoryCard(history: history)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .padding(.bottom, 100)
        }
        .background(Color(hex: "F5F5F5"))
        .onAppear {
            loadPackingHistory()
        }
    }
    
    private func completePacking() {
        let history = PackingHistoryModel(
            date: Date(),
            didComplete: checkedItems.count == totalItems,
            pickedItems: checkedItems.count
        )
        
        context.insert(history)
        try? context.save()
        
        checkedItems.removeAll()
        loadPackingHistory()
    }
    
    private func loadPackingHistory() {
        let descriptor = FetchDescriptor<PackingHistoryModel>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        packingHistory = (try? context.fetch(descriptor)) ?? []
    }
}

struct PackingSectionView: View {
    let category: String
    let items: [String]
    @Binding var checkedItems: Set<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Rectangle()
                    .fill(Color(hex: "FF8C42"))
                    .frame(width: 4, height: 20)
                
                Text(category)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
            }
            
            VStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    PackingItemRow(
                        item: item,
                        isChecked: checkedItems.contains(item)
                    ) {
                        if checkedItems.contains(item) {
                            checkedItems.remove(item)
                        } else {
                            checkedItems.insert(item)
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct PackingItemRow: View {
    let item: String
    let isChecked: Bool
    let onToggle: () -> Void
    
    var body: some View {
        Button(action: onToggle) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .stroke(isChecked ? Color(hex: "FFD93D") : Color(hex: "FF8C42"), lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                            .background(Color(hex: "FFD93D"))
                            .clipShape(Circle())
                    }
                }
                
                Text(item)
                    .font(.system(size: 15))
                    .foregroundColor(isChecked ? .gray : .black)
                    .strikethrough(isChecked, color: .gray)
                
                Spacer()
            }
            .padding(.vertical, 4)
        }
    }
}

struct PackingHistoryCard: View {
    let history: PackingHistoryModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Safari Packing")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Completion Date")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    
                    Text(history.date, format: .dateTime.month().day().year())
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Packing Status")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    
                    Text(history.didComplete ? "Completed" : "Partial")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(history.didComplete ? Color(hex: "4CAF50") : Color(hex: "FF8C42"))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Packed Items")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    
                    Text("\(history.pickedItems) / 15 items packed")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color(hex: "FF8C42"))
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    PackingListView()
}
