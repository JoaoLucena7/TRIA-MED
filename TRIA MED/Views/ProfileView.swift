//
//  ProfileView.swift
//  TRIA MED
//
//  Created by Joao felipe Lucena on 27/02/26.
//

import SwiftUI


struct ProfileStorageScreen: View {
    @StateObject private var vm = StorageViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                header
                promoBanner
                accountCard
            }
            .padding(.horizontal, 18)
            .padding(.top, 14)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Header (com foto segmentada)
    private var header: some View {
        HStack(alignment: .top, spacing: 16) {
            profileImage
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Carlos André Lucena")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.primary)
                
                Text("Armazenamento")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.secondary)
                
                StorageProgressBar(
                    docsFraction: vm.docsWidthFractionInUnifiedBar,
                    midiasFraction: vm.midiasWidthFractionInUnifiedBar
                )
                .frame(height: 10)
                .padding(.top, 4)
                
                legend
            }
            
            Spacer()
        }
    }
    
    private var profileImage: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 89, height: 89)
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)
            
            Image("iao")
                .resizable()
                .scaledToFill()
                .frame(width: 89, height: 89)
                .clipShape(Circle())
        }
        .accessibilityLabel("Foto de perfil")
    }
    
    private var legend: some View {
        HStack(spacing: 18) {
            HStack(spacing: 8) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
                Text("Docs")
                    .font(.system(size: 14))
                    .foregroundStyle(.primary)
            }
            
            HStack(spacing: 8) {
                Circle()
                    .fill(Color.pink)
                    .frame(width: 10, height: 10)
                Text("Mídias")
                    .font(.system(size: 14))
                    .foregroundStyle(.primary)
            }
            Spacer()
        }
        .padding(.top, 6)
    }
    
    private var promoBanner: some View {
        Button {
            // ação do banner
        } label: {
            Image("medical banner")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .shadow(color: .black.opacity(0.12), radius: 10, x: 0, y: 6)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Banner do histórico médico")
    }
    
    private var accountCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Minha conta")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.secondary)
                .padding(.top, 6)
            
            AccountRow(title: "Dados Cadastrais", icon: "pencil") {
                // ação
            }
            AccountRow(title: "Alterar senha", icon: "gearshape") {
                // ação
            }
            AccountRow(title: "Licença de Código Aberto", icon: "info.circle") {
                // ação
            }
            AccountRow(title: "Termos de Uso", icon: "doc.text") {
                // ação
            }
            AccountRow(title: "Sair", icon: "rectangle.portrait.and.arrow.right") {
                // ação
            }
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 6)
    }
}



#Preview {
    NavigationStack {
        ProfileStorageScreen()
    }
}
