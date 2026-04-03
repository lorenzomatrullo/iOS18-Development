import SwiftUI
import Charts

// Swift Charts for data visualization.
struct ChartsView: View {
    struct MonthlySales: Identifiable {
        let id = UUID()
        let month: String
        let revenue: Double
    }

    let salesData: [MonthlySales] = [
        .init(month: "Jan", revenue: 3500),
        .init(month: "Feb", revenue: 4200),
        .init(month: "Mar", revenue: 3800),
        .init(month: "Apr", revenue: 5100),
        .init(month: "May", revenue: 4700),
        .init(month: "Jun", revenue: 6200)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Bar chart
                GroupBox("Monthly Revenue") {
                    Chart(salesData) { item in
                        BarMark(
                            x: .value("Month", item.month),
                            y: .value("Revenue", item.revenue)
                        )
                        .foregroundStyle(.blue.gradient)
                    }
                    .frame(height: 200)
                }

                // Line chart
                GroupBox("Revenue Trend") {
                    Chart(salesData) { item in
                        LineMark(
                            x: .value("Month", item.month),
                            y: .value("Revenue", item.revenue)
                        )
                        .foregroundStyle(.green)

                        PointMark(
                            x: .value("Month", item.month),
                            y: .value("Revenue", item.revenue)
                        )
                        .foregroundStyle(.green)
                    }
                    .frame(height: 200)
                }

                // Area chart
                GroupBox("Revenue Area") {
                    Chart(salesData) { item in
                        AreaMark(
                            x: .value("Month", item.month),
                            y: .value("Revenue", item.revenue)
                        )
                        .foregroundStyle(.purple.opacity(0.3))

                        LineMark(
                            x: .value("Month", item.month),
                            y: .value("Revenue", item.revenue)
                        )
                        .foregroundStyle(.purple)
                    }
                    .frame(height: 200)
                }
            }
            .padding()
        }
        .navigationTitle("31 - Charts")
    }
}

#Preview {
    ChartsView()
}
