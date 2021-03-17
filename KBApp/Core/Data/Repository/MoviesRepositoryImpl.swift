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
      .map { MovieMapper.mapMovieResponseToDomain(input: $0) }
      .eraseToAnyPublisher()
  }
}
