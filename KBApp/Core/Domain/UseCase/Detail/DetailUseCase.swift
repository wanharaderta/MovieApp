//
//  DetailUseCase.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import Combine

protocol DetailUseCase {
  
  func getMovie() -> MovieModel
  func getMovie() -> AnyPublisher<MovieModel, Error>
  func addFavorite() -> AnyPublisher<Bool, Error>
  func removeFavorite() -> AnyPublisher<Bool, Error>
}
