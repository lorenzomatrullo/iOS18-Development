import SwiftUI
import MapKit

// MapKit with SwiftUI Map view.
struct MapKitView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    struct Landmark: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }

    let landmarks = [
        Landmark(name: "Golden Gate Bridge", coordinate: .init(latitude: 37.8199, longitude: -122.4783)),
        Landmark(name: "Fisherman's Wharf", coordinate: .init(latitude: 37.8080, longitude: -122.4177)),
        Landmark(name: "Alcatraz Island", coordinate: .init(latitude: 37.8267, longitude: -122.4233))
    ]

    var body: some View {
        Map(position: $position) {
            ForEach(landmarks) { landmark in
                Marker(landmark.name, coordinate: landmark.coordinate)
                    .tint(.red)
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .mapControls {
            MapCompass()
            MapScaleView()
            MapUserLocationButton()
        }
        .navigationTitle("32 - MapKit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MapKitView()
}
