//
//  FilmListView.swift
//  MovieApp
//
//  Created by Hasan Hazırbulan on 21.07.2024.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
      
    }
    
    var body: some View {
        NavigationView{
            
            VStack {
        
            TextField(" In Movie We Love", text: $aranacakFilm, onEditingChanged:{ _ in }, onCommit: {
                self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
            }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
            
        List(filmListeViewModel.filmler, id: \.imdbId) { film in
            NavigationLink(
                destination: DetailView(imdbId:film.imdbId),
                label: {
                    HStack() {
                        
                        PrivateImage(url: film.poster)
                            .frame(width: 90, height:130)
                        
                        VStack(alignment: .leading) {
                            Text(film.title)
                                .font(.title3)
                                .foregroundColor(.blue)
                                
                            
                            Text(film.year)
                                .foregroundColor(.orange)
                        }
                    }
                })
          
            
        }.navigationTitle(Text("Movie Library"))
        }
        }
    }
}


#Preview {
    FilmListView()
}
