//
//  ContentView.swift
//  TeslaApp
//
//  Created by Hamza Wahab on 17/03/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    VStack(spacing: 10.0){
                        HomeHeader()
                        CustomDivider()
                        CarSection()
                        CustomDivider()
                        CategoryView(
                            title: "Quick Shortcuts",
                            showEdit: true,
                            actionItems: quickShortcuts
                        )
                        CustomDivider()
                        CategoryView(
                            title: "Recent Actions",
                            actionItems: recentActions
                        )
                        CustomDivider()
                        AllSettings()
                        CustomDivider()
                        ReorderButton()
                    }
                    .padding()
                }
                VoiceCommandView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGray"))
            .foregroundStyle(Color.white)
            .navigationTitle("Mach Five")
            .navigationBarHidden(true)
        }
    }
}
struct VoiceCommandView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "mic.fill")
                    .font(
                        .system(
                            size: 24,
                            weight: .semibold,
                            design: .default
                        )
                    )
                    .foregroundStyle(Color("DarkGray"))
                    .frame(width: 64, height: 64)
                    .background(Color("Green"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10.0)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct HomeHeader: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text("Model 4".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(Color("Red"))
                    .clipShape(Capsule())
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }
            Spacer()
            HStack{
                Button(action: {}) {
                    GeneralButton(icon: "lock.fill")
                }
                Button(action: {}) {
                    GeneralButton(icon: "gear")
                }
            }
        }
        //.padding(.top)
    }
}

struct GeneralButton: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 50, height: 50)
            .background(Color.white.opacity(0.1))
            .clipShape(Circle())
            .overlay{
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
            }
    }
}

struct CustomDivider: View {
    var body: some View {
        Color.white.opacity(0.1)
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            
    }
}

struct CarSection: View {
    var body: some View {
        VStack(spacing: 10){
            HStack(alignment: .top){
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 miles".uppercased())
                }
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(Color("Green"))
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("last updated: 5 min ago")
                        .font(.caption2)
                        .foregroundStyle(Color.gray)
                }
                
            }
            Image("Car")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct CategoryHeader: View {
    var title: String
    var showEdit: Bool = false
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
                if showEdit {
                    EditButton()
                        .foregroundStyle(Color.gray)
                        .fontWeight(.medium)
                }
            }
        }
    }
}

struct CategoryView: View {
    var title: String
    var showEdit: Bool = false
    var actionItems: [ActionItem]
    var body: some View {
        VStack(alignment: .center){
            CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal) {
                HStack(alignment: .top){
                    ForEach(actionItems, id: \.self) { item in
                        Button(action: {}) {
                            ActionButton(item: item)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct ActionButton: View {
    var item: ActionItem
    var body: some View {
        VStack{
            GeneralButton(icon: item.icon)
            Text(item.text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
        }
    }
}

struct ActionItem: Hashable {
    var icon: String
    var text: String
}

let quickShortcuts: [ActionItem]  = [
    ActionItem(icon: "bolt.fill", text: "Charging"),
    ActionItem(icon: "fanblades.fill", text: "Fan On"),
    ActionItem(icon: "music.note", text: "Media Controls"),
    ActionItem(icon: "bolt.car", text: "Close Charge Port")
]

let recentActions: [ActionItem]  = [
    ActionItem(icon: "arrow.up.square", text: "Open Trunk"),
    ActionItem(icon: "fan", text: "Fan Off"),
    ActionItem(icon: "bolt.car", text: "Summon")
]

struct AllSettings: View {
    var body: some View {
        VStack{
            CategoryHeader(title: "All Settings")
            LazyVGrid(
                columns: [
                    GridItem(.fixed(180)),
                    GridItem(.fixed(180))
                ],
                spacing: 13.0
            ) {
                NavigationLink(destination: CarControlsView()) {
                    SettingsBlock(icon: "car.fill", title: "Controls", subtitle: "Lock Control")
                }
                SettingsBlock(
                    icon: "fanblades.fill",
                    title: "Climate",
                    subtitle: "Interior 68° F",
                    backgroundColor: Color("Blue")
                )
                SettingsBlock(
                    icon: "location.fill",
                    title: "Location",
                    subtitle: "empire state building"
                )
                SettingsBlock(
                    icon: "checkerboard.shield",
                    title: "Security",
                    subtitle: "0 events detected"
                )
                SettingsBlock(
                    icon: "sparkles",
                    title: "Upgrades",
                    subtitle: "3 upgrades available"
                )
            }
        }
    }
}

struct SettingsBlock: View {
    var icon: String
    var title: String
    var subtitle: String = ""
    var backgroundColor = Color.white.opacity(0.05)
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            Image(systemName: icon)
            VStack(alignment: .leading, spacing: 2){
                Text(title)
                    .font(
                        .system(size: 18, weight: .medium, design: .default)
                    )
                Text(subtitle.uppercased())
                    .font(
                        .system(size: 8, weight: .medium, design: .default)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
        .overlay {
            RoundedRectangle(cornerRadius: 16.0)
                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
        }
    }
}

struct ReorderButton: View {
    var body: some View {
        VStack{
            Button(action: {}) {
                Text("reorder groups".capitalized)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 14)
                    .background(Color.white.opacity(0.05))
                    .clipShape(Capsule())
                
            }
        }
    }
}

#Preview {
    ContentView()
}
