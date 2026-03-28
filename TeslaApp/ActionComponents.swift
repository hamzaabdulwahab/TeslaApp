//
//  ActionComponents.swift
//  TeslaApp
//
//  Created by Hamza Wahab on 28/03/2026.
//

import SwiftUI

struct ActionComponents: View {
    var body: some View {
        ChargingView()
        // MediaPlayer()
        //  VoiceCommandView(text: "\"Go to times square..\"")
        // ActionNotifications(open: .constant(true), text: "Turning on the fan", icon: "fanblades.fill")
    }
}

//#Preview {
//    ActionComponents()
//}

struct VoiceCommandView: View {
    @Binding var openVoiceCommand: Bool
    var text: String
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            Image("wave")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .bottom, spacing: 20){
                HStack(spacing: 10){
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text(text)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 15)
                Spacer()
                Button(action: {
                    withAnimation {
                        openVoiceCommand = false
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .foregroundStyle(Color.white)
                        .frame(width: 64, height: 64)
                        .background(Color("DarkGray"), in: Circle())
                }
            }
            .padding(20)
            .background(Color("Green"))
            .foregroundStyle(Color("DarkGray"))
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ActionNotifications: View {
    @Binding var open: Bool
    var text: String
    var icon: String
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .center, spacing: 10){
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                Button(action: {
                    withAnimation {
                        open = false
                    }
                }) {
                    Text("Cancel")
                        .font(.subheadline)
                        .opacity(0.5)
                }
            }
            .padding(20)
            .foregroundStyle(Color.white)
            .background(
                Color("DarkGray"),
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MediaPlayer: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 20){
                HStack(alignment: .center, spacing: 10){
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 64, height: 64)
                        .overlay {
                            Image("me")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 60)
                                .frame(width: 50, height: 50)
                                .clipped()
                                .overlay(alignment: .topTrailing) {
                                    Image(systemName: "wave.3.up")
                                        .foregroundStyle(Color("DarkGray"))
                                        .font(
                                            .system(
                                                size: 7.5,
                                                weight: .medium,
                                                design: .default
                                            )
                                        )
                                        .padding(4)
                                        .background(Color("Green"), in: Circle())
                                        .overlay{
                                            Circle()
                                                .stroke(Color.black, lineWidth: 1.5)
                                        }
                                }
                        }
                    VStack(alignment: .leading, spacing: 0){
                        Text("Don't take the Money")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Bleachers - Gone Now")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .opacity(0.5)
                    }
                    Spacer()
                }
                VStack(spacing: 3){
                    HStack{
                        Text("1:05")
                        Spacer()
                        Text("-2:30")
                    }
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .opacity(0.5)
                    ZStack(alignment: .leading){
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(width: 200, height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                        
                    }
                }
                CustomDivider()
                HStack{
                    HStack(alignment: .center, spacing: 20){
                        Button(action: {}) {
                            MediaPlayerButton(icon: "backward.fill")
                                .foregroundStyle(Color.white.opacity(0.5))
                        }
                        Button(action: {}) {
                            MediaPlayerButton(icon: "playpause.fill")
                        }
                        Button(action: {}) {
                            MediaPlayerButton(icon: "forward.fill")
                                .foregroundStyle(Color.white.opacity(0.5))
                        }
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 20){
                        Button(action: {}) {
                            MediaPlayerButton(icon: "minus")
                                .foregroundStyle(Color.white.opacity(0.5))
                        }
                        RadialGradient(
                            gradient: Gradient(
                                colors: [Color.white, Color.white.opacity(0.5)]
                            ),
                            center: .leading,
                            startRadius: 31,
                            endRadius: 32
                        )
                        .frame(width: 40, height: 40)
                        .mask {
                            Button(action: {}) {
                                MediaPlayerButton(icon: "speaker.wave.3.fill")
                                //  .foregroundStyle(Color.white.opacity(0.5))
                            }
                        }
                        Button(action: {}) {
                            MediaPlayerButton(icon: "plus")
                                .foregroundStyle(Color.white.opacity(0.5))
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .background(Color("DarkGray"))
            .cornerRadius(20, corners: [.topLeft, .topRight])
            //            .clipShape(
            //                UnevenRoundedRectangle(
            //                    topLeadingRadius: 20,
            //                    bottomLeadingRadius: 0,
            //                    bottomTrailingRadius: 0,
            //                    topTrailingRadius: 20
            //                )
            //            )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ChargingView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading, spacing: 5){
                    Label("237 miles", systemImage: "bolt.fill")
                        .foregroundStyle(Color("Green"))
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text("3h 55m remain - 32/3A 30 mi/hour")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                VStack(alignment: .leading, spacing: 3){
                    Text("Charge Limit: 315 miles")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .opacity(0.5)
                    ZStack(alignment: .leading){
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(width: 250, height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 300)
                    }
                }
                CustomDivider()
                Button(action: {}) {
                    Text("Stop Charging")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 14)
                        .background(Color("BarnRed"), in: Capsule())
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding(.bottom, 20)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .background(Color("DarkGray"))
            .cornerRadius(20, corners: [.topLeft, .topRight])
            //            .clipShape(
            //                UnevenRoundedRectangle(
            //                    topLeadingRadius: 20,
            //                    bottomLeadingRadius: 0,
            //                    bottomTrailingRadius: 0,
            //                    topTrailingRadius: 20
            //                )
            //            )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct MediaPlayerButton: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 20, weight: .semibold, design: .default))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

