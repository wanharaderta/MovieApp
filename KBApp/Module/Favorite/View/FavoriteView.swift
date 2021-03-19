//
//  FavoriteView.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import SwiftUI

struct FavoriteView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @ObservedObject var presenter: FavoritePresenter
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 24, height: 24)
            .padding(.trailing, 10)
        })
        Text("Favorites")
          .font(.body)
          .foregroundColor(.white)
        Spacer(minLength: 0)
      }.padding()
      .background(Color.blue)

      ScrollView(.vertical, showsIndicators: false, content: {
        VStack {
          ZStack {
            VStack {
              if presenter.isLoading {
                VStack {
                  Text("Loading...")
                  ActivityIndicator()
                }
              } else {
                VStack {
                  ForEach(self.presenter.movies, id: \.id) { item in
                    self.presenter.linkBuilder(for: item, content: {
                      MovieRow(item: item)
                    })
                  }
                }.padding(.bottom, 120)
              }
            }
            .padding(.top, 15)
          }
        }.padding()
      })
    }
    .onAppear {
      self.presenter.getFavorites()
    }.navigationBarHidden(true)
  }
}
