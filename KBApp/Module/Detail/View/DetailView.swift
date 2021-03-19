//
//  DetailView.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct DetailView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @ObservedObject var presenter: DetailPresenter
  
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
      ScrollView {
        VStack {
          HStack {
            VStack {
              WebImage(url: URL(string: self.presenter.movie.poster_path))
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .cornerRadius(10)
                .scaleEffect()
                .frame(width: 150, height: 200)
              Spacer()
            }
            VStack {
              HStack {
                Text(self.presenter.movie.title)
                  .font(.system(size: 20))
                  .bold()
                  .lineLimit(1)
                Spacer()
              }
              HStack {
                Text(self.presenter.movie.release_date)
                  .font(.system(size: 13))
                  .bold()
                  .lineLimit(1)
                Spacer()
              }
              Spacer()
              HStack {
                Text("Overview")
                  .font(.system(size: 16))
                  .bold()
                  .lineLimit(1)
                Spacer()
                if self.presenter.movie.favorite == true {
                  Button(action: { self.presenter.unFavorite() }, label: {
                    Image(systemName: "suit.heart.fill")
                      .resizable()
                      .foregroundColor(.red)
                      .frame(width: 24, height: 24)
                      .padding(.trailing, 10)
                  })
                } else {
                  Button(action: { self.presenter.addFavorite() }, label: {
                    Image(systemName: "suit.heart")
                      .resizable()
                      .foregroundColor(.red)
                      .frame(width: 24, height: 24)
                      .padding(.trailing, 10)
                  })
                }
              }
              HStack {
                Text(self.presenter.movie.overview)
                  .font(.caption)
                  .padding(.top, 3)
                  .lineLimit(8)
                  .foregroundColor(Color.gray.opacity(1))
                Spacer()
              }
            }.padding(.leading, 10)
          }
          Spacer()
        }
      }
    }
    .onAppear {
      self.presenter.getMovie()
    }.navigationBarHidden(true)
  }
}
