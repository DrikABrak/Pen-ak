//
//  ContentView.swift
//  Peñak
//
//  Created by Cedric Trespeuch on 23/08/2024.
//

import SwiftUI
import SwiftData
import Supabase
import MapKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @Environment(SupaService.self) private var supaService
    
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.49021072745114, longitude: -1.475038761148427),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        )
    )
    
    @State var clickedPena: Item? = nil
    
    var body: some View {
        
        ZStack {
            Map(initialPosition: position) {
                ForEach(items) { item in
                    Annotation(item.name, coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 30, height: 30)
                            .background(.white)
                            .clipShape(.circle)
                            .onTapGesture {
                                print(item.name)
                                self.clickedPena = item
                            }
                    }
                    //.annotationTitles(.hidden)
                    //Marker(item.name, coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude))
                }
            }
        }
        .sheet(item: $clickedPena) { pena in
            Text("Open \(pena.name)")
                .presentationDetents([.medium, .large])
        }
        .task {
            await self.supaService.getPeñak()
            updateItems()
        }
    }

    private func updateItems() {
        
        for pena in supaService.peñak {
            // Create a peña in SwiftData if not exist
            guard let item = items.first(where: { $0.id == pena.id }) else {
                let item = Item(id: pena.id, name: pena.name, address: pena.address, longitude: pena.longitude, latitude: pena.latitude)
                modelContext.insert(item)
                try? modelContext.save()
                continue
            }

            // Else update peña
            item.name = pena.name
            item.address = pena.address
            item.longitude = pena.longitude
            item.latitude = pena.latitude
            
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
