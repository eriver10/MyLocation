//
//  String+AddText.swift
//  MyLocations
//
//  Created by Grey on 9/17/23.
//

import Foundation

extension String {
    
  mutating func add(text: String?, separatedBy separator: String =
    "") {
    
    if let text = text {
      if !isEmpty {
        self += separator
      }
        self += text
      }
  }
    
}
