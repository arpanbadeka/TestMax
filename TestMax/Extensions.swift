//
//  Extensions.swift
//  Quiz Masters
//
//  Created by J. Ruof, Meruca on 08/09/15.
//  Copyright (c) 2015 RuMe Academy. All rights reserved.
//
//
import Foundation

extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}