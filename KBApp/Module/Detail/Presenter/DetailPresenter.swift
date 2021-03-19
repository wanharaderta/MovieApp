//
//  DetailPresenter.swift
//  KBApp
//
//  Created by Wanhar on 18/03/21.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let detailUseCase: DetailUseCase
  
  @Published var movie: MovieModel
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    movie = detailUseCase.getMovie()
  }
  
  func getMovie() {
    isLoading = true
    detailUseCase.getMovie()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { movie in
        self.movie = movie
      })
      .store(in: &cancellables)
  }
  
  func unFavorite() {
    detailUseCase.removeFavorite()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { value in
        self.movie.favorite = value
      })
      .store(in: &cancellables)
  }
  
  func addFavorite() {
    detailUseCase.addFavorite()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { value in
        self.movie.favorite = value
      })
      .store(in: &cancellables)
  }
  
}
