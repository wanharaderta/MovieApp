//
//  LocaleDataSource.swift
//  KBApp
//
//  Created by Wanhar on 17/03/21.
//

import Foundation
import CoreData

protocol LocaleDataSourceProtocol {
  
 // func getFavoriteMovies() -> AnyPublisher<[ArticleEntity], Error>
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
