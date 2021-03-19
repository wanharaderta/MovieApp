//
//  MovieRow.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieRow: View {
  
  var item: MovieModel
  var body: some View {
    HStack {
      WebImage(url: URL(string: item.poster_path))
        .resizable()
        .placeholder(Image(systemName: "photo"))
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .cornerRadius(10)
        .scaleEffect()
        .frame(width: 120, height: 100)
      VStack {
        HStack {
          Text(item.title)
            .font(.system(size: 15))
            .foregroundColor(.black)
            .bold()
            .lineLimit(1)
          Spacer()
        }
        
        Text(item.overview)
          .font(.caption)
          .lineLimit(2)
          .padding(.top, 3)
          .foregroundColor(Color.gray.opacity(1))
      }.padding(.leading, 10)
    }.padding([.top, .bottom], 5)
  }
}
