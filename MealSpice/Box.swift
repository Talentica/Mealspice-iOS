//
//  Box.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 25/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

class Box<T> {
  
  typealias Listener = (T) -> Void
  var listener: Listener?
  
  var value: T {
    didSet {
      // Notify listener
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
}
