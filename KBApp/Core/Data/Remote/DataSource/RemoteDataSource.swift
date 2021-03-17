//
//  RemoteDataSource.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

protocol RemoteDataSourceProtocol: class {
  
  func getMovies(category: String) -> AnyPublisher<[MovieResponse], Error>
  
}

final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  static let instance: RemoteDataSource =  RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  func getMovies(category: String) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      var endPoint = ""
      switch category {
      case POPULAR_CATEGORY:
        endPoint = Endpoints.Gets.popular.url
      case TOP_RATED_CATEGORY:
        endPoint = Endpoints.Gets.toprated.url
      case NOW_PLAYING_CATEGORY:
        endPoint = Endpoints.Gets.nowplaying.url
      default:
        endPoint = Endpoints.Gets.popular.url
      }
      guard let url = URL(string: endPoint) else { return }
      let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
        if maybeError != nil {
          completion(.failure(URLError.addressUnreachable(url)))
        } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
          let decoder = JSONDecoder()
          do {
            let value = try decoder.decode(MoviesResponse.self, from: data)
            completion(.success(value.movies))
          } catch {
            completion(.failure(URLError.invalidResponse))
          }
        }
      }
      task.resume()
    }.eraseToAnyPublisher()
  }
}
