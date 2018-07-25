//
//  GenericDataSource.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
  var data: Box<[T]> = Box([])
}
