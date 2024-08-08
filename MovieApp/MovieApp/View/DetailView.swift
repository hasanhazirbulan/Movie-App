//
//  DetailView.swift
//  MovieApp
//
//  Created by Hasan Hazırbulan on 21.07.2024.
//

import SwiftUI

struct DetailView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
            HStack{
                Spacer()
                PrivateImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title).foregroundColor(.blue).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
            
            Text("Directors: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Writers: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Awards: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
            
            Text("Year: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

#Preview {
    DetailView(imdbId: "test")
}
