//
//  ContentView.swift
//  JailedCement
//
//  Created by Hariz Shirazi on 2023-01-23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "king_laughter_01", ofType: "m4a")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("unfinifehed app rlol")
            
            Button(action: {
                print("Goodbye World")
                // Heard somewhere this could bootloop
                plistChange(plistPath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.mobilegestaltcache/Library/Caches/com.apple.MobileGestalt.plist", key: "ArtworkDeviceSubType", value: 69420)
            }, label: {Text("Bootlooping time")})
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

// MARK: - plist editing function
func plistChange(plistPath: String, key: String, value: Int) {
let stringsData = try! Data(contentsOf: URL(fileURLWithPath: plistPath))

let plist = try! PropertyListSerialization.propertyList(from: stringsData, options: [], format: nil) as! [String: Any]
func changeValue(_ dict: [String: Any], _ key: String, _ value: Int) -> [String: Any] {
    var newDict = dict
    for (k, v) in dict {
        if k == key {
            newDict[k] = value
        } else if let subDict = v as? [String: Any] {
            newDict[k] = changeValue(subDict, key, value)
        }
    }
    return newDict
}

var newPlist = plist
newPlist = changeValue(newPlist, key, value)

let newData = try! PropertyListSerialization.data(fromPropertyList: newPlist, format: .binary, options: 0)

overwriteFile(newData, plistPath)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
