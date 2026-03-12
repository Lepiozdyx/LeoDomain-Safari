import SwiftUI
import SwiftData

struct AddExcursionView: View {
    @Environment(\.dismiss) var dismiss
    let context: ModelContext
    let onSave: () -> Void
    
    @State private var name = ""
    @State private var location = ""
    @State private var date = Date()
    @State private var notes = ""
    @State private var thingsToBring = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.white.opacity(0.2))
                        .clipShape(Circle())
                }
                
                Text("Add Excursion")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
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
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Excursion Name")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        
                        TextField("e.g., Morning Jeep Safari", text: $name)
                            .font(.system(size: 16))
                            .padding(16)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Location")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        
                        TextField("e.g., Serengeti National Park", text: $location)
                            .font(.system(size: 16))
                            .padding(16)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.black)
                            
                            DatePicker("", selection: $date, displayedComponents: [.date])
                                .labelsHidden()
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .frame(maxWidth: .infinity)

                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Time")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.black)
                            
                            DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                                .labelsHidden()
                                .padding(12)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .frame(maxWidth: .infinity)

                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notes")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        
                        TextEditor(text: $notes)
                            .font(.system(size: 16))
                            .frame(height: 100)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                Group {
                                    if notes.isEmpty {
                                        Text("Any additional details...")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray.opacity(0.5))
                                            .padding(.leading, 16)
                                            .padding(.top, 20)
                                    }
                                },
                                alignment: .topLeading
                            )
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Things to Bring")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        
                        TextEditor(text: $thingsToBring)
                            .font(.system(size: 16))
                            .frame(height: 100)
                            .padding(12)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                Group {
                                    if thingsToBring.isEmpty {
                                        Text("e.g., Camera, binoculars, water bottle...")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray.opacity(0.5))
                                            .padding(.leading, 16)
                                            .padding(.top, 20)
                                    }
                                },
                                alignment: .topLeading
                            )
                    }
                    
                    HStack(spacing: 12) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(hex: "FF8C42"))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(hex: "FF8C42"), lineWidth: 2)
                                )
                        }
                        
                        Button {
                            saveExcursion()
                        } label: {
                            Text("Save Excursion")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color(hex: "FF8C42"))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .disabled(name.isEmpty || location.isEmpty)
                        .opacity(name.isEmpty || location.isEmpty ? 0.5 : 1)
                    }
                    .padding(.top, 20)
                }
                .padding(20)
                .padding(.bottom, 100)
            }
        }
        .background(Color(hex: "F5F5F5"))
        .edgesIgnoringSafeArea(.top)
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func saveExcursion() {
        let excursion = ExcursionModel(
            name: name,
            location: location,
            date: date,
            notes: notes.isEmpty ? nil : notes,
            thingsToBring: thingsToBring.isEmpty ? nil : thingsToBring
        )
        
        context.insert(excursion)
        try? context.save()
        
        onSave()
        dismiss()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    AddExcursionView(context: AppDataContainer.shared.container.mainContext, onSave: {})
}
