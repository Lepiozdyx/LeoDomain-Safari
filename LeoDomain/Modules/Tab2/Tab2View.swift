import SwiftUI
import SwiftData

struct Tab2View: View {
    @State private var selectedTab: PlannerTab = .excursions
    @State private var showAddExcursion = false
    @State private var excursions: [ExcursionModel] = []
    @State private var selectedDate: Date?
    @State private var showExcursionsForDate = false
    
    private let context = AppDataContainer.shared.container.mainContext
    
    enum PlannerTab {
        case excursions
        case packing
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Travel Planner")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Organize your safari adventure")
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
            
            HStack(spacing: 0) {
                Button {
                    withAnimation {
                        selectedTab = .excursions
                    }
                } label: {
                    Text("Your Excursions")
                        .font(.system(size: 16, weight: selectedTab == .excursions ? .semibold : .medium))
                        .foregroundColor(selectedTab == .excursions ? Color(hex: "FF8C42") : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .fill(selectedTab == .excursions ? Color(hex: "FF8C42") : Color.clear)
                                    .frame(height: 3)
                            }
                        )
                }
                
                Button {
                    withAnimation {
                        selectedTab = .packing
                    }
                } label: {
                    Text("Packing List")
                        .font(.system(size: 16, weight: selectedTab == .packing ? .semibold : .medium))
                        .foregroundColor(selectedTab == .packing ? Color(hex: "FF8C42") : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .fill(selectedTab == .packing ? Color(hex: "FF8C42") : Color.clear)
                                    .frame(height: 3)
                            }
                        )
                }
            }
            .background(Color.white)
            
            if selectedTab == .excursions {
                ExcursionsView(
                    excursions: excursions,
                    showAddExcursion: $showAddExcursion,
                    selectedDate: $selectedDate,
                    showExcursionsForDate: $showExcursionsForDate,
                    onRefresh: loadExcursions
                )
            } else {
                PackingListView()
            }
        }
        .background(Color(hex: "F5F5F5"))
        .edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $showAddExcursion) {
            AddExcursionView(context: context, onSave: {
                loadExcursions()
            })
        }
        .sheet(isPresented: $showExcursionsForDate) { [selectedDate] in
            if let date = selectedDate {
                ExcursionsListSheet(
                    excursions: excursions.filter { Calendar.current.isDate($0.date, inSameDayAs: date) },
                    date: date
                )
            }
        }
        .onAppear {
            loadExcursions()
        }
    }
    
    private func loadExcursions() {
        let descriptor = FetchDescriptor<ExcursionModel>(sortBy: [SortDescriptor(\.date)])
        excursions = (try? context.fetch(descriptor)) ?? []
    }
}

struct ExcursionsView: View {
    let excursions: [ExcursionModel]
    @Binding var showAddExcursion: Bool
    @Binding var selectedDate: Date?
    @Binding var showExcursionsForDate: Bool
    let onRefresh: () -> Void
    
    var body: some View {
        if excursions.isEmpty {
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: "calendar")
                    .font(.system(size: 80))
                    .foregroundColor(Color.gray.opacity(0.3))
                
                Text("No excursions planned yet")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                
                Button {
                    showAddExcursion = true
                } label: {
                    Text("Add Your First Excursion")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 16)
                        .background(Color(hex: "FF8C42"))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Your Excursions")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    CalendarView(
                        excursions: excursions,
                        selectedDate: $selectedDate,
                        showExcursionsForDate: $showExcursionsForDate
                    )
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            showAddExcursion = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 60, height: 60)
                                .background(Color(hex: "FFD93D"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 20)
                }
                .padding(.bottom, 100)
            }
        }
    }
}

struct CalendarView: View {
    let excursions: [ExcursionModel]
    @Binding var selectedDate: Date?
    @Binding var showExcursionsForDate: Bool
    @State private var currentMonth = Date()
    
    private let calendar = Calendar.current
    private let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    withAnimation {
                        currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth) ?? currentMonth
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "FF8C42"))
                }
                
                Spacer()
                
                Text(currentMonth, format: .dateTime.month(.wide).year())
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    withAnimation {
                        currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth) ?? currentMonth
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "FF8C42"))
                }
            }
            .padding(.horizontal, 16)
            
            HStack(spacing: 0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                ForEach(getDaysInMonth(), id: \.self) { date in
                    if let date = date {
                        DayCell(
                            date: date,
                            hasExcursion: hasExcursion(on: date),
                            isToday: calendar.isDateInToday(date)
                        )
                        .onTapGesture {
                            if hasExcursion(on: date) {
                                selectedDate = date
                                showExcursionsForDate = true
                            }
                        }
                    } else {
                        Color.clear
                            .frame(height: 40)
                    }
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private func getDaysInMonth() -> [Date?] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: currentMonth),
              let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start) else {
            return []
        }
        
        var days: [Date?] = []
        var date = monthFirstWeek.start
        
        while date < monthInterval.end {
            if calendar.isDate(date, equalTo: currentMonth, toGranularity: .month) {
                days.append(date)
            } else if days.isEmpty || days.last != nil {
                days.append(nil)
            }
            date = calendar.date(byAdding: .day, value: 1, to: date) ?? date
        }
        
        return days
    }
    
    private func hasExcursion(on date: Date) -> Bool {
        excursions.contains { calendar.isDate($0.date, inSameDayAs: date) }
    }
}

struct DayCell: View {
    let date: Date
    let hasExcursion: Bool
    let isToday: Bool
    
    var body: some View {
        VStack {
            if hasExcursion {
                Circle()
                    .fill(Color(hex: "FF8C42"))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(date, format: .dateTime.day())
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    )
            } else if isToday {
                Circle()
                    .stroke(Color(hex: "FF8C42"), lineWidth: 2)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text(date, format: .dateTime.day())
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "FF8C42"))
                    )
            } else {
                Text(date, format: .dateTime.day())
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
            }
        }
        .frame(height: 40)
    }
}

struct ExcursionsListSheet: View {
    @Environment(\.dismiss) var dismiss
    let excursions: [ExcursionModel]
    let date: Date
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Excursions on \(date, format: .dateTime.month().day())")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                        .frame(width: 32, height: 32)
                        .background(Color(hex: "F5F5F5"))
                        .clipShape(Circle())
                }
            }
            .padding(20)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(excursions, id: \.id) { excursion in
                        ExcursionCard(excursion: excursion)
                    }
                }
                .padding(20)
            }
        }
        .background(Color(hex: "F5F5F5"))
    }
}

struct ExcursionCard: View {
    let excursion: ExcursionModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(excursion.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
            
            HStack(spacing: 6) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: "FF8C42"))
                
                Text(excursion.location)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 16) {
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "FF8C42"))
                    
                    Text(excursion.date, format: .dateTime.year().month().day())
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 6) {
                    Image(systemName: "clock")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "FF8C42"))
                    
                    Text(excursion.date, format: .dateTime.hour().minute())
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
            }
            
            if let notes = excursion.notes, !notes.isEmpty {
                Text(notes)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineSpacing(4)
            }
            
            if let things = excursion.thingsToBring, !things.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 6) {
                        Image(systemName: "cube.fill")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "FFD93D"))
                        
                        Text("Things to Bring:")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    
                    Text(things)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    Tab2View()
}
