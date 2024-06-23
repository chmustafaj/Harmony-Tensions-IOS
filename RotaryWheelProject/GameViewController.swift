//
//  GameViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 13/02/2023.
//

import UIKit
import SwiftUI
import StoreKit
import MultipeerConnectivity

 
class GameViewController: UIViewController {
    
    
    
    var peerId: MCPeerID!
    var session: MCSession!
    var scrollTimer: Timer?
       let scrollSpeed: CGFloat = 50  // Adjust this value to set the scroll speed (points per second)

    @IBOutlet weak var sheetMusicStackView: UIStackView!
    @IBOutlet weak var sheetMusicScrollView: UIScrollView!
    var nearbyServiceAdvertiser : MCNearbyServiceAdvertiser?
    func advertise(){
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer:  peerId, discoveryInfo: nil, serviceType: harmonyTensionsServiceType)
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func invite(){
        let browser = MCBrowserViewController(serviceType: harmonyTensionsServiceType, session: session)
        browser.delegate = self
        present(browser, animated: true, completion: nil)
        isController = true
        isPeer = false
        
    }
    
    
    var premiumVersionPurchased : Bool = false
    var storekit = StoreKitManager()
    
    @IBAction func btnUnlock(_ sender: Any) {
    }
    
    @IBAction func btnConfigurationPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let selectDetailsVC = storyboard.instantiateViewController(withIdentifier: "SelectGameDetailsViewController") as? SelectGameDetailsViewController {
           
            self.present(selectDetailsVC, animated: true, completion: nil)
        }
        
        
    }
    
    func pass(data: Song) {
        //        selectedSong = data
        //        NSLog((selectedSong?.name)!)
    }
    func sendSong(data: [SongChord]) {
        //        print("Selected song: " + (selectedSongForSongMode.description))
        //        selectedSongForSongMode = data
        //        difficultySelection = 1
        //        makeDiminishedNotesVisible(false)
        //        makeSecondaryDominantsVisible(false)
    }
    
    
    var isFirstLoop :Bool = true
    var songKey : String = ""
    let harmonyTensionsServiceType = "gt-game"
    var soundID: SystemSoundID = 0
    var timeInterval: TimeInterval = 1 // Initial time interval
    var timer: Timer? // Declare timer as an instance variable
    
    
    let utils = Utils()
    
    
    var beatFromStart = 1
    var isPeer = false
    var isController = false
    
    //A separate probability list for being on each note
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    func sendData(data: Data){
        if session.connectedPeers.count > 0 {
            do {
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error sending data: \(error)")
            }
        }
    }
    
    
    
    @IBAction func btnConnectPressed(_ sender: Any) {
        NSLog("connect")
        invite()
    }
    
    
    
    lazy var metronome: PDMetronome = {
        let newMetronome = PDMetronome(bpm: 15, andSubdivisions: 3)  // 15 bpm value works as 60
        newMetronome!.on = false
        return newMetronome!
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSheetMusic(for: "ahleuca", rowCount: 3)
        startScrolling()

        UIApplication.shared.isIdleTimerDisabled = true
        peerId = MCPeerID(displayName:  UIDevice.current.name)
        session = MCSession(peer: self.peerId, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        advertise()
        NSLog("Peer id: \(peerId.displayName)")
        
        
        initUI()
        
        
        NSLog("View did load")
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
        
        
        
        
        
        
        
    }
    
    func loadSheetMusic(for song: String, rowCount: Int) {
        // Remove any existing arranged subviews
        for view in sheetMusicStackView.arrangedSubviews {
            sheetMusicStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add the new rows
        let rowHeight: CGFloat = view.frame.height  // Adjust based on your image size
        
        for i in 0..<rowCount {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
            
            let imageName = "\(song)_row_\(i + 1)"
            print("Trying to load image: \(imageName)")
            if let image = UIImage(named: imageName) {
                imageView.image = image
                sheetMusicStackView.addArrangedSubview(imageView)
                print("Added image: \(imageName)")
            } else {
                print("Failed to load image: \(imageName)")
            }
        }
        
        // Update the scroll view content size
        sheetMusicScrollView.contentSize = CGSize(width: sheetMusicScrollView.frame.width, height: rowHeight * CGFloat(rowCount))
    }
    func startScrolling() {
           scrollTimer?.invalidate()
           scrollTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(scrollStep), userInfo: nil, repeats: true)
       }

       @objc func scrollStep() {
           let yOffset = sheetMusicScrollView.contentOffset.y + scrollSpeed * 0.01
           if yOffset <= sheetMusicScrollView.contentSize.height - sheetMusicScrollView.frame.height {
               sheetMusicScrollView.contentOffset = CGPoint(x: 0, y: yOffset)
           } else {
               scrollTimer?.invalidate()
           }
       }

       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           scrollTimer?.invalidate()
       }
   
        

    
    
    
    
    func initUI(){
        
        
        
        
    }
    
    
    protocol isAbleToReceiveData {
        func pass(data: Song)
    }
    protocol selectSongFromSongMode{
        func sendSong(data: [SongChord])
    }
    protocol setRandomProgressionDifficulty{
        func setDifficulty(difficulty: Int)
    }
}
    
    
    // For game multiplayer capability
    extension GameViewController : MCSessionDelegate{
        func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
            print("\(peerID) state: \(state)")
            
        }
        
        func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
            isPeer = true
            isController = false
            
            
           
            
        }
        
        func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
            
        }
        
        func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
            
        }
        
        func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
            
        }
        
    }

extension GameViewController:  MCNearbyServiceAdvertiserDelegate{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
        
    }
    
}

extension GameViewController: MCBrowserViewControllerDelegate{
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true )

    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true )
    }
    func currentTimeFormatted() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss.SSS"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }

    
    
}
