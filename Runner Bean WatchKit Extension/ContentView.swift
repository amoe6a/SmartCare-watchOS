//
//  ContentView.swift
//  Runner Bean WatchKit Extension
//
//  Created by Adrian Eves on 11/11/20.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject var healthManager = HealthManager()
    var body: some View {
        VStack {
            if healthManager.state == .inactive {
                VStack {
                    Text("SmartCare")
                    Button("Begin ECG monitoring") {
                        guard HKHealthStore.isHealthDataAvailable() else { return }
                        healthManager.start()
                    }
                }
            } else {
                WorkoutView(healthManager: healthManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
