//
//  MoviesRepository.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation
import Combine

protocol MoviesRepository: class {
  func getMovies(category: String) -> AnyPublisher<[MovieModel], Error>
//  func getFavoriteArticles() -> AnyPublisher<[ArticleModel], Error>
//  func getArticle(by title: String) -> AnyPublisher<ArticleModel, Error>
//  func addFavoriteArticle(from article: ArticleModel) -> AnyPublisher<Bool, Error>
//  func removeFavoriteArticle(from article: ArticleModel) -> AnyPublisher<Bool, Error>
}
