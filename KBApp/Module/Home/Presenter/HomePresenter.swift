//
//  HomePresenter.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let router = HomeRouter()
  private let homeUsecase: HomeUseCase
  
  @Published var movies: [MovieModel] = []
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  
  init(useCase: HomeUseCase) {
    self.homeUsecase = useCase
  }
  
  func getMovies(category: String) {
    isLoading = true
    homeUsecase.getMovies(category: category)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          print("errorMessage \(self.errorMessage)")
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
      destination: HomeRouter().makeDetailView(for: movie)
    ) { content() }
  }
  
  func linkBuilderFavorites<Content: View>(
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: HomeRouter().makeFavoriteView()
    ) { content() }
  }
}
