//
//  ContentIntent.swift
//  MVIBootCamp
//
//  Created by Siyaa Dahiya on 06/06/26.
//

import Foundation

enum CounterIntent {
    case increment
    case decrement
    case reset
    case incrementAfterDelay(seconds: TimeInterval) // demonstrates effects
    case didFinishIncrement // action from an effect
}
