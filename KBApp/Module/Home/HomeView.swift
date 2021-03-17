//
//  HomeView.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject var presenter: HomePresenter
  @State private var showingCategoryView = false
  @State private var categorySelected = ""
  
  @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
  var body: some View {
    return ZStack(alignment: .bottom) {
      VStack {
        HStack {
          Text("Movie App")
            .font(.body)
            .foregroundColor(.white)
          
          Spacer(minLength: 0)
          Button(action: {}, label: {
            Image(systemName: "suit.heart.fill")
              .resizable()
              .renderingMode(.original)
              .frame(width: 24, height: 24)
            
          })
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
                      MovieRow(item: item)
                    }
                  }.padding(.bottom, 120)
                }
              }
              .padding(.top, 15)
            }.onAppear {
              if self.presenter.movies.count == 0 {
                self.presenter.getMovies(category: POPULAR_CATEGORY)
              }
            }
          }.padding()
        })
      }
      
      HStack {
        Spacer()
        Button(action: {
          self.showingCategoryView.toggle()
        }){
          Text("Category")
            .font(.title2)
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
        }
        Spacer()
      }.background(Color.blue)
      
      VStack {
        CategoryView(showingCategoryView: self.$showingCategoryView, presenter: self._presenter)
          .padding(.bottom, 10)
          .padding(.bottom, edges?.bottom)
          .padding(.top, 10)
          .offset(y: showingCategoryView ? 0 : UIScreen.main.bounds.height / 2)
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
      }.ignoresSafeArea()
      .background(Color.white.ignoresSafeArea()
                    .opacity(showingCategoryView ? 1 : 0)
                    .onTapGesture(perform: {
                      withAnimation { self.showingCategoryView.toggle() }
                    })
                    .shadow(color: Color.black, radius: 10, x: 0, y: 0))
      
      
    }.edgesIgnoringSafeArea(.bottom)
  }
}
