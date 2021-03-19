//
//  MovieEntity.swift
//  KBApp
//
//  Created by Wanhar on 19/03/21.
//

import Foundation

struct MovieEntity {
  
  let id: String
  let adult: Bool
  let original_title: String
  let title: String
  let overview: String
  let release_date: String
  let poster_path: String
  var favorite: Bool = false
}
