//
//  MVIBootCampApp.swift
//  MVIBootCamp
//
//  Created by Siyaa Dahiya on 06/06/26.
//

import SwiftUI

@main
struct MVIBootCampApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(store: CounterStore.init(initialState: .init()))
        }
    }
}
