//
//  HomeRouter.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for movie: MovieModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(movie: movie)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
  func makeFavoriteView() -> some View {
    let favoriteUseCase = Injection.init().provideFavorite()
    let presenter = FavoritePresenter(useCase: favoriteUseCase)
    return FavoriteView(presenter: presenter)
  }
}
