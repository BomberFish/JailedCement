//
//  ContentView.swift
//  JailedCement
//
//  Created by Hariz Shirazi on 2023-01-23.
//

import SwiftUI
import AVKit
import Foundation

struct ContentView: View {
    @State var audioPlayer = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "king_laughter_01", ofType: "m4a")
    var body: some View {
        VStack {
            Button(action: {brick()}, label: {Text("Bootlooping time")})
            .controlSize(.large)
            .tint(.accentColor)
            .buttonStyle(.bordered)
            
            Button(action: {
                let url = URL(fileURLWithPath: self.path!)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }catch {
                    print("error!!1")
                }
            }, label: {Text("heheheha button")})
            .controlSize(.large)
            .tint(Color(UIColor.blue))
            .buttonStyle(.bordered)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
