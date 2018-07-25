//
//  Result.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
  case success(T)
  case failure(E)
}
