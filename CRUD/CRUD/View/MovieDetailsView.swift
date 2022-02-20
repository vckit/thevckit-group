//
//  MovieDetailsView.swift
//  CRUD
//
//  Created by Абдулхаким Магомедов on 09.12.2021.
//

import SwiftUI

struct MovieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditMovieSheet = false
    
    var movie: Movie
    
    private func editButton(action: @escaping () -> Void) -> some View {
        Button(action: { action() }) {
            Text("Edit")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Movie")) {
                Text(movie.title)
                Text(movie.description)
            }
            Section(header: Text("Year")) {
                Text(movie.year)
            }
            .navigationBarTitle(movie.title)
            .navigationBarItems(trailing: editButton {
                self.presentEditMovieSheet.toggle()
            })
            .onAppear {
                print("MovieDetailsView.onAppear() for \(self.movie.title)")
            }
            .onDisappear {
                print("MovieDetailsView.onDisappear()")
            }
        }
    }
}
