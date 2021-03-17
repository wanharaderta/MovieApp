//
//  MovieMapper.swift
//  KBApp
//
//  Created by Wanhar on 17/03/21.
//

import Foundation

final class MovieMapper {
  
  static func mapMovieResponseToDomain(
    input movieResponse: [MovieResponse]
  ) -> [MovieModel] {
    return movieResponse.map { result in
      return MovieModel(
        id: String(describing: result.id),
        adult: result.adult ?? false,
        original_title: result.original_title ?? "",
        title: result.title ?? "",
        overview: result.overview ?? "",
        release_date: result.release_date ?? "",
        poster_path: result.poster_path ?? "")
    }
  }
  
}
