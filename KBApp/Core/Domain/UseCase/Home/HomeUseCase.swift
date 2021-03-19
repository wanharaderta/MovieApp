//
//  HomeUseCase.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getMovies(category: String) -> AnyPublisher<[MovieModel], Error>
}
