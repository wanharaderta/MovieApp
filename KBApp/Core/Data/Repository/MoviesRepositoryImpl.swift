//
//  MoviesRepositoryImpl.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

final class MoviesRepositoryImpl: NSObject {
  typealias MoviesInstance = (RemoteDataSource, LocaleDataSource) -> MoviesRepositoryImpl
  
  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocaleDataSource
  
  private init(remote: RemoteDataSource, locale: LocaleDataSource) {
    self.remote = remote
    self.locale = locale
  }
  static let instance: MoviesInstance = { remoteRepositoy, localeRepository in
    return MoviesRepositoryImpl(remote: remoteRepositoy, locale: localeRepository)
  }
}

extension MoviesRepositoryImpl: MoviesRepository {
  
  func getMovies(category: String) -> AnyPublisher<[MovieModel], Error> {
    return self.remote.getMovies(category: category)
      .map { MovieMapper.mapMoviesResponseToDomain(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovie(by movieId: String) -> AnyPublisher<MovieModel, Error> {
    return self.locale.getMovie(by: movieId)
      .flatMap { result -> AnyPublisher<MovieModel, Error> in
        if result != nil {
          return self.locale.getMovie(by: movieId)
            .map { MovieMapper.mapMovieEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
        } else {
          return self.remote.getMovie(by: movieId)
            .map { MovieMapper.mapMovieResponseToDomain(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
  func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
    return self.locale.getFavoriteMovies()
      .map { MovieMapper.mapMoviesEntitiesToDomain(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func addFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error> {
    let movieEntity = MovieMapper.mapMovieDomainToEntity(input: movie)
    return self.locale.addFavorite(from: movieEntity)
      .eraseToAnyPublisher()
    
  }
  
  func removeFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error> {
    let movieEntity = MovieMapper.mapMovieDomainToEntity(input: movie)
    return self.locale.removeFavorite(from: movieEntity)
      .eraseToAnyPublisher()
  }
}
