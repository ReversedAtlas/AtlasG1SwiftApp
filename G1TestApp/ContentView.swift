//
//  ContentView.swift
//  G1TestApp
//
//  Created by Atlas on 2/22/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @ObservedObject var bleManager = G1BLEManager()

    @State private var counter: UInt8 = 0
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 20) {
            Text("Connection Status:")
            Text(bleManager.connectionStatus)
                .font(.headline)
                .foregroundColor(.blue)

            Text("Counter: \(counter)")
                .font(.title)
            Button("Start Scan") {
                bleManager.startScan()
            }
        }
        .padding()
        .onAppear {
            // Schedule a timer that sends "Hello World #X" every second
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                let text = "Hello World \(counter)"
                bleManager.sendTextCommand(seq: counter, text: text)
                counter = counter &+ 1  // &+ does a wrapping add
            }
        }
        .onDisappear {
            // Invalidate the timer if view disappears
            timer?.invalidate()
        }
    }
}
