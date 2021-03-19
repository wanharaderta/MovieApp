//
//  FavoriteRouter.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import SwiftUI

class FavoriteRouter {
  func makeDetailView(for movie: MovieModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(movie: movie)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
}
