//
//  FavoritePresenter.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import Foundation
import Combine
import SwiftUI

class FavoritePresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let router = FavoriteRouter()
  private let useCase: FavoriteUseCase
  
  @Published var movies: [MovieModel] = []
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  
  init(useCase: FavoriteUseCase) {
    self.useCase = useCase
  }
  
  func getFavorites() {
    isLoading = true
    useCase.getFavoritesMovies()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { movies in
        self.movies = movies
      }).store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>(
    for movie: MovieModel,
      @ViewBuilder content: () -> Content
  ) -> some View {
      
      NavigationLink(
        destination: FavoriteRouter().makeDetailView(for: movie)
      ) { content() }
  }

}
