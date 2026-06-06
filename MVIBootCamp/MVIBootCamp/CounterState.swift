//
//  CounterState.swift
//  MVIBootCamp
//
//  Created by Siyaa Dahiya on 06/06/26.
//


import Foundation

struct CounterModel: Equatable {
    var count: Int = 0
}

struct CounterState: Equatable {
    var counter: CounterModel
    var isLoading: Bool = false // example of UI flag
}
