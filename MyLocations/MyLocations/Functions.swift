//
//  Functions.swift
//  MyLocations
//
//  Created by Grey on 9/9/23.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
