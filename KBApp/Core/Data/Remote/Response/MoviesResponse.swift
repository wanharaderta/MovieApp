//
//  MoviesResponse.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation

struct MoviesResponse: Decodable {
  
  let movies: [MovieResponse]
  private enum CodingKeys: String, CodingKey {
    case movies = "results"
  }
}

struct MovieResponse: Decodable {
  let id:                 Int?
  let adult:              Bool?
  let backdrop_path:      String?
  let original_title:     String?
  let overview:           String?
  let popularity:         Double?
  let poster_path:        String?
  let title:              String?
  let release_date:       String?
  let original_language:  String?
  private enum CodingKeys: String, CodingKey {
    case id
    case adult
    case title
    case backdrop_path
    case original_title
    case overview
    case popularity
    case poster_path
    case release_date
    case original_language
  }
}


