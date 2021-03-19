//
//  MoviesRepository.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

protocol MoviesRepository: class {
  func getMovies(category: String) -> AnyPublisher<[MovieModel], Error>
  func getMovie(by movieId: String) -> AnyPublisher<MovieModel, Error>
  func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
  func addFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error>
  func removeFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error>
}
