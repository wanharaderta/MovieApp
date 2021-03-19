//
//  FavoriteUseCase.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import Combine

protocol FavoriteUseCase {
  
  func getFavoritesMovies() -> AnyPublisher<[MovieModel], Error>
  
}
