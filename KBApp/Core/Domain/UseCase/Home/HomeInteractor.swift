//
//  HomeInteractor.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

class HomeInteractor: HomeUseCase {
  
  private let repository: MoviesRepository

  required init(repository: MoviesRepository) {
    self.repository = repository
  }

  func getMovies(category: String) -> AnyPublisher<[MovieModel], Error> {
    return repository.getMovies(category: category)
  }
}
