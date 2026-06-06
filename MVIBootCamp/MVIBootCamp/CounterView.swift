//
//  ContentView.swift
//  MVIBootCamp
//
//  Created by Siyaa Dahiya on 06/06/26.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var store: CounterStore

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(store.state.counter.count)")
                .font(.largeTitle)

            if store.state.isLoading {
                ProgressView()
            }

            HStack {
                Button("-") {
                    store.send(.decrement)
                }
                Button("Reset") {
                    store.send(.reset)
                }
                Button("+") {
                    store.send(.increment)
                }
            }

            Button("Increment after 2s") {
                store.send(.incrementAfterDelay(seconds: 2))
            }
        }
        .padding()
    }
}


