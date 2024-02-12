//
//  AudioManager.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 12/02/2024.
//

import AVFoundation

final class AudioManager {
  static let shared = AudioManager()

  private var player: AVPlayer?

  private var session = AVAudioSession.sharedInstance()

  private init() {}
    func startAudio() {
            
            // activate our session before playing audio
            activateSession()
            
        let url = Bundle.main.url(forResource: "click", withExtension: "mp3")

            let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
            if let player = player {
                player.replaceCurrentItem(with: playerItem)
            } else {
                player = AVPlayer(playerItem: playerItem)
            }
            
            if let player = player {
                player.play()
            }
        }
    private func activateSession() {
           do {
               try session.setCategory(
                   .playback,
                   mode: .default,
                   options: []
               )
           } catch _ {}
           
           do {
               try session.setActive(true, options: .notifyOthersOnDeactivation)
           } catch _ {}
           
           do {
               try session.overrideOutputAudioPort(.speaker)
           } catch _ {}
       }


}
