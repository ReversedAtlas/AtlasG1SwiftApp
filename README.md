# Atlas Even Reality G1 BLE iOS Sample

This repository demonstrates how to scan, connect, and send data to the Even G1 AR Glasses in iOS using CoreBluetooth. Because the Even G1 has two BLE peripherals (left and right arms), this sample includes logic to pair them together, discover their Nordic UART-like services, and issue commands (e.g., displaying text).

## Features

### Scanning & Auto-Pairing
- Scans for Even G1 devices whose names contain patterns like Even G1_20_L_<suffix> and Even G1_20_R_<suffix>.
- Automatically pairs the left (L) and right (R) devices when they share the same "channel number."
### Text Sending
- Demonstrates sending the 0x4E (text) command to display messages on the glasses’ lenses.
### SwiftUI or UIKit Integration
- The sample logic is written in a standalone G1BLEManager class that can be dropped into SwiftUI view