//
//  ComponentsView.swift
//  TRIA MED
//
//  Created by Joao felipe Lucena on 27/01/26.
//

import SwiftUI

struct ComponentsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct PillButtonpink: View {

    let title: String
    var action: () -> Void = {
        
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .scaledToFill()
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
        }
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.96, green: 0.42, blue: 0.58),
                    Color(red: 0.93, green: 0.30, blue: 0.49)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(Capsule())
    }
}

struct PillButtonblue: View {

    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .scaledToFill()
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
        }
        .background(
            LinearGradient(
                colors: [
                      Color(red: 0.20, green: 0.63, blue: 1.00),
                      Color(red: 0.10, green: 0.50, blue: 0.95)
                  ],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
              )
            )
        .clipShape(Capsule())
    }
}

struct PillButtonwhite: View {

    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
           
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.red)
                .opacity(0.8)
                .scaledToFill()
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                
                
        }
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct BigPillButtonblue: View {

    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
           
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .opacity(0.8)
                .scaledToFill()
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                
                
        }
        .background(Color.blue)
        .clipShape(Capsule())
    }
}
struct BigPillButtonpink: View {

    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .scaledToFill()
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
        }
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.96, green: 0.42, blue: 0.58),
                    Color(red: 0.93, green: 0.30, blue: 0.49)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(Capsule())
    }
}
struct BigPillButtonwhite: View {

    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(title)
           
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.red)
                .opacity(0.8)
                .scaledToFill()
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                
                
        }
        .background(Color.white)
        .clipShape(Capsule())
    }
}


struct FolderToggleRow: View {
    
    let title: String
    let exams: Int
    
    var iconName: String = "folder"
    var accentColor: Color = .red
    
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image(systemName: iconName)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(accentColor)
            
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(accentColor)
            
            Spacer()
            
            Text("\(exams)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(accentColor)
            
            Toggle("", isOn: $isSelected)
                .labelsHidden()
                .toggleStyle(CheckCircleToggleStyle(color: accentColor))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(backgroundView)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
    
    // Background muda conforme estado
    private var backgroundView: some View {
        Group {
            if isSelected {
                LinearGradient(
                    colors: [
                        accentColor.opacity(0.25),
                        accentColor.opacity(0.12)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            } else {
                Color.white
            }
        }
    }
    struct CheckCircleToggleStyle: ToggleStyle {
        
        let color: Color
        
        func makeBody(configuration: Configuration) -> some View {
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn
                      ? "checkmark.circle.fill"
                      : "circle")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(configuration.isOn ? color : .secondary)
            }
            .buttonStyle(.plain)
        }
    }
}
struct ClinicCardView: View {

    let title: String
    let subtitle: String
    let imageName: String
    var accentColor: Color = .blue

    var body: some View {
        HStack(spacing: 16) {

            avatar

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.primary)

                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
    }

    private var avatar: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.12))
                .frame(width: 64, height: 64)

            Image(systemName: imageName.isEmpty ? "cross.case.fill" : imageName)
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(accentColor)
        }
    }
}
#Preview {
    ClinicCardView(
        title: "Nome Clínica/Médico",
        subtitle: "Texto de apoio",
        imageName: "",
        accentColor: .blue
    )
    .padding()
    .background(Color.black.opacity(0.05))
}
