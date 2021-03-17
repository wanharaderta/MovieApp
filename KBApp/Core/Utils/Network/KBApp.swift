//
//  KBApp.swift
//  KBApp
//
//  Created by Wanhar on 16/03/21.
//

import Foundation

struct API {
  static let baseUrl = "https://api.themoviedb.org/3/movie/"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  enum Gets: Endpoint {
    case popular
    case toprated
    case nowplaying
    public var url: String {
      switch self {
      case .popular: return "\(API.baseUrl)popular?api_key=b6b2e1c77a864e7f168e6675617b0c74"
      case .toprated: return "\(API.baseUrl)top_rated?api_key=b6b2e1c77a864e7f168e6675617b0c74"
      case .nowplaying: return "\(API.baseUrl)now_playing?api_key=b6b2e1c77a864e7f168e6675617b0c74"
      }
    }
  }
}
