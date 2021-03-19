//
//  FavoriteInteractor.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import Combine

class FavoriteInteractor: FavoriteUseCase {
  
  private let repository: MoviesRepository
  
  required init(repository: MoviesRepository) {
    self.repository = repository
  }
  
  func getFavoritesMovies() -> AnyPublisher<[MovieModel], Error> {
    return repository.getFavoriteMovies()
  }
}
