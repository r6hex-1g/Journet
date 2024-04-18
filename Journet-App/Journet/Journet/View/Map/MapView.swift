import SwiftUI
import MapKit

//MARK: - EZ location
extension CLLocationCoordinate2D {
    static let EZ = CLLocationCoordinate2D(latitude: 36.6350782, longitude: 127.4576923)
}


//MARK: - Map View
struct MapView: View {
    @State private var postion: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $postion) {
            Marker("이지디자인컴퓨터학원", systemImage: "building.fill", coordinate: .EZ)
                .tint(.blue)
            
            UserAnnotation()
        }
        .mapStyle(.standard(showsTraffic: true))
        .mapControls {
            MapUserLocationButton()
        }
    }
}

#Preview {
    MapView()
}
