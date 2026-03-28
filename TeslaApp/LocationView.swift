//
//  LocationView.swift
//  TeslaApp
//
//  Created by Hamza Wahab on 28/03/2026.
//

import SwiftUI
import MapKit

struct CarLocation: Identifiable {
    var id = UUID()
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let carLocations: [CarLocation] = [CarLocation(latitude: 24.875278, longitude: 67.040833)]

struct LocationView: View {
    @State private var location: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.875278, longitude: 67.040833),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Map(
                coordinateRegion: $location,
                annotationItems: carLocations) { location in
                    MapAnnotation(coordinate: location.coordinate) {CarPin()}
                }
            
            CarLocationPanel()
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color("DarkGray"), Color.clear, Color.clear]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .allowsHitTesting(false)
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                    
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundStyle(Color.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
        
    }
}

struct CarPin: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4){
            Image(systemName: "car.fill")
                .frame(width: 32, height: 32)
                .background(Color("Red"))
                .foregroundStyle(Color.white)
                .clipShape(Circle())
            Text("Mach Five")
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                )
        }
    }
}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading, spacing: 5){
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomDivider()
                    Label("20 W 34th St, New York, NY 10001", systemImage: "location.fill")
                        .font(.footnote)
                        .opacity(0.5)
                }
                VStack(alignment: .leading, spacing: 10){
                    VStack(alignment: .leading, spacing: 5){
                        Text("Summon")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        CustomDivider()
                        Text("Press and hold controls to move vehicle")
                            .font(.footnote)
                            .opacity(0.5)
                    }
                    CustomDivider()
                    FullButton(text: "Go to Target")
                    HStack{
                        FullButton(text: "Forward", icon: "arrow.up")
                        FullButton(text: "Backward", icon: "arrow.down")
                    }
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    LocationView()
}
