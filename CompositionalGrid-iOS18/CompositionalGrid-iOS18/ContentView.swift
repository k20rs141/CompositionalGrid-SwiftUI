import SwiftUI

struct ContentView: View {
    @State private var count: Int = 3
    private var spacing: CGFloat = 6

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: spacing) {
                    PickerView()
                        .padding(.bottom, 10)

                    CompositionalLayout(count: count, spacing: spacing) {
                        ForEach(1...50, id: \.self) { index in
                            Rectangle()
                                .fill(.black.gradient)
                                .overlay {
                                    Text("\(index)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle.bold())
                                }
                        }
                    }
                    .animation(.bouncy, value: count)
                }
                .padding(15)
            }
            .navigationTitle("Compositional Grid")
        }
    }

    @ViewBuilder
    func PickerView() -> some View {
        Picker("", selection: $count) {
            ForEach(1...4, id: \.self) {
                Text("Count = \($0)")
                    .tag($0)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}
