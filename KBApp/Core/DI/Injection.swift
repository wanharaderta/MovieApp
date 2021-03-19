//
//  Injection.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import CoreData

final class Injection: NSObject {
  
  private func provideRepository() -> MoviesRepository {
    let db : NSManagedObjectContext = NSManagedObjectContext.current
    let remote: RemoteDataSource = RemoteDataSource.instance
    let locale: LocaleDataSource = LocaleDataSource.instance(db)
    return MoviesRepositoryImpl.instance(remote, locale)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
  
  func provideFavorite() -> FavoriteUseCase {
    let repository = provideRepository()
    return FavoriteInteractor(repository: repository)
  }

  func provideDetail(movie: MovieModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, movie: movie)
  }
  
}
