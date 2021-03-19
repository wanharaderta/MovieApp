//
//  MovieMapper.swift
//  KBApp
//
//  Created by Wanhar on 17/03/21.
//

import Foundation
import CoreData

final class MovieMapper {
  
  static func mapMoviesResponseToDomain(
    input movieResponse: [MovieResponse]
  ) -> [MovieModel] {
    return movieResponse.map { result in
      return MovieModel(
        id: "\(String(describing: result.id))",
        adult: result.adult ?? false,
        original_title: result.original_title ?? "",
        title: result.title ?? "",
        overview: result.overview ?? "",
        release_date: result.release_date ?? "",
        poster_path: result.poster_path ?? "")
    }
  }
  
  static func mapMovieResponseToDomain(
    input movieResponse: MovieResponse
  ) -> MovieModel {
    return MovieModel(
      id: "\(String(describing: movieResponse.id))",
      adult: movieResponse.adult ?? false,
      original_title: movieResponse.original_title ?? "",
      title: movieResponse.title ?? "",
      overview: movieResponse.overview ?? "",
      release_date: movieResponse.release_date ?? "",
      poster_path: movieResponse.poster_path ?? "",
      favorite: false)
  }
  
  static func mapMoviesEntitiesToDomain(
    input moviesEntities: [MovieEntity]
  ) -> [MovieModel] {
    return moviesEntities.map { result in
      MovieModel(
        id: "\(String(describing: result.id))",
        adult: result.adult,
        original_title: result.original_title ,
        title: result.title,
        overview: result.overview ,
        release_date: result.release_date,
        poster_path: result.poster_path,
        favorite: true)
    }
  }
  
  static func mapMovieEntityToDomain(
    input moviesEntity: MovieEntity
  ) -> MovieModel {
    return MovieModel(
      id: "\(String(describing: moviesEntity.id))",
      adult: moviesEntity.adult,
      original_title: moviesEntity.original_title ,
      title: moviesEntity.title ,
      overview: moviesEntity.overview ,
      release_date: moviesEntity.release_date ,
      poster_path: moviesEntity.poster_path ,
      favorite: true)
  }
  
  static func mapMovieDomainToEntity(
    input movie: MovieModel
  ) -> MovieEntity {
    return MovieEntity(
      id: movie.id,
      adult: movie.adult,
      original_title: movie.original_title,
      title: movie.title,
      overview: movie.overview,
      release_date: movie.release_date,
      poster_path:  movie.poster_path)
  }
  
  static func mapTablesToEntities(
    input tables: [MovieEntities]
  ) -> [MovieEntity] {
    return tables.map { result in
      return MovieEntity(
        id: result.id ?? "",
        adult: result.adult,
        original_title: result.original_title ?? "",
        title: result.title ?? "",
        overview: result.overview ?? "",
        release_date: result.release_date ?? "",
        poster_path:  result.poster_path ?? "",
        favorite: true)
    }
  }
  
  static func mapTableToEntity(
    input table: MovieEntities
  ) -> MovieEntity {
    return MovieEntity(
      id: table.id ?? "",
      adult: table.adult,
      original_title: table.original_title ?? "",
      title: table.title ?? "",
      overview: table.overview ?? "",
      release_date: table.release_date ?? "",
      poster_path:  table.poster_path ?? "",
      favorite: true)
  }
  
}
