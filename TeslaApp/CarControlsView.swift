//
//  CarControlsView.swift
//  TeslaApp
//
//  Created by Hamza Wahab on 17/03/2026.
//

import SwiftUI

let carControls: [ActionItem] = [
    ActionItem(icon: "flashlight.on.fill", text: "Flash"),
    ActionItem(icon: "speaker.wave.3.fill", text: "Honk"),
    ActionItem(icon: "key.fill", text: "Start"),
    ActionItem(icon: "arrow.up.bin", text: "Front Trunk"),
    ActionItem(icon: "arrow.up.square", text: "Trunk"),
]

struct CarControlsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var toggleValet: Bool = false
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        GeneralButton(icon: "chevron.left")
                    }
                    
                    
                    Spacer()
                }
                Text("Car Controls")
                    .font(.title)
                    .fontWeight(.semibold)
                CustomDivider()
                CarLockButtonView()
                CustomDivider()
                CarControlActions()
                CustomDivider()
                HStack{
                    Text("Valet Mode")
                        .fontWeight(.medium)
                    Spacer()
                    Toggle("", isOn: $toggleValet)
                }
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundStyle(Color.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
    }
}

struct CarLockButtonView: View {
    var body: some View {
        Button(action: {}) {
            FullButton(text: "Unlock Car", icon: "lock.fill")
        }
    }
}

struct CarControlActions: View {
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Spacer()
                ActionButton(item: carControls[0])
                Spacer()
                ActionButton(item: carControls[1])
                Spacer()
                ActionButton(item: carControls[2])
                Spacer()
            }
            HStack{
                Spacer()
                ActionButton(item: carControls[3])
                Spacer()
                ActionButton(item: carControls[4])
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    CarControlsView()
}
