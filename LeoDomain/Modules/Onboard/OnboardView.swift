import SwiftUI

struct OnboardView: View {
    var onEnd: () -> Void
    @State var state: OnboardState = .first
    
    var body: some View {
        BgView {
            VStack {
                Image(state.rawValue)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width)
                    .scaledToFit().ignoresSafeArea()
                
                Spacer()
                
                Button(action: {
                    if state == .first {
                        state = .second
                    } else if state == .second {
                        state = .third
                    } else {
                        onEnd()
                    }
                }) {
                    if state == .first || state == .second {
                        Image(.nextBtn)
                            .resizable().scaledToFit().padding()
                    } else {
                        Image(.startBtn)
                            .resizable().scaledToFit().padding()
                    }
                }
            }
        }
    }
}

enum OnboardState: String, CaseIterable {
    case first, second, third
}
