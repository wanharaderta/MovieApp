//
//  MovieModel.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation

struct MovieModel: Equatable, Identifiable {
  
  let id: String
  let adult: Bool
  let original_title: String
  let title: String
  let overview: String
  let release_date: String
  let poster_path: String
}
