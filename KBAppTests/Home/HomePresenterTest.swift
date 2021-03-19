//
//  HomePresenterTest.swift
//  KBAppTests
//
//  Created by Wanhar on 19/03/21.
//

import Combine
import XCTest
@testable import KBApp

class HomePresenterTest: XCTestCase {
  
  private var presenter: HomePresenter
  private let homeUsecase: HomeUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  override func setUp() {
    cancellables = []
//    homeUseCase = Injection.init().provideHome()
//    presenter = HomePresenter(useCase: homeUseCase)
  }
  
  func testGetList() {
    
  }
  
}
