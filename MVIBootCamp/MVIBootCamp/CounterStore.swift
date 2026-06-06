//
//  ContentStore.swift
//  MVIBootCamp
//
//  Created by Siyaa Dahiya on 06/06/26.
//

import Foundation
import Combine

final class CounterStore: ObservableObject {
    @Published private(set) var state: CounterState

    private let reducer: (CounterState, CounterIntent) -> (CounterState, [Effect])
    private var effectCancellables: [UUID: Any] = [:] // optional reference tracking

    init(initialState: CounterState = CounterState(counter:  CounterModel()),
         reducer: @escaping (CounterState, CounterIntent) -> (CounterState, [Effect]) = counterReducer) {
        self.state = initialState
        self.reducer = reducer
    }

    func send(_ intent: CounterIntent) {
        let (newState, effects) = reducer(state, intent)
        
        DispatchQueue.main.async {
            self.state = newState
        }

        // Run side-effects
        for effect in effects {
            // effect.run should call back with more intents — ensure callbacks are captured weakly
            effect.run { [weak self] returnedIntent in
                DispatchQueue.main.async {
                    self?.send(returnedIntent)
                }
            }
        }
    }
}
