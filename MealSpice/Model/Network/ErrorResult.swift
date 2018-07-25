//
//  ErrorResult.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
  case network(string: String)
  case custom(string: String)
}
