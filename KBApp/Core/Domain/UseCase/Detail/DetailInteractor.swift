//
//  DetailInteractor.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import Foundation
import Combine

class DetailInteractor: DetailUseCase {

  private let repository: MoviesRepository
  private let movie: MovieModel
  
  required init(repository: MoviesRepository, movie: MovieModel) {
    self.repository = repository
    self.movie = movie
  }
  
  func getMovie() -> MovieModel {
    return movie
  }
  
  func getMovie() -> AnyPublisher<MovieModel, Error> {
    return repository.getMovie(by: movie.id)
  }
  
  func addFavorite() -> AnyPublisher<Bool, Error> {
    return repository.addFavorite(from: movie)
  }

  func removeFavorite() -> AnyPublisher<Bool, Error> {
    return repository.removeFavorite(from: movie)
  }
  
  func getFavoritesMovies() -> AnyPublisher<[MovieModel], Error> {
    return repository.getFavoriteMovies()
  }
}
