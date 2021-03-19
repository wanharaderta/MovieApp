//
//  LocaleDataSource.swift
//  KBApp
//
//  Created by Wanhar on 17/03/21.
//

import CoreData
import Combine

protocol LocaleDataSourceProtocol {
  
  func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error>
  func getMovie(by movieId: String) -> AnyPublisher<MovieEntity, Error>
  func addFavorite(from  movie: MovieEntity) -> AnyPublisher<Bool, Error>
  func removeFavorite(from  movie: MovieEntity) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
  
  var db : NSManagedObjectContext?
  
  private init(db : NSManagedObjectContext?) {
    self.db = db
  }
  
  static let instance: (NSManagedObjectContext?) -> LocaleDataSource = { dbLocal in
    return LocaleDataSource(db: dbLocal)
  }
}

extension LocaleDataSource: LocaleDataSourceProtocol {

  func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error> {
    return Future<[MovieEntity], Error> { completion in
      let request : NSFetchRequest<MovieEntities>  = MovieEntities.fetchRequest()
      do {
        guard let moviesEntities = try self.db?.fetch(request) else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        let movies = MovieMapper.mapTablesToEntities(input: moviesEntities)
        completion(.success(movies))
      } catch {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func getMovie(by movieId: String) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      let request : NSFetchRequest<MovieEntities>  = MovieEntities.fetchRequest()
      request.predicate    = NSPredicate(format: "id == %@", movieId)
      do {
        guard let movie = try self.db?.fetch(request).first else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        let movieMapper = MovieMapper.mapTableToEntity(input: movie)
        completion(.success(movieMapper))
      } catch {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func addFavorite(from movie: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      let movieTable   = MovieEntities(context: self.db!)
      movieTable.id = movie.id
      movieTable.adult = movie.adult
      movieTable.original_title = movie.original_title
      movieTable.title = movie.title
      movieTable.overview = movie.overview
      movieTable.release_date = movie.release_date
      movieTable.poster_path = movie.poster_path
      do {
        try self.db?.save()
        completion(.success(true))
      } catch {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func removeFavorite(from movie: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      let request : NSFetchRequest<MovieEntities>  = MovieEntities.fetchRequest()
      request.predicate    = NSPredicate(format: "id == %@", movie.id)
      do {
        guard let movie = try self.db?.fetch(request).first else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        self.db?.delete(movie)
        try self.db?.save()
        completion(.success(false))
      } catch {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
}
