//
//  Utils.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 09/03/2023.
//

import Foundation
struct SongChord {
    var note: Int
    let tension: Int
    let bar: Int
    let beat: Int
}
public class Utils{
    
   

    let aintSheSweet: [SongChord] = [
        SongChord(note: 0, tension: -1, bar: 0, beat: 0),    // C in bar 0, beat 0
        SongChord(note: 1, tension: 10, bar: 1, beat: 0),    // G7 in bar 1, beat 0
        SongChord(note: 0, tension: -1, bar: 2, beat: 0),    // C in bar 2, beat 0
        SongChord(note: 1, tension: 10, bar: 2, beat: 1),    // G7 in bar 2, beat 1
        SongChord(note: 0, tension: -1, bar: 2, beat: 2),    // C in bar 2, beat 2
        SongChord(note: 1, tension: 10, bar: 2, beat: 3),    // G7 in bar 2, beat 3
        SongChord(note: 0, tension: -1, bar: 3, beat: 0),    // C in bar 3, beat 0
        SongChord(note: 9, tension: -1, bar: 4, beat: 0),    // Am in bar 4, beat 0
        SongChord(note: 4, tension: -1, bar: 5, beat: 0),    // E7 in bar 5, beat 0
        SongChord(note: 9, tension: 7, bar: 6, beat: 0),     // Am(b9) in bar 6, beat 0
        SongChord(note: 9, tension: -1, bar: 7, beat: 0),    // Am in bar 7, beat 0
        SongChord(note: 1, tension: 5, bar: 8, beat: 0),     // G7 in bar 8, beat 0
        SongChord(note: 0, tension: -1, bar: 9, beat: 0),    // C in bar 9, beat 0
        SongChord(note: 9, tension: 5, bar: 10, beat: 0),    // Am7 in bar 10, beat 0
        SongChord(note: 1, tension: -1, bar: 11, beat: 0),   // G/F in bar 11, beat 0
        SongChord(note: 1, tension: 10, bar: 12, beat: 0),   // G7 in bar 12, beat 0
        SongChord(note: 0, tension: -1, bar: 13, beat: 0),   // C in bar 13, beat 0
        SongChord(note: 5, tension: -1, bar: 14, beat: 0),   // Em in bar 14, beat 0
        SongChord(note: 9, tension: -1, bar: 15, beat: 0),   // Am in bar 15, beat 0
        SongChord(note: 2, tension: 5, bar: 16, beat: 0),    // D7 in bar 16, beat 0
        SongChord(note: 1, tension: 10, bar: 17, beat: 0),   // G7 in bar 17, beat 0
        SongChord(note: 0, tension: -1, bar: 18, beat: 0),   // C in bar 18, beat 0
        SongChord(note: 3, tension: -1, bar: 19, beat: 0),   // A° in bar 19, beat 0
        SongChord(note: 1, tension: 10, bar: 20, beat: 0),   // G7 in bar 20, beat 0
        SongChord(note: 0, tension: -1, bar: 21, beat: 0),   // C in bar 21, beat 0
        SongChord(note: 4, tension: 5, bar: 22, beat: 0),    // E7 in bar 22, beat 0
        SongChord(note: 9, tension: 5, bar: 23, beat: 0),    // Am7 in bar 23, beat 0
        SongChord(note: 2, tension: 5, bar: 24, beat: 0),    // D7 in bar 24, beat 0
        SongChord(note: 1, tension: 10, bar: 25, beat: 0),   // G7 in bar 25, beat 0
        SongChord(note: 0, tension: -1, bar: 26, beat: 0),   // C in bar 26, beat 0
        SongChord(note: 1, tension: 10, bar: 27, beat: 0),   // G7 in bar 27, beat 0
        SongChord(note: 0, tension: -1, bar: 28, beat: 0),   // C in bar 28, beat 0
        SongChord(note: 3, tension: -1, bar: 29, beat: 0),   // A° in bar 29, beat 0
        SongChord(note: 1, tension: 10, bar: 30, beat: 0),   // G7 in bar 30, beat 0
        SongChord(note: 0, tension: -1, bar: 31, beat: 0),   // C in bar 31, beat 0
        SongChord(note: 4, tension: 5, bar: 32, beat: 0),    // E7 in bar 32, beat 0
        SongChord(note: 9, tension: 5, bar: 33, beat: 0),    // Am7 in bar 33, beat 0
        SongChord(note: 2, tension: 5, bar: 34, beat: 0),    // D7 in bar 34, beat 0
        SongChord(note: 1, tension: 0, bar: 35, beat: 0),    // G7 in bar 35, beat 0
        SongChord(note: 0, tension: -1, bar: 36, beat: 0),   // C in bar 36, beat 0
        SongChord(note: 5, tension: 10, bar: 37, beat: 0),   // F7 in bar 37, beat 0
        SongChord(note: 5, tension: 10, bar: 38, beat: 0),   // F7 in bar 38, beat 0
        SongChord(note: 0, tension: -1, bar: 39, beat: 0),   // C in bar 39, beat 0
        SongChord(note: 0, tension: 10, bar: 40, beat: 0),   // C7 in bar 40, beat 0
        SongChord(note: 5, tension: 10, bar: 41, beat: 0),   // F7 in bar 41, beat 0
        SongChord(note: 5, tension: 10, bar: 42, beat: 0),   // F7 in bar 42, beat 0
        SongChord(note: 0, tension: -1, bar: 43, beat: 0),   // C in bar 43, beat 0
        SongChord(note: 3, tension: -1, bar: 44, beat: 0),   // A° in bar 44, beat 0
        SongChord(note: 1, tension: 10, bar: 45, beat: 0),   // G7 in bar 45, beat 0
        SongChord(note: 0, tension: -1, bar: 46, beat: 0),   // C in bar 46, beat 0
        SongChord(note: 3, tension: -1, bar: 47, beat: 0),   // A° in bar 47, beat 0
        SongChord(note: 1, tension: 10, bar: 48, beat: 0),   // G7 in bar 48, beat 0
        SongChord(note: 0, tension: -1, bar: 49, beat: 0)    // C in bar 49, beat 0
    ]
    let aliceBlueGown: [SongChord] = [
        SongChord(note: 0, tension: 0, bar: 0, beat: 0),    // C in bar 0, beat 0
        SongChord(note: 0, tension: 0, bar: 1, beat: 0),    // C6 in bar 1, beat 0
        SongChord(note: 10, tension: 5, bar: 1, beat: 1),   // Dm7 in bar 1, beat 1
        SongChord(note: 2, tension: 5, bar: 1, beat: 2),    // G7 in bar 1, beat 2
        SongChord(note: 0, tension: 0, bar: 2, beat: 0),    // C in bar 2, beat 0
        SongChord(note: 0, tension: 0, bar: 2, beat: 1),    // C6 in bar 2, beat 1
        SongChord(note: 0, tension: 0, bar: 2, beat: 2),    // C in bar 2, beat 2
        SongChord(note: 10, tension: 5, bar: 3, beat: 0),   // Dm7 in bar 3, beat 0
        SongChord(note: 2, tension: 5, bar: 3, beat: 1),    // G7 in bar 3, beat 1
        SongChord(note: 0, tension: 0, bar: 4, beat: 0),    // C in bar 4, beat 0
        SongChord(note: 10, tension: 5, bar: 5, beat: 0),   // Dm in bar 5, beat 0
        SongChord(note: 2, tension: 5, bar: 5, beat: 1),    // G7 in bar 5, beat 1
        SongChord(note: 0, tension: 0, bar: 6, beat: 0),    // C in bar 6, beat 0
        SongChord(note: 0, tension: 0, bar: 7, beat: 0),    // C6 in bar 7, beat 0
        SongChord(note: 5, tension: 5, bar: 8, beat: 0),    // F in bar 8, beat 0
        SongChord(note: 0, tension: 0, bar: 9, beat: 0),    // C in bar 9, beat 0
        SongChord(note: 2, tension: 5, bar: 9, beat: 1),    // G7 in bar 9, beat 1
        SongChord(note: 9, tension: 5, bar: 10, beat: 0),   // Em in bar 10, beat 0
        SongChord(note: 2, tension: 5, bar: 10, beat: 1),   // G7 in bar 10, beat 1
        SongChord(note: 0, tension: 0, bar: 11, beat: 0),   // C in bar 11, beat 0
        SongChord(note: 7, tension: 0, bar: 11, beat: 1),   // E7 in bar 11, beat 1
        SongChord(note: 9, tension: 0, bar: 12, beat: 0),   // Am in bar 12, beat 0
        SongChord(note: 0, tension: 0, bar: 13, beat: 0),   // C in bar 13, beat 0
        SongChord(note: 5, tension: 5, bar: 14, beat: 0),   // F in bar 14, beat 0
        SongChord(note: 0, tension: 0, bar: 14, beat: 1),   // C in bar 14, beat 1
        SongChord(note: 2, tension: 5, bar: 15, beat: 0),   // G7 in bar 15, beat 0
        SongChord(note: 0, tension: 0, bar: 15, beat: 1),   // C in bar 15, beat 1
        SongChord(note: 5, tension: 5, bar: 16, beat: 0),   // F in bar 16, beat 0
        SongChord(note: 0, tension: 0, bar: 17, beat: 0),   // C in bar 17, beat 0
        SongChord(note: 7, tension: 0, bar: 18, beat: 0),   // E7 in bar 18, beat 0
        SongChord(note: 9, tension: 0, bar: 19, beat: 0),   // Am in bar 19, beat 0
        SongChord(note: 7, tension: 0, bar: 20, beat: 0),   // E7 in bar 20, beat 0
        SongChord(note: 2, tension: 5, bar: 21, beat: 0),   // G7 in bar 21, beat 0
        SongChord(note: 0, tension: 0, bar: 22, beat: 0),   // C in bar 22, beat 0
        SongChord(note: 5, tension: 5, bar: 23, beat: 0),   // F in bar 23, beat 0
        SongChord(note: 0, tension: 0, bar: 24, beat: 0),   // C in bar 24, beat 0
        SongChord(note: 0, tension: 0, bar: 25, beat: 0),   // C6 in bar 25, beat 0
        SongChord(note: 2, tension: 5, bar: 25, beat: 1),   // G7 in bar 25, beat 1
        SongChord(note: 0, tension: 0, bar: 26, beat: 0),   // C in bar 26, beat 0
        SongChord(note: 10, tension: 5, bar: 27, beat: 0),  // Dm7 in bar 27, beat 0
        SongChord(note: 5, tension: 5, bar: 28, beat: 0),   // F in bar 28, beat 0
        SongChord(note: 0, tension: 0, bar: 29, beat: 0),   // C in bar 29, beat 0
        SongChord(note: 5, tension: 5, bar: 30, beat: 0),   // F in bar 30, beat 0
        SongChord(note: 2, tension: 5, bar: 30, beat: 1),   // G7 in bar 30, beat 1
        SongChord(note: 0, tension: 0, bar: 31, beat: 0),   // C in bar 31, beat 0
        SongChord(note: 5, tension: 5, bar: 32, beat: 0),   // F in bar 32, beat 0
        SongChord(note: 2, tension: 5, bar: 33, beat: 0),   // G7 in bar 33, beat 0
        SongChord(note: 7, tension: 0, bar: 34, beat: 0),   // E7 in bar 34, beat 0
        SongChord(note: 0, tension: 0, bar: 35, beat: 0),   // C in bar 35, beat 0
        SongChord(note: 5, tension: 5, bar: 36, beat: 0),   // F in bar 36, beat 0
        SongChord(note: 2, tension: 5, bar: 36, beat: 1),   // G7 in bar 36, beat 1
        SongChord(note: 0, tension: 0, bar: 37, beat: 0),   // C in bar 37, beat 0
        SongChord(note: 5, tension: 5, bar: 38, beat: 0),   // F in bar 38, beat 0
        SongChord(note: 0, tension: 0, bar: 39, beat: 0),   // C in bar 39, beat 0
        SongChord(note: 0, tension: 0, bar: 40, beat: 0),   // C in bar 40, beat 0
        SongChord(note: 5, tension: 5, bar: 41, beat: 0),   // F in bar 41, beat 0
        SongChord(note: 0, tension: 0, bar: 42, beat: 0),   // C in bar 42, beat 0
        SongChord(note: 10, tension: 5, bar: 43, beat: 0),  // Dm7 in bar 43, beat 0
        SongChord(note: 7, tension: 0, bar: 44, beat: 0),   // E7 in bar 44, beat 0
        SongChord(note: 0, tension: 0, bar: 45, beat: 0),   // C in bar 45, beat 0
        SongChord(note: 0, tension: 0, bar: 46, beat: 0),   // C in bar 46, beat 0
        SongChord(note: 2, tension: 5, bar: 47, beat: 0),   // G7 in bar 47, beat 0
        SongChord(note: 0, tension: 0, bar: 48, beat: 0)    // C in bar 48, beat 0
    ]
    let aprilShowers: [SongChord] = [
        // Page 1
        SongChord(note: 7, tension: 5, bar: 0, beat: 0),    // G7 in bar 0, beat 0 (transposed from D7)
        SongChord(note: 3, tension: 5, bar: 0, beat: 1),    // E in bar 0, beat 1 (transposed from C)
        SongChord(note: 0, tension: 5, bar: 0, beat: 2),    // C in bar 0, beat 2 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 1, beat: 0),    // A in bar 1, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 1, beat: 1),    // G7 in bar 1, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 1, beat: 2),    // G7 in bar 1, beat 2 (transposed from D7)
        SongChord(note: 9, tension: 0, bar: 2, beat: 0),    // A in bar 2, beat 0 (transposed from E)
        SongChord(note: 0, tension: 0, bar: 2, beat: 1),    // C in bar 2, beat 1 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 2, beat: 2),    // Bb in bar 2, beat 2 (transposed from F)
        SongChord(note: 0, tension: 0, bar: 3, beat: 0),    // C in bar 3, beat 0 (transposed from C)
        SongChord(note: 0, tension: 5, bar: 3, beat: 1),    // C in bar 3, beat 1 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 4, beat: 0),    // A in bar 4, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 4, beat: 1),    // G7 in bar 4, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 4, beat: 2),    // G7 in bar 4, beat 2 (transposed from D7)
        SongChord(note: 0, tension: 0, bar: 5, beat: 0),    // C in bar 5, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 5, beat: 1),    // C in bar 5, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 5, beat: 2),    // C in bar 5, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 6, beat: 0),    // Bb in bar 6, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 6, beat: 1),    // C in bar 6, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 6, beat: 2),    // C in bar 6, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 7, beat: 0),    // Bb in bar 7, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 7, beat: 1),    // C in bar 7, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 7, beat: 2),    // C in bar 7, beat 2 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 8, beat: 0),    // A in bar 8, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 8, beat: 1),    // G7 in bar 8, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 8, beat: 2),    // G7 in bar 8, beat 2 (transposed from D7)
        SongChord(note: 0, tension: 0, bar: 9, beat: 0),    // C in bar 9, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 9, beat: 1),    // C in bar 9, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 9, beat: 2),    // C in bar 9, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 10, beat: 0),   // Bb in bar 10, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 10, beat: 1),   // C in bar 10, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 10, beat: 2),   // C in bar 10, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 11, beat: 0),   // Bb in bar 11, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 11, beat: 1),   // C in bar 11, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 11, beat: 2),   // C in bar 11, beat 2 (transposed from C)

        // Page 2
        SongChord(note: 7, tension: 5, bar: 12, beat: 0),   // G7 in bar 12, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 12, beat: 1),   // C in bar 12, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 12, beat: 2),   // C in bar 12, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 13, beat: 0),   // E in bar 13, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 13, beat: 1),   // Bb in bar 13, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 13, beat: 2),   // E in bar 13, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 14, beat: 0),   // Bb in bar 14, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 14, beat: 1),   // C in bar 14, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 14, beat: 2),   // E in bar 14, beat 2 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 15, beat: 0),   // A in bar 15, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 15, beat: 1),   // G7 in bar 15, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 15, beat: 2),   // G7 in bar 15, beat 2 (transposed from D7)
        SongChord(note: 0, tension: 0, bar: 16, beat: 0),   // C in bar 16, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 16, beat: 1),   // C in bar 16, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 16, beat: 2),   // C in bar 16, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 17, beat: 0),   // Bb in bar 17, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 17, beat: 1),   // C in bar 17, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 17, beat: 2),   // C in bar 17, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 18, beat: 0),   // Bb in bar 18, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 18, beat: 1),   // C in bar 18, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 18, beat: 2),   // C in bar 18, beat 2 (transposed from C)
        SongChord(note: 7, tension: 5, bar: 19, beat: 0),   // G7 in bar 19, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 19, beat: 1),   // C in bar 19, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 19, beat: 2),   // C in bar 19, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 20, beat: 0),   // E in bar 20, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 20, beat: 1),   // Bb in bar 20, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 20, beat: 2),   // E in bar 20, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 21, beat: 0),   // Bb in bar 21, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 21, beat: 1),   // C in bar 21, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 21, beat: 2),   // E in bar 21, beat 2 (transposed from C)

        // Page 3
        SongChord(note: 7, tension: 5, bar: 22, beat: 0),   // G7 in bar 22, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 22, beat: 1),   // C in bar 22, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 22, beat: 2),   // C in bar 22, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 23, beat: 0),   // E in bar 23, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 23, beat: 1),   // Bb in bar 23, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 23, beat: 2),   // E in bar 23, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 24, beat: 0),   // Bb in bar 24, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 24, beat: 1),   // C in bar 24, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 24, beat: 2),   // E in bar 24, beat 2 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 25, beat: 0),   // A in bar 25, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 25, beat: 1),   // G7 in bar 25, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 25, beat: 2),   // G7 in bar 25, beat 2 (transposed from D7)
        SongChord(note: 0, tension: 0, bar: 26, beat: 0),   // C in bar 26, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 26, beat: 1),   // C in bar 26, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 26, beat: 2),   // C in bar 26, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 27, beat: 0),   // Bb in bar 27, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 27, beat: 1),   // C in bar 27, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 27, beat: 2),   // C in bar 27, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 28, beat: 0),   // Bb in bar 28, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 28, beat: 1),   // C in bar 28, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 28, beat: 2),   // C in bar 28, beat 2 (transposed from C)
        SongChord(note: 7, tension: 5, bar: 29, beat: 0),   // G7 in bar 29, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 29, beat: 1),   // C in bar 29, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 29, beat: 2),   // C in bar 29, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 30, beat: 0),   // E in bar 30, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 30, beat: 1),   // Bb in bar 30, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 30, beat: 2),   // E in bar 30, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 31, beat: 0),   // Bb in bar 31, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 31, beat: 1),   // C in bar 31, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 31, beat: 2),   // E in bar 31, beat 2 (transposed from C)

        // Page 4
        SongChord(note: 7, tension: 5, bar: 32, beat: 0),   // G7 in bar 32, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 32, beat: 1),   // C in bar 32, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 32, beat: 2),   // C in bar 32, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 33, beat: 0),   // E in bar 33, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 33, beat: 1),   // Bb in bar 33, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 33, beat: 2),   // E in bar 33, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 34, beat: 0),   // Bb in bar 34, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 34, beat: 1),   // C in bar 34, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 34, beat: 2),   // E in bar 34, beat 2 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 35, beat: 0),   // A in bar 35, beat 0 (transposed from E)
        SongChord(note: 7, tension: 5, bar: 35, beat: 1),   // G7 in bar 35, beat 1 (transposed from D7)
        SongChord(note: 7, tension: 5, bar: 35, beat: 2),   // G7 in bar 35, beat 2 (transposed from D7)
        SongChord(note: 0, tension: 0, bar: 36, beat: 0),   // C in bar 36, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 36, beat: 1),   // C in bar 36, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 36, beat: 2),   // C in bar 36, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 37, beat: 0),   // Bb in bar 37, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 37, beat: 1),   // C in bar 37, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 37, beat: 2),   // C in bar 37, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 38, beat: 0),   // Bb in bar 38, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 38, beat: 1),   // C in bar 38, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 38, beat: 2),   // C in bar 38, beat 2 (transposed from C)
        SongChord(note: 7, tension: 5, bar: 39, beat: 0),   // G7 in bar 39, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 39, beat: 1),   // C in bar 39, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 39, beat: 2),   // C in bar 39, beat 2 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 40, beat: 0),   // E in bar 40, beat 0 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 40, beat: 1),   // Bb in bar 40, beat 1 (transposed from F)
        SongChord(note: 3, tension: 5, bar: 40, beat: 2),   // E in bar 40, beat 2 (transposed from C)
        SongChord(note: 8, tension: 5, bar: 41, beat: 0),   // Bb in bar 41, beat 0 (transposed from F)
        SongChord(note: 0, tension: 5, bar: 41, beat: 1),   // C in bar 41, beat 1 (transposed from G7)
        SongChord(note: 3, tension: 5, bar: 41, beat: 2),   // E in bar 41, beat 2 (transposed from C)
        SongChord(note: 7, tension: 5, bar: 42, beat: 0),   // G7 in bar 42, beat 0 (transposed from D7)
        SongChord(note: 0, tension: 5, bar: 42, beat: 1),   // C in bar 42, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 5, bar: 42, beat: 2),   // C in bar 42, beat 2 (transposed from G7)
    ]

    let babyFace: [SongChord] = [
        // Page 1
        SongChord(note: 0, tension: 0, bar: 0, beat: 0),    // C in bar 0, beat 0 (transposed from Eb)
        SongChord(note: 7, tension: 6, bar: 0, beat: 1),    // G° in bar 0, beat 1 (transposed from E°)
        SongChord(note: 10, tension: 5, bar: 0, beat: 2),   // Bb7 in bar 0, beat 2 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 1, beat: 0),    // A in bar 1, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 1, beat: 1),    // C in bar 1, beat 1 (transposed from Eb)
        SongChord(note: 10, tension: 5, bar: 1, beat: 2),   // Bb7 in bar 1, beat 2 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 2, beat: 0),    // A in bar 2, beat 0 (transposed from C)
        SongChord(note: 10, tension: 5, bar: 2, beat: 1),   // Bb7 in bar 2, beat 1 (transposed from G7)
        SongChord(note: 0, tension: 0, bar: 2, beat: 2),    // C in bar 2, beat 2 (transposed from Eb)
        SongChord(note: 0, tension: 0, bar: 3, beat: 0),    // C in bar 3, beat 0 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 3, beat: 1),    // A in bar 3, beat 1 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 3, beat: 2),    // A in bar 3, beat 2 (transposed from C)
        SongChord(note: 10, tension: 5, bar: 4, beat: 0),   // Bb7 in bar 4, beat 0 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 4, beat: 1),    // A in bar 4, beat 1 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 4, beat: 2),    // C in bar 4, beat 2 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 5, beat: 0),    // A in bar 5, beat 0 (transposed from Db)
        SongChord(note: 7, tension: 0, bar: 5, beat: 1),    // G in bar 5, beat 1 (transposed from E)
        SongChord(note: 9, tension: 0, bar: 5, beat: 2),    // A in bar 5, beat 2 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 6, beat: 0),    // C in bar 6, beat 0 (transposed from Eb)
        SongChord(note: 10, tension: 5, bar: 6, beat: 1),   // Bb7 in bar 6, beat 1 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 6, beat: 2),    // A in bar 6, beat 2 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 7, beat: 0),    // A in bar 7, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 7, beat: 1),    // C in bar 7, beat 1 (transposed from Eb)
        SongChord(note: 10, tension: 5, bar: 7, beat: 2),   // Bb7 in bar 7, beat 2 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 8, beat: 0),    // A in bar 8, beat 0 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 8, beat: 1),    // A in bar 8, beat 1 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 8, beat: 2),    // A in bar 8, beat 2 (transposed from C)
        SongChord(note: 10, tension: 5, bar: 9, beat: 0),   // Bb7 in bar 9, beat 0 (transposed from G7)
        SongChord(note: 10, tension: 5, bar: 9, beat: 1),   // Bb7 in bar 9, beat 1 (transposed from G7)
        SongChord(note: 10, tension: 5, bar: 9, beat: 2),   // Bb7 in bar 9, beat 2 (transposed from G7)
        SongChord(note: 9, tension: 0, bar: 10, beat: 0),   // A in bar 10, beat 0 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 10, beat: 1),   // A in bar 10, beat 1 (transposed from C)
        SongChord(note: 9, tension: 0, bar: 10, beat: 2),   // A in bar 10, beat 2 (transposed from C)

        // Page 2
        SongChord(note: 7, tension: 6, bar: 43, beat: 0),   // G° in bar 43, beat 0 (transposed from E7)
        SongChord(note: 7, tension: 6, bar: 44, beat: 0),   // G° in bar 44, beat 0 (transposed from E7)
        SongChord(note: 0, tension: 0, bar: 45, beat: 0),   // C in bar 45, beat 0 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 46, beat: 0),   // A in bar 46, beat 0 (transposed from C)
        SongChord(note: 7, tension: 6, bar: 46, beat: 1),   // G° in bar 46, beat 1 (transposed from E7)
        SongChord(note: 7, tension: 6, bar: 47, beat: 0),   // G° in bar 47, beat 0 (transposed from E7)
        SongChord(note: 9, tension: 0, bar: 47, beat: 1),   // A in bar 47, beat 1 (transposed from C)
        SongChord(note: 7, tension: 6, bar: 48, beat: 0),   // G° in bar 48, beat 0 (transposed from E7)
        SongChord(note: 9, tension: 0, bar: 49, beat: 0),   // A in bar 49, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 49, beat: 1),   // C in bar 49, beat 1 (transposed from Db)
        SongChord(note: 9, tension: 0, bar: 50, beat: 0),   // A in bar 50, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 50, beat: 1),   // C in bar 50, beat 1 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 51, beat: 0),   // A in bar 51, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 52, beat: 0),   // C in bar 52, beat 0 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 53, beat: 0),   // A in bar 53, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 53, beat: 1),   // C in bar 53, beat 1 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 54, beat: 0),   // A in bar 54, beat 0 (transposed from C)
        SongChord(note: 0, tension: 0, bar: 54, beat: 1),   // C in bar 54, beat 1 (transposed from Eb)
        SongChord(note: 0, tension: 0, bar: 55, beat: 0),   // C in bar 55, beat 0 (transposed from Eb)
        SongChord(note: 9, tension: 0, bar: 56, beat: 0)    // A in bar 56, beat 0 (transposed from C)
    ]

    let barcarolle: [SongChord] = [
        // Page 1
        SongChord(note: 9, tension: 0, bar: 0, beat: 0),    // A in bar 0, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 0, beat: 1),    // A in bar 0, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 0, beat: 2),    // A in bar 0, beat 2 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 1, beat: 0),    // A in bar 1, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 1, beat: 1),    // A in bar 1, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 1, beat: 2),    // A in bar 1, beat 2 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 2, beat: 0),    // A in bar 2, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 2, beat: 1),    // A in bar 2, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 2, beat: 2),    // A in bar 2, beat 2 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 3, beat: 0),    // C7 in bar 3, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 3, beat: 1),    // C7 in bar 3, beat 1 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 3, beat: 2),    // C7 in bar 3, beat 2 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 4, beat: 0),    // C7 in bar 4, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 4, beat: 1),    // C7 in bar 4, beat 1 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 4, beat: 2),    // C7 in bar 4, beat 2 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 5, beat: 0),    // A in bar 5, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 5, beat: 1),    // A in bar 5, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 5, beat: 2),    // A in bar 5, beat 2 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 6, beat: 0),    // A in bar 6, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 6, beat: 1),    // A in bar 6, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 6, beat: 2),    // A in bar 6, beat 2 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 7, beat: 0),    // C7 in bar 7, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 7, beat: 1),    // C7 in bar 7, beat 1 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 7, beat: 2),    // C7 in bar 7, beat 2 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 8, beat: 0),    // A in bar 8, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 8, beat: 1),    // A in bar 8, beat 1 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 8, beat: 2),    // A in bar 8, beat 2 (transposed from D)

        // Page 2
        SongChord(note: 4, tension: 5, bar: 24, beat: 0),   // E7 in bar 24, beat 0 (transposed from E7)
        SongChord(note: 4, tension: 5, bar: 25, beat: 0),   // E7 in bar 25, beat 0 (transposed from E7)
        SongChord(note: 9, tension: 0, bar: 25, beat: 1),   // A in bar 25, beat 1 (transposed from F6)
        SongChord(note: 9, tension: 0, bar: 26, beat: 0),   // A in bar 26, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 27, beat: 0),   // C7 in bar 27, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 28, beat: 0),   // A in bar 28, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 29, beat: 0),   // A in bar 29, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 30, beat: 0),   // C7 in bar 30, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 31, beat: 0),   // C7 in bar 31, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 32, beat: 0),   // A in bar 32, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 33, beat: 0),   // C7 in bar 33, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 34, beat: 0),   // A in bar 34, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 35, beat: 0),   // A in bar 35, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 36, beat: 0),   // C7 in bar 36, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 37, beat: 0),   // C7 in bar 37, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 38, beat: 0),   // A in bar 38, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 39, beat: 0),   // A in bar 39, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 40, beat: 0),   // A in bar 40, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 41, beat: 0),   // A in bar 41, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 42, beat: 0),   // A in bar 42, beat 0 (transposed from D)

        // Page 3
        SongChord(note: 4, tension: 5, bar: 44, beat: 0),   // E7 in bar 44, beat 0 (transposed from E7)
        SongChord(note: 9, tension: 0, bar: 45, beat: 0),   // A in bar 45, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 46, beat: 0),   // C7 in bar 46, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 47, beat: 0),   // A in bar 47, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 48, beat: 0),   // C7 in bar 48, beat 0 (transposed from A7)
        SongChord(note: 0, tension: 5, bar: 49, beat: 0),   // C7 in bar 49, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 50, beat: 0),   // A in bar 50, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 51, beat: 0),   // A in bar 51, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 52, beat: 0),   // A in bar 52, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 53, beat: 0),   // A in bar 53, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 54, beat: 0),   // C7 in bar 54, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 55, beat: 0),   // A in bar 55, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 56, beat: 0),   // C7 in bar 56, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 57, beat: 0),   // A in bar 57, beat 0 (transposed from D)
        SongChord(note: 0, tension: 5, bar: 58, beat: 0),   // C7 in bar 58, beat 0 (transposed from A7)
        SongChord(note: 9, tension: 0, bar: 59, beat: 0),   // A in bar 59, beat 0 (transposed from D)
        SongChord(note: 9, tension: 0, bar: 60, beat: 0)    // A in bar 60, beat 0 (transposed from D)
    ]


    let songsString = ["Ain't she sweet?", "Alice blue down", "April shower", "Baby face", "Barkrole"]



    // Function to get note and tension by bar and beat number with fallback to the previous beats within the same bar
    func getNoteAndTension(song: [SongChord], bar: Int, beat: Int) -> (note: Int, tension: Int)? {
        for b in (0...beat).reversed() {
            if let chord = song.first(where: { $0.bar == bar && $0.beat == b }) {
                return (chord.note, chord.tension)
            }
        }
        return nil
    }
    func numberOfBars(in song: [SongChord]) -> Int {
        let uniqueBars = Set(song.map { $0.bar })
        return uniqueBars.count
    }
    func transposeChord(note: Int, interval: Int) -> Int {
        let totalNotes = 12
        return (note + interval) % totalNotes
    }
    func setSelectedSong(songString: String) -> [SongChord]{
        switch(songString){
        case songsString[0]:
            return aintSheSweet
        case songsString[1]:
            return aliceBlueGown
        case songsString[2]:
            return aprilShowers
        case songsString[4]:
            return babyFace
        case songsString[5]:
            return barcarolle
        default:
            break
        }
        return aintSheSweet
    }

    func transposeSong(chords: [SongChord], interval: Int) -> [SongChord] {
        return chords.map { chord in
            var transposedChord = chord
            transposedChord.note = transposeChord(note: chord.note, interval: interval)
            return transposedChord
        }
    }

    

    func getSeventh(_ key: String) -> Int {
        switch key {
        case "C":
            return 5
        case "G":
            return 6
        case "D":
            return 7
        case "A":
            return 8
        case "E":
            return 9
        case "B":
            return 10
        case "F#":
            return 11
        case "Db":
            return 0
        case "Ab":
            return 1
        case "Eb":
            return 2
        case "Bb":
            return 3
        case "F":
            return 4
        default:
            return 0
        }
    }

    func getSecond(_ key: String) -> Int {
        switch key {
        case "C":
            return 2
        case "G":
            return 3
        case "D":
            return 4
        case "A":
            return 5
        case "E":
            return 6
        case "B":
            return 7
        case "F#":
            return 8
        case "Db":
            return 9
        case "Ab":
            return 10
        case "Eb":
            return 11
        case "Bb":
            return 0
        case "F":
            return 1
        default:
            return 0
        }
    }

    func getFifth(_ key: String) -> Int {
        switch key {
        case "C":
            return 1
        case "G":
            return 2
        case "D":
            return 3
        case "A":
            return 4
        case "E":
            return 5
        case "B":
            return 6
        case "F#":
            return 7
        case "Db":
            return 8
        case "Ab":
            return 9
        case "Eb":
            return 10
        case "Bb":
            return 11
        case "F":
            return 0
        default:
            return 0
        }
    }

    func getThird(_ key: String) -> Int {
        switch key {
        case "C":
            return 4
        case "G":
            return 5
        case "D":
            return 6
        case "A":
            return 7
        case "E":
            return 8
        case "B":
            return 9
        case "F#":
            return 10
        case "Db":
            return 11
        case "Ab":
            return 0
        case "Eb":
            return 1
        case "Bb":
            return 2
        case "F":
            return 3
        default:
            return 0
        }
    }
    func getSixth(_ key: String) -> Int {
        switch key {
        case "C":
            return 3
        case "G":
            return 4
        case "D":
            return 5
        case "A":
            return 6
        case "E":
            return 7
        case "B":
            return 8
        case "F#":
            return 9
        case "Db":
            return 10
        case "Ab":
            return 11
        case "Eb":
            return 0
        case "Bb":
            return 1
        case "F":
            return 2
        default:
            return 0
        }
    }

    func getFourth(_ key: String) -> Int {
        switch key {
        case "C":
            return 11
        case "G":
            return 0
        case "D":
            return 1
        case "A":
            return 2
        case "E":
            return 3
        case "B":
            return 4
        case "F#":
            return 5
        case "Db":
            return 6
        case "Ab":
            return 7
        case "Eb":
            return 8
        case "Bb":
            return 9
        case "F":
            return 10
        default:
            return 0
        }
    }

  func getFirst(_ key: String) -> Int {
        switch key {
        case "C":
            return 0
        case "G":
            return 1
        case "D":
            return 2
        case "A":
            return 3
        case "E":
            return 4
        case "B":
            return 5
        case "F#":
            return 6
        case "Db":
            return 7
        case "Ab":
            return 8
        case "Eb":
            return 9
        case "Bb":
            return 10
        case "F":
            return 11
        default:
            return 0
        }
    }
    func getSecondaryDominant(secondaryDominantNumber: Int, key: String) -> Int {
        var secondaryDom: Int
        
        switch key {
        case "C":
            return secondaryDominantNumber
        case "G":
            return secondaryDominantNumber + 1
        case "D":
            return secondaryDominantNumber + 2
        case "A":
            return secondaryDominantNumber + 3
        case "E":
            return secondaryDominantNumber + 4
        case "B":
            return secondaryDominantNumber + 5
        case "F#":
            secondaryDom = secondaryDominantNumber + 6
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Db":
            secondaryDom = secondaryDominantNumber + 7
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Ab":
            secondaryDom = secondaryDominantNumber + 8
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Eb":
            secondaryDom = secondaryDominantNumber + 9
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "Bb":
            secondaryDom = secondaryDominantNumber + 10
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        case "F":
            secondaryDom = secondaryDominantNumber + 11
            if secondaryDom > 11 {
                secondaryDom -= 12
            }
            return secondaryDom
        default:
            return 0
        }
    }
    func getDiminished(_ diminished: Int, _ key: String) -> Int {
        var diminishedNo: Int
        switch key {
            case "C":
                diminishedNo = diminished + 6
                return diminishedNo
            case "G":
                diminishedNo = diminished + 7
                return diminishedNo
            case "D":
                diminishedNo = diminished + 8
                return diminishedNo
            case "A":
                diminishedNo = diminished + 9
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "E":
                diminishedNo = diminished + 10
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "B":
                diminishedNo = diminished + 11
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "F#":
                diminishedNo = diminished + 12
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Db":
                diminishedNo = diminished + 13
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Ab":
                diminishedNo = diminished + 14
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Eb":
                diminishedNo = diminished + 15
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "Bb":
                diminishedNo = diminished + 16
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            case "F":
                diminishedNo = diminished + 17
                if diminishedNo > 11 {
                    diminishedNo -= 12
                }
                return diminishedNo
            default:
                return 0
        }
    }
    func getDominant(secondaryDominant: Int, key: String) -> Int { //The dominant to go to is determined by the secondary dominant we are on
    let random = Int.random(in: 0...1) //One of two dominants can be selected, based on the secondary dominant we are on
    switch secondaryDominant {
    case 1: //referring to v7/1
    if random == 0 {
    return getFirst(key)
    } else {
    return getFifth(key)
    }
    case 0: //referring to v7/iv
    if random == 0 {
    return getFirst(key)
    } else {
    return getFourth(key)
    }
    case 2: //referring to v7/v
    if random == 0 {
    return getSecond(key)
    } else {
    return getFifth(key)
    }
    case 3: //referring to v7/ii
    if random == 0 {
    return getSecond(key)
    } else {
    return getSixth(key)
    }
    case 5: //referring to v7/vi
    if random == 0 {
    return getSixth(key)
    } else {
    return getThird(key)
    }
    case 4: //referring to v7/iii
    if random == 0 {
    return getThird(key)
    } else {
    return getSeventh(key)
    }
    default:
    break
    }
    return 0
    }
    func getStepFromNote(key: String, note: String) -> Int {
        switch key {
        case "C":
            switch note {
            case "C":
                return 1
            case "D":
                return 2
            case "G":
                return 5
            case "A":
                return 6
            case "E":
                return 3
            case "B":
                return 7
            default:
                return 1
            }
        case "G":
            switch note {
            case "G":
                return 1
            case "D":
                return 5
            case "A":
                return 2
            case "E":
                return 6
            case "B":
                return 3
            case "F#":
                return 7
            default:
                return 1
            }
        case "D":
            switch note {
            case "A":
                return 5
            case "E":
                return 2
            case "B":
                return 6
            case "F#":
                return 3
            case "Db":
                return 7
            default:
                return 1
            }
        case "A":
            switch note {
            case "A":
                return 1
            case "E":
                return 5
            case "B":
                return 2
            case "F#":
                return 6
            case "Db":
                return 3
            case "Ab":
                return 7
            default:
                return 1
            }
        case "E":
            switch note {
            case "E":
                return 1
            case "B":
                return 5
            case "F#":
                return 2
            case "Db":
                return 6
            case "Ab":
                return 3
            case "Eb":
                return 7
            default:
                return 1
            }
        case "B":
            switch note {
            case "B":
                return 1
            case "F#":
                return 5
            case "Db":
                return 2
            case "Ab":
                return 6
            case "Eb":
                return 3
            case "Bb":
                return 7
            default:
                return 1
            }
        case "F#":
            switch note {
            case "F#":
                return 1
            case "Db":
                return 5
            case "Ab":
                return 2
            case "Eb":
                return 6
            case "Bb":
                return 3
            case "F":
                return 7
            default:
                return 1
            }
        case "Db":
            switch note {
            case "Db":
                return 1
            case "Ab":
                return 5
            case "Eb":
                return 2
            case "Bb":
                return 6
            case "F":
                return 3
            case "C":
                return 7
            default:
                return 1
            }
        case "Ab":
            switch note {
            case "Ab":
                return 1
            case "Eb":
                return 5
            case "Bb":
                return 2
            case "F":
                return 6
            case "C":
                return 3
            case "G":
                return 7
            default:
                return 1
            }
        case "Eb":
            switch note {
            case "Eb":
                return 1
            case "Bb":
                return 5
            case "F":
                return 2
            case "C":
                return 6
            case "G":
                return 3
            case "D":
                return 7
            default:
                return 1
            }
        case "Bb":
            switch note {
            case "Bb":
                return 1
            case "F":
                return 5
            case "C":
                return 2
            case "G":
                return 6
            case "D":
                return 3
            case "A":
                return 7
            default:
                return 1
            }
        case "F":
            switch note {
            case "F":
                return 1
            case "C":
                return 5
            case "G":
                return 2
            case "D":
                return 6
            case "A":
                return 3
            case "E":
                return 7
            default:
                return 1
            }
        default:
            return 1
        }
    }

}
