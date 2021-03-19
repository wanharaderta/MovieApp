//
//  CategoryView.swift
//  KBApp
//
//  Created by Wanhar on 17/03/21.
//

import SwiftUI

struct CategoryView: View {
  @Binding var showingCategoryView: Bool
  @EnvironmentObject var presenter: HomePresenter
  
  var body: some View {
    return VStack {
      HStack {
        Button(action: {
          self.showingCategoryView.toggle()
          presenter.getMovies(category: POPULAR_CATEGORY)
        }, label: {
          Text(POPULAR_CATEGORY)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
        }).padding()
        Spacer()
      }
      HStack {
        Button(action: {
          self.showingCategoryView.toggle()
          presenter.getMovies(category: TOP_RATED_CATEGORY)
        }, label: {
          Text(TOP_RATED_CATEGORY)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
        }).padding()
        Spacer()
      }
      HStack {
        Button(action: {
          self.showingCategoryView.toggle()
          presenter.getMovies(category: NOW_PLAYING_CATEGORY)
        }, label: {
          Text(NOW_PLAYING_CATEGORY)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
        }).padding()
        Spacer()
      }
    }
  }
}
