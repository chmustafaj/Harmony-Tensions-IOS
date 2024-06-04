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

 
class GameViewController: UIViewController, isAbleToReceiveData, selectSongFromSongMode, setRandomProgressionDifficulty {
 
    

    var peerId: MCPeerID!
    var session: MCSession!
    
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
                    selectDetailsVC.modalPresentationStyle = .popover
                    selectDetailsVC.songDelegate = self
                    selectDetailsVC.randomProgressionDelegate = self
                    self.present(selectDetailsVC, animated: true, completion: nil)
                }
        

    }
    
    func pass(data: Song) {
        selectedSong = data
        NSLog((selectedSong?.name)!)
    }
    func sendSong(data: [SongChord]) {
        print("Selected song: " + (selectedSongForSongMode.description))
        selectedSongForSongMode = data
        difficultySelection = 1
        makeDiminishedNotesVisible(false)
        makeSecondaryDominantsVisible(false)
    }
    func setDifficulty(difficulty: Int){
        print("Difficulty set: " + String(difficulty))
        difficultySelection = difficulty // todo change
        if(difficulty == 2){
            makeSecondaryDominantsVisible(true)
            makeDiminishedNotesVisible(false)
        }else if(difficulty == 3){
                makeDiminishedNotesVisible(true)
                makeSecondaryDominantsVisible(true)
            }
        
    }
    
    var isFirstLoop :Bool = true
    var songKey : String = ""
    let harmonyTensionsServiceType = "gt-game"
    var soundID: SystemSoundID = 0
    var timeInterval: TimeInterval = 1 // Initial time interval
    var timer: Timer? // Declare timer as an instance variable
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var btnUnlock: UIButton!
    @IBOutlet weak var freeVersionView: UIView!
    var selectedSong : Song?
    private var difficultySelection = Int()
    let circleView = UIView()
    let lettersViewG = UIView()
    let lettersViewW = UIView()
    let lettersViewY = UIView()
    let txtBarOn = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let utils = Utils()
    let difficulties = ["Level 1","Level 2","Level 3"]
    var nextNote: String=""
    var nextStep = 0
    var bpm = Int()
    var beatOn = 1
    var barOn = 1
    var beatFromStart = 1
    var isPeer = false
    var isController = false
    
    var replayIndex = 0 //This integer will tell the algorithm which note the user is on when replaying a progression
    //A separate probability list for being on each note
    var probabilityList1 = [Int]()
    var probabilityList2 = [Int]()
    var probabilityList3 = [Int]()
    var probabilityList4 = [Int]()
    var probabilityList5 = [Int]()
    var probabilityList6 = [Int]()
    var probabilityList7 = [Int]()
    var probabilityListDimSharpV = [Int]()
    var probabilityListDimSharpI = [Int]()
    var probabilityListDimSharpIV = [Int]()
    var probabilityListDimSharpII = [Int]()
    var turnaroundList1 = [Int]()
    var turnaroundList2 = [Int]()
    var turnaroundList3 = [Int]()
    var turnaroundList4 = [Int]()
    var savedProgression = [String]() //the user can save a particular progression and and replay it
    var tensions = [Int]()
    var beat = 1 //'beat' will allow us to play the metronome sound and update the textview, and update the notes after every 4 beats
    var loopEnded = true //To make sure the loop is completed before starting it again, or else 2 loops will go on at the same time
    var randomSecDom = 0
    var turnaroundRandom = 0
    var gameStarted = false
    static var gameInitialized = false
    var onSecondaryDominant = false
    var replayGame = false
    var noteOn : String = key
    var turnaroundListCounter = 0
    var ranDiminished = 0
    var goToDiminished = 0
    var bpmText=Int()
    var selectedSongForSongMode = [SongChord]()
    let dimii = UIImageView(image: UIImage(named: "dimiiwhite"))
    let dimv = UIImageView(image: UIImage(named: "dimvwhite"))
    let dimi = UIImageView(image: UIImage(named: "dimiwhite"))
    let dimiv = UIImageView(image: UIImage(named: "dimivwhite"))
    let v71ImageView = UIImageView(image: UIImage(named: "v71_white"))
    let v75ImageView = UIImageView(image: UIImage(named: "v75_white"))
    let v74ImageView = UIImageView(image: UIImage(named: "v74_white"))
    let v72ImageView = UIImageView(image: UIImage(named: "v72_white"))
    let v76ImageView = UIImageView(image: UIImage(named: "v76_white"))
    let v73ImageView = UIImageView(image: UIImage(named: "v73_white"))
    let t1ImageView = UIImageView(image: UIImage(named: "1_w"))
    let t5ImageView = UIImageView(image: UIImage(named: "5_w"))
    let t9ImageView = UIImageView(image: UIImage(named: "9_w"))
    let t13ImageView = UIImageView(image: UIImage(named: "13_w"))
    let t3ImageView = UIImageView(image: UIImage(named: "3_w"))
    let t7ImageView = UIImageView(image: UIImage(named: "7_w"))
    let ts11ImageView = UIImageView(image: UIImage(named: "s11_w"))
    let tb9ImageView = UIImageView(image: UIImage(named: "b9_w"))
    let tb13ImageView = UIImageView(image: UIImage(named: "b13_w"))
    let ts9ImageView = UIImageView(image: UIImage(named: "s9_w"))
    let tb7ImageView = UIImageView(image: UIImage(named: "b7_w"))
    let t11ImageView = UIImageView(image: UIImage(named: "11_w"))














    
    let ring = UIImageView(image: UIImage(named: "circle_border"))
    let imageView = UIImageView(image: UIImage(named: "simple_hw"))
    let centre = UIImageView(image: UIImage(named: "centre_clear"))


    let note0w = UIImageView();
    let note1w = UIImageView();
    let note2w = UIImageView();
    let note3w = UIImageView();
    let note4w = UIImageView();
    let note5w = UIImageView();
    let note6w = UIImageView();
    let note7w = UIImageView();
    let note8w = UIImageView();
    let note9w = UIImageView();
    let note10w = UIImageView();
    let note11w = UIImageView();
    
    let note0y = UIImageView();
    let note1y = UIImageView();
    let note2y = UIImageView();
    let note3y = UIImageView();
    let note4y = UIImageView();
    let note5y = UIImageView();
    let note6y = UIImageView();
    let note7y = UIImageView();
    let note8y = UIImageView();
    let note9y = UIImageView();
    let note10y = UIImageView();
    let note11y = UIImageView();
    
    let note0g = UIImageView();
    let note1g = UIImageView();
    let note2g = UIImageView();
    let note3g = UIImageView();
    let note4g = UIImageView();
    let note5g = UIImageView();
    let note6g = UIImageView();
    let note7g = UIImageView();
    let note8g = UIImageView();
    let note9g = UIImageView();
    let note10g = UIImageView();
    let note11g = UIImageView();
    var dataToSend: [String: Any] = [:]
    var initialHeight : CGFloat?
    var initialCentre: CGFloat?
    
   
    func makeDiminishedNotesVisible(_ isVisible:Bool){
        if isVisible{
            dimi.isHidden=false
            dimii.isHidden=false
            dimv.isHidden=false
            dimiv.isHidden=false
        }else{
            dimi.isHidden=true
            dimii.isHidden=true
            dimv.isHidden=true
            dimiv.isHidden=true
        }
    }
    func makeSecondaryDominantsVisible(_ isVisible:Bool){
        if isVisible{
            v71ImageView.isHidden=false
            v75ImageView.isHidden=false
            v74ImageView.isHidden=false
            v72ImageView.isHidden=false
            v76ImageView.isHidden=false
            v73ImageView.isHidden=false
        }else{
            v71ImageView.isHidden=true
            v75ImageView.isHidden=true
            v74ImageView.isHidden=true
            v72ImageView.isHidden=true
            v76ImageView.isHidden=true
            v73ImageView.isHidden=true
        }
        
    }
    
    @IBOutlet weak var labelBPM: UILabel!
    @IBOutlet weak var beatLabel: UILabel!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnStart: UIButton!
    func sendData(data: Data){
        if session.connectedPeers.count > 0 {
            do {
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error sending data: \(error)")
            }
        }
    }
    @IBAction func btnStartPressed(_ sender: Any) {
        if(!gameStarted && loopEnded){
            btnStart.setTitle("Stop", for: .normal)
            gameStarted=true
            savedProgression.removeAll()
            btnSave.isHidden=true
           
            createTimer()
            
        }else{
            stopGame()
        }
    }
    
    @IBAction func btnSavedPressed(_ sender: Any) {
        NSLog("Button")

        let viewController:ViewControllerSavedSongs = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SavedSongs") as! ViewControllerSavedSongs
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)

    }
    @IBAction func btnSavePushed(_ sender: Any) {
        let overLayer = ViewControllerSaveSong()
        overLayer.difficulty=difficultySelection
        overLayer.goToDiminished=goToDiminished
        overLayer.ranDiminished=ranDiminished
        overLayer.randomSecDom=randomSecDom
        overLayer.turnaroundRandom=turnaroundRandom
        overLayer.savedProgression=savedProgression
        overLayer.key=songKey
        overLayer.appear(sender: self)
    }
     
    @IBAction func btnConnectPressed(_ sender: Any) {
        NSLog("connect")
        invite()
    }

    func setSelectedSong(song: Song){
        selectedSong = song
        NSLog("Setting song")
        NSLog(song.name!)
    }

   

    lazy var metronome: PDMetronome = {
        let newMetronome = PDMetronome(bpm: 15, andSubdivisions: 3)  // 15 bpm value works as 60
        newMetronome!.on = false
        return newMetronome!
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        songKey = key
        peerId = MCPeerID(displayName:  UIDevice.current.name)
        session = MCSession(peer: self.peerId, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        advertise()
        NSLog("Peer id: \(peerId.displayName)")
        bpm = 60;  //default value
        bpmText = bpm;
        noteOn = songKey
        initProbabilityList()
        initTurnAroundLists()
        initUI()
        difficultySelection = 1

         unlockPremiumVersion()
        adjustWheelPosition()
        selectedSongForSongMode = utils.aintSheSweet // todo change later

        NSLog("View did load")
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }

     
      
       
        
       
  
    }
   

    
  
  
    func stopGame(){
        metronome.on = false
        // These two lines will make sure the metronome begins from the start of the bar
        metronome.reset = true
        metronome.reset = false
        beatFromStart = 1

        
        isFirstLoop = true
        timer?.invalidate()
        if difficultySelection == -1 {
        // B is the temporary difficulty for the intermediate section. If the game is stopped during the temporary beginner difficulty part of the intermediate section, the difficulty will again be set to intermediate
        difficultySelection = 2
        }
        replayGame = false
        gameStarted = false
        DispatchQueue.main.async { [self] in
            btnStart.setTitle("Start", for: .normal)
            resetWheel()
            txtBarOn.text = ""
            changeColorDiminished(ranDiminished, "w")
            if savedProgression.count > 0 {
            btnSave.isHidden = false
            }

        }
        noteOn = songKey
        beatOn = 1
        beat = 1
        barOn = 1
        onSecondaryDominant = false
        nextStep = 0
        turnaroundListCounter = 0
        turnaroundRandom = Int.random(in: 0...2)
       
        
        selectedSong = nil
        if(isController){
            let stopGameSignal = true
            let dataToSend = Data([stopGameSignal ? 1 : 0]) // Convert boolean to Data
            sendData(data: dataToSend)
        }
            
    }
    func resetWheel(){
        note0g.isHidden = true
        note0y.isHidden = true
        note0w.isHidden = false

        note1g.isHidden = true
        note1y.isHidden = true
        note1w.isHidden = false

        note2g.isHidden = true
        note2y.isHidden = true
        note2w.isHidden = false

        note3g.isHidden = true
        note3y.isHidden = true
        note3w.isHidden = false

        note4g.isHidden = true
        note4y.isHidden = true
        note4w.isHidden = false

        note5g.isHidden = true
        note5y.isHidden = true
        note5w.isHidden = false

        note6g.isHidden = true
        note6y.isHidden = true
        note6w.isHidden = false

        note7g.isHidden = true
        note7y.isHidden = true
        note7w.isHidden = false

        note8g.isHidden = true
        note8y.isHidden = true
        note8w.isHidden = false

        note9g.isHidden = true
        note9y.isHidden = true
        note9w.isHidden = false

        note10g.isHidden = true
        note10y.isHidden = true
        note10w.isHidden = false

        note11g.isHidden = true
        note11y.isHidden = true
        note11w.isHidden = false

        

       
        
        v71ImageView.image = UIImage(named: "v71_white")
        v75ImageView.image = UIImage(named: "v75_white")
        v74ImageView.image = UIImage(named: "v74_white")
        v72ImageView.image = UIImage(named: "v72_white")
        v76ImageView.image = UIImage(named: "v76_white")
        v73ImageView.image = UIImage(named: "v73_white")
        
        t1ImageView.image = UIImage(named: "1_w")
        t5ImageView.image = UIImage(named: "5_w")
        t9ImageView.image = UIImage(named: "9_w")
        t13ImageView.image = UIImage(named: "13_w")
        t3ImageView.image = UIImage(named: "3_w")
        t7ImageView.image = UIImage(named: "7_w")
        ts11ImageView.image = UIImage(named: "s11_w")
        tb9ImageView.image = UIImage(named: "b9_w")
        tb13ImageView.image = UIImage(named: "b13_w")
        ts9ImageView.image = UIImage(named: "s9_w")
        tb7ImageView.image = UIImage(named: "b7_w")
        t11ImageView.image =  UIImage(named: "11_w")
        



    }
    func changeColor(note : Int, c: Character ){
        switch note {
            case 0:
                switch c {
                case "y":
                    note0y.isHidden = false
                    note0g.isHidden = true
                    note0w.isHidden = true
                    
                case "g":
                    note0y.isHidden = true
                    note0g.isHidden = false
                    note0w.isHidden = true
                    
                case "w":
                    note0g.isHidden = true
                    note0y.isHidden = true
                    note0w.isHidden = false
                    
                default:
                    break
                }
                
            case 1:
                switch c {
                case "y":
                    note1y.isHidden = false
                    note1g.isHidden = true
                    note1w.isHidden = true
                    
                case "g":
                    note1y.isHidden = true
                    note1g.isHidden = false
                    note1w.isHidden = true
                    
                case "w":
                    note1g.isHidden = true
                    note1y.isHidden = true
                    note1w.isHidden = false
                    
                default:
                    break
                }
                
            case 2:
                switch c {
                case "y":
                    note2y.isHidden = false
                    note2g.isHidden = true
                    note2w.isHidden = true
                    
                case "g":
                    note2y.isHidden = true
                    note2g.isHidden = false
                    note2w.isHidden = true
                    
                case "w":
                    note2g.isHidden = true
                    note2y.isHidden = true
                    note2w.isHidden = false
                    
                default:
                    break
                }
                
            case 3:
                switch c {
                case "y":
                    note3y.isHidden = false
                    note3g.isHidden = true
                    note3w.isHidden = true
                    
                case "g":
                    note3y.isHidden = true
                    note3g.isHidden = false
                    note3w.isHidden = true
                    
                case "w":
                    note3g.isHidden = true
                    note3y.isHidden = true
                    note3w.isHidden = false
                    
                default:
                    break
                }
                
            case 4:
                switch c {
                case "y":
                    note4y.isHidden = false
                    note4g.isHidden = true
                    note4w.isHidden = true
                    
                case "g":
                    note4y.isHidden = true
                    note4g.isHidden = false
                    note4w.isHidden = true
                    
                case "w":
                    note4g.isHidden = true
                    note4y.isHidden = true
                    note4w.isHidden = false
                    
                default:
                    break
                }
                
            case 5:
                switch c {
                case "y":
                    note5y.isHidden = false
                    note5g.isHidden = true
                    note5w.isHidden = true
                    
                case "g":
                    note5y.isHidden = true
                    note5g.isHidden = false
                    note5w.isHidden = true
                    
                case "w":
                    note5g.isHidden = true
                    note5y.isHidden = true
                    note5w.isHidden = false
                    
                default:
                    break
                }
                
            case 6:
                switch c {
                case "y":
                    note6y.isHidden = false
                    note6g.isHidden = true
                    note6w.isHidden = true
                    
                case "g":
                    note6y.isHidden = true
                    note6g.isHidden = false
                    note6w.isHidden = true
                    
                case "w":
                    note6g.isHidden = true
                    note6y.isHidden = true
                    note6w.isHidden = false
                    
                default:
                    break
                }
                
            case 7:
                switch c {
                case "y":
                    note7y.isHidden = false
                    note7g.isHidden = true
                    note7w.isHidden = true
                    
                case "g":
                    note7y.isHidden = true
                    note7g.isHidden = false
                    note7w.isHidden = true
                    
                case "w":
                    note7g.isHidden = true
                    note7y.isHidden = true
                    note7w.isHidden = false
                    
                default:
                    break
                }
                
            case 8:
                switch c {
                case "y":
                    note8y.isHidden = false
                    note8g.isHidden = true
                    note8w.isHidden = true
                    
                case "g":
                    note8y.isHidden = true
                    note8g.isHidden = false
                    note8w.isHidden = true
                    
                case "w":
                    note8g.isHidden = true
                    note8y.isHidden = true
                    note8w.isHidden = false
                    
                default:
                    break
                }
                
            case 9:
                switch c {
                case "y":
                    note9y.isHidden = false
                    note9g.isHidden = true
                    note9w.isHidden = true
                    
                case "g":
                    note9y.isHidden = true
                    note9g.isHidden = false
                    note9w.isHidden = true
                    
                case "w":
                    note9g.isHidden = true
                    note9y.isHidden = true
                    note9w.isHidden = false
                    
                default:
                    break
                }
                
            case 10:
                switch c {
                case "y":
                    note10y.isHidden = false
                    note10g.isHidden = true
                    note10w.isHidden = true
                    
                case "g":
                    note10y.isHidden = true
                    note10g.isHidden = false
                    note10w.isHidden = true
                    
                case "w":
                    note10g.isHidden = true
                    note10y.isHidden = true
                    note10w.isHidden = false
                    
                default:
                    break
                }
                
            case 11:
                switch c {
                case "y":
                    note11y.isHidden = false
                    note11g.isHidden = true
                    note11w.isHidden = true
                    
                case "g":
                    note11y.isHidden = true
                    note11g.isHidden = false
                    note11w.isHidden = true
                    
                case "w":
                    note11g.isHidden = true
                    note11y.isHidden = true
                    note11w.isHidden = false
                    
                default:
                    break
                }
                
            default:
                break
        }



    }
  
    func getNoteFromInterval(interval: Int) -> String {
        print("interval: \(interval)")
        switch interval {
            case 1:
            return noteFromNumber(n: utils.getFirst(songKey))
            case 2:
            return noteFromNumber(n: utils.getSecond(songKey))
            case 3:
            return noteFromNumber(n: utils.getThird(songKey))
            case 4:
            return noteFromNumber(n: utils.getFourth(songKey))
            case 5:
            return noteFromNumber(n: utils.getFifth(songKey))
            case 6:
            return noteFromNumber(n: utils.getSixth(songKey))
            case 7:
            return noteFromNumber(n: utils.getSeventh(songKey))
            default:
            print("DEFAULT CASE")
            return noteFromNumber(n: utils.getSecond(songKey))

        }
    }
    func noteFromNumber(n: Int) -> String {
        switch n {
            case 0:
                return "C"
            case 1:
                return "G"
            case 2:
                return "D"
            case 3:
                return "A"
            case 4:
                return "E"
            case 5:
                return "B"
            case 6:
                return "F#"
            case 7:
                return "Db"
            case 8:
                return "Ab"
            case 9:
                return "Eb"
            case 10:
                return "Bb"
            case 11:
                return "F"
            default:
                return ""
        }
    }
    private func restartGame() {
//        if(isController && !isPeer){
            barOn = 1  // Restart game
//        }
        turnaroundListCounter = 0
        replayIndex = 0
    
        turnaroundRandom = Int.random(in: 0..<3)
        nextNote = songKey
    }



   
    func setSelectedSong(s: Song){
        selectedSong = s
        NSLog("Selecteed song ")
        NSLog(s.name!)
//        viewDidLoad()
//        selectSong()
    }
    func selectSong(){

        if (selectedSong != nil) {
            // These lines of code will be called when a song is selected from the saved songs activity
            savedProgression = selectedSong!.progression!.components(separatedBy: "-")
            randomSecDom = Int(selectedSong!.secondaryDominant)
            goToDiminished = Int(selectedSong!.diminished)
            turnaroundRandom = Int(selectedSong!.turnaround)
            
            switch (Int(selectedSong!.level)) {
                        // The correct level will be selected corresponding to the saved song
                        case 1:
                          
                            makeSecondaryDominantsVisible(false);
                            makeDiminishedNotesVisible(false)
                            break;
                        case 2:
                           
                            makeSecondaryDominantsVisible(true);
                            makeDiminishedNotesVisible(false);
            
                            break;
                        case 3:
                            makeDiminishedNotesVisible(true);
                            makeSecondaryDominantsVisible(true);
                            break;
                        default:
                            makeSecondaryDominantsVisible(false);
                            makeDiminishedNotesVisible(false)
                            break
                        }
                        noteOn = selectedSong!.key!

            print("onCreateView: saved progression \(savedProgression)")
            NSLog("Saved song key: ")
            NSLog(selectedSong!.key!)
            replayGame = true
            gameStarted = true
            btnStart.setTitle("Stop", for: .normal)
            let url = Bundle.main.url(forResource: "click", withExtension: "mp3")
            let cfSoundURL = url as! CFURL
            var soundID: SystemSoundID = 0

            selectKey(songKey: (selectedSong?.key)!) // The key of the saved song could be different from the current selected key
            replayIndex = 0  
            createTimer()
        }
    }
    private func changeColorTension(tensionNo: Int, color: Character){
        switch tensionNo{
        case 0:
            switch color{
            case "g":
                t1ImageView.image = UIImage(named: "1_g")
                return
            case "w":
                t1ImageView.image = UIImage(named: "1_w")
                return
            case "y":
                t1ImageView.image = UIImage(named: "1_y")
            default:
                break
                
            }
        case 1:
            switch color{
            case "g":
                t5ImageView.image = UIImage(named: "5_g")
                return
            case "w":
                t5ImageView.image = UIImage(named: "5_w")
                return
            case "y":
                t5ImageView.image = UIImage(named: "5_y")
            default:
                break
                
            }
        case 2:
            switch color{
            case "g":
                t9ImageView.image = UIImage(named: "9_g")
                return
            case "w":
                t9ImageView.image = UIImage(named: "9_w")
                return
            case "y":
                t9ImageView.image = UIImage(named: "9_y")
            default:
                break
                
            }
        case 3:
            switch color{
            case "g":
                t13ImageView.image = UIImage(named: "13_g")
                return
            case "w":
                t13ImageView.image = UIImage(named: "13_w")
                return
            case "y":
                t13ImageView.image = UIImage(named: "13_y")
            default:
                break
                
            }
        case 4:
            switch color{
            case "g":
                t3ImageView.image = UIImage(named: "3_g")
                return
            case "w":
                t3ImageView.image = UIImage(named: "3_w")
                return
            case "y":
                t3ImageView.image = UIImage(named: "3_y")
            default:
                break
                
            }
        case 5:
            switch color{
            case "g":
                t7ImageView.image = UIImage(named: "7_g")
                return
            case "w":
                t7ImageView.image = UIImage(named: "7_w")
                return
            case "y":
                t7ImageView.image = UIImage(named: "7_y")
            default:
                break
                
            }
        case 6:
            switch color{
            case "g":
                ts11ImageView.image = UIImage(named: "s11_g")
                return
            case "w":
                ts11ImageView.image = UIImage(named: "s11_w")
                return
            case "y":
                ts11ImageView.image = UIImage(named: "s11_y")
            default:
                break
                
            }
        case 7:
            switch color{
            case "g":
                tb9ImageView.image = UIImage(named: "b9_g")
                return
            case "w":
                tb9ImageView.image = UIImage(named: "b9_w")
                return
            case "y":
                tb9ImageView.image = UIImage(named: "b9_y")
            default:
                break
                
            }
        case 8:
            switch color{
            case "g":
                tb13ImageView.image = UIImage(named: "b13_g")
                return
            case "w":
                tb13ImageView.image = UIImage(named: "b13_w")
                return
            case "y":
                tb13ImageView.image = UIImage(named: "b13_y")
            default:
                break
                
            }
        case 9:
            switch color{
            case "g":
                ts9ImageView.image = UIImage(named: "s9_g")
                return
            case "w":
                ts9ImageView.image = UIImage(named: "s9_w")
                return
            case "y":
                ts9ImageView.image = UIImage(named: "s9_y")
            default:
                break
                
            }
        case 10:
            switch color{
            case "g":
                tb7ImageView.image = UIImage(named: "b7_g")
                return
            case "w":
                tb7ImageView.image = UIImage(named: "b7_w")
                return
            case "y":
                tb7ImageView.image = UIImage(named: "b7_y")
            default:
                break
                
            }
        case 11:
            switch color{
            case "g":
                t11ImageView.image = UIImage(named: "11_g")
                return
            case "w":
                t11ImageView.image = UIImage(named: "11_w")
                return
            case "y":
                t11ImageView.image = UIImage(named: "11_y")
            default:
                break
                
            }
        default:
            break
        }
    }
    private func changeColorSecondaryDom(secDomNum: Int, color: Character) {
        switch secDomNum {
        case 1:
            switch color {
            case "g":
                v71ImageView.image = UIImage(named: "v71_green")
                return
            case "w":
                v71ImageView.image = UIImage(named:"v71_white")
                return
            case "y":
                v71ImageView.image = UIImage(named:"v71_yellow")
                return
            default:
                break
            }
        case 3:
            switch color {
            case "g":
                v72ImageView.image = UIImage(named:"v72_green")
                return
            case "w":
                v72ImageView.image = UIImage(named:"v72_white")
                return
            case "y":
                v72ImageView.image = UIImage(named:"v72_yellow")
                return
            default:
                break
            }
        case 5:
            switch color {
            case "g":
                v73ImageView.image = UIImage(named: "v73_green")
                return
            case "w":
                v73ImageView.image = UIImage(named: "v73_white")
                return
            case "y":
                v73ImageView.image = UIImage(named: "v73_yellow")
                return
            default:
                break
            }
        case 0:
            switch color {
            case "g":
                v74ImageView.image = UIImage(named: "v74_green")
                return
            case "w":
                v74ImageView.image = UIImage(named: "v74_white")
                return
            case "y":
                v74ImageView.image = UIImage(named: "v74_yellow")
                return
            default:
                break
            }
        case 2:
            switch color {
            case "g":
                v75ImageView.image = UIImage(named: "v75_green")
                return
            case "w":
                v75ImageView.image = UIImage(named: "v75_white")
                return
            case "y":
                v75ImageView.image = UIImage(named: "v75_yellow")
                return
            default:
                break
            }
        case 4:
            switch color {
            case "g":
                v76ImageView.image = UIImage(named: "v76_green")
                return
            case "w":
                v76ImageView.image = UIImage(named: "v76_white")
                return
            case "y":
                v76ImageView.image = UIImage(named: "v76_yellow")
                return
            default:
                break
            }
        default:
            break
        }
    }
    private func goToDiminishedNote(ranDiminished: Int) {
        if beatOn <= 2 {
            DispatchQueue.main.async { [self] in
                changeColor(note: utils.getDiminished(ranDiminished, songKey), c: "y")
                changeColorDiminished(ranDiminished, "y")}
        } else {
            DispatchQueue.main.async { [self] in
                print("Dim variables: \(ranDiminished) \(key)")
                changeColor(note: utils.getDiminished(ranDiminished, songKey), c: "g")
                changeColorDiminished(ranDiminished, "g")}
        }
    }


    private func changeColorDiminished(_ diminished: Int, _ color: Character) {
        switch diminished {
        case 0:
            switch color {
            case "g":
                dimiv.image = UIImage(named: "dimivgreen")
            case "y":
                dimiv.image = UIImage(named: "dimivyellow")
            case "w":
                dimiv.image = UIImage(named: "dimivwhite")
            default:
                break
            }
        case 1:
            switch color {
            case "g":
                dimi.image = UIImage(named: "dimigreen")
            case "y":
                dimi.image = UIImage(named: "dimiyellow")
            case "w":
                dimi.image = UIImage(named: "dimiwhite")
            default:
                break
            }
        case 2:
            switch color {
            case "g":
                dimv.image = UIImage(named: "dimvgreen")
            case "y":
                dimv.image = UIImage(named: "dimvyellow")
            case "w":
                dimv.image = UIImage(named: "dimvwhite")
            default:
                break
            }
        case 3:
            switch color {
            case "g":
                dimii.image = UIImage(named: "dimiigreen")
            case "y":
                dimii.image = UIImage(named: "dimiiyellow")
            case "w":
                dimii.image = UIImage(named: "dimiiwhite")
            default:
                break
            }
        default:
            break
        }
    }

    func initUI(){
        initialHeight = self.view.frame.height
        initialCentre = self.view.center.y
            view.backgroundColor = .white
            btnSave.isHidden = true
            view.addSubview(ring)
            
            ring.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: self.view.frame.width, height: self.view.frame.width)
            
            ring.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 95)
            
//            difficultyPicker.dataSource = self
//            difficultyPicker.delegate = self
//            difficultyPicker.isHidden=true
            
     
            view.addSubview(circleView)
            circleView.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: self.view.frame.width, height: self.view.frame.width)
        circleView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

//        circleView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 90)

            if(self.view.frame.height>800){       //Different transformations for different screen sizes
                lettersViewG.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.19)
                lettersViewY.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.19)
                lettersViewW.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.19)



            }else if (self.view.frame.height == 736){
                lettersViewW.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.075)
                lettersViewG.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.075)
                lettersViewY.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.075)

                ring.transform = CGAffineTransform(translationX: 0, y: 40)

                
            }
            else if(self.view.frame.height == 667 ){
                lettersViewG.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.057)
                lettersViewY.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.057)
                lettersViewW.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height*0.057)

                ring.transform = CGAffineTransform(translationX: 0, y: 40)
            }
            circleView.isHidden = true
            ring.isHidden = true
         
            
            
            let imageNames = ["note0", "note1", "note2", "note3", "note4", "note5", "note6", "note7", "note8", "note9","note10","note11"]
            let radius: CGFloat = 0.42*self.view.frame.width  // Adjust this value to change the size of the ring
            var imageViewsG = [UIImageView]()
            var imageViewsW = [UIImageView]()
            var imageViewsY = [UIImageView]()
            
            //Putting three layers of the letters on the screen. One for the color white, another for yellow and another for green
            
            // Calculate the center of the view
            let centerX = view.bounds.midX
            let centerY = view.bounds.midY-70
        let noteWidth = 50
        let noteHeight = 50

        // Create image views and position them in a ring around the center for Green
        for i in 0..<imageNames.count {
            let note = (i + 3) % 12 //adjusting the index as the notes are added from the right
            let angle = CGFloat(i) * (CGFloat.pi * 2.0 / CGFloat(imageNames.count))
            let x = centerX + radius * cos(angle)
            let y = centerY + radius * sin(angle)
            let imageName = imageNames[note] + "g"

            switch note {
            case 0:
                note0g.image = UIImage(named: imageName)
                note0g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note0g)
                imageViewsG.append(note0g)
            case 1:
                note1g.image = UIImage(named: imageName)
                note1g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note1g)
                imageViewsG.append(note1g)
            case 2:
                note2g.image = UIImage(named: imageName)
                note2g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note2g)
                imageViewsG.append(note2g)
            case 3:
                note3g.image = UIImage(named: imageName)
                note3g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note3g)
                imageViewsG.append(note3g)
            case 4:
                note4g.image = UIImage(named: imageName)
                note4g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note4g)
                imageViewsG.append(note4g)
            case 5:
                note5g.image = UIImage(named: imageName)
                note5g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note5g)
                imageViewsG.append(note5g)
            case 6:
                note6g.image = UIImage(named: imageName)
                note6g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note6g)
                imageViewsG.append(note6g)
            case 7:
                note7g.image = UIImage(named: imageName)
                note7g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note7g)
                imageViewsG.append(note7g)
            case 8:
                note8g.image = UIImage(named: imageName)
                note8g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note8g)
                imageViewsG.append(note8g)
            case 9:
                note9g.image = UIImage(named: imageName)
                note9g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note9g)
                imageViewsG.append(note9g)
            case 10:
                note10g.image = UIImage(named: imageName)
                note10g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note10g)
                imageViewsG.append(note10g)
            case 11:
                note11g.image = UIImage(named: imageName)
                note11g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note11g)
                imageViewsG.append(note11g)
            default:
                note0g.image = UIImage(named: imageName)
                note0g.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewG.addSubview(note0g)
                imageViewsG.append(note0g)
            }
        }

        // Create image views and position them in a ring around the center for Yellow
        for i in 0..<imageNames.count {
            let note = (i + 3) % 12 // adjusting the index as the notes are added from the right
            let angle = CGFloat(i) * (CGFloat.pi * 2.0 / CGFloat(imageNames.count))
            let x = centerX + radius * cos(angle)
            let y = centerY + radius * sin(angle)
            let imageName = imageNames[note] + "y"

            switch note {
            case 0:
                note0y.image = UIImage(named: imageName)
                note0y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note0y)
                imageViewsY.append(note0y)
            case 1:
                note1y.image = UIImage(named: imageName)
                note1y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note1y)
                imageViewsY.append(note1y)
            case 2:
                note2y.image = UIImage(named: imageName)
                note2y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note2y)
                imageViewsY.append(note2y)
            case 3:
                note3y.image = UIImage(named: imageName)
                note3y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note3y)
                imageViewsY.append(note3y)
            case 4:
                note4y.image = UIImage(named: imageName)
                note4y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note4y)
                imageViewsY.append(note4y)
            case 5:
                note5y.image = UIImage(named: imageName)
                note5y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note5y)
                imageViewsY.append(note5y)
            case 6:
                note6y.image = UIImage(named: imageName)
                note6y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note6y)
                imageViewsY.append(note6y)
            case 7:
                note7y.image = UIImage(named: imageName)
                note7y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note7y)
                imageViewsY.append(note7y)
            case 8:
                note8y.image = UIImage(named: imageName)
                note8y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note8y)
                imageViewsY.append(note8y)
            case 9:
                note9y.image = UIImage(named: imageName)
                note9y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note9y)
                imageViewsY.append(note9y)
            case 10:
                note10y.image = UIImage(named: imageName)
                note10y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note10y)
                imageViewsY.append(note10y)
            case 11:
                note11y.image = UIImage(named: imageName)
                note11y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note11y)
                imageViewsY.append(note11y)
            default:
                note0y.image = UIImage(named: imageName)
                note0y.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewY.addSubview(note0y)
                imageViewsY.append(note0y)
            }
        }

        // Create image views and position them in a ring around the center for White
        for i in 0..<imageNames.count {
            let note = (i + 3) % 12 // adjusting the index as the notes are added from the right
            let angle = CGFloat(i) * (CGFloat.pi * 2.0 / CGFloat(imageNames.count))
            let x = centerX + radius * cos(angle)
            let y = centerY + radius * sin(angle)
            let imageName = imageNames[note] + "w"

            switch note {
            case 0:
                note0w.image = UIImage(named: imageName)
                note0w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note0w)
                imageViewsW.append(note0w)
            case 1:
                note1w.image = UIImage(named: imageName)
                note1w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note1w)
                imageViewsW.append(note1w)
            case 2:
                note2w.image = UIImage(named: imageName)
                note2w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note2w)
                imageViewsW.append(note2w)
            case 3:
                note3w.image = UIImage(named: imageName)
                note3w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note3w)
                imageViewsW.append(note3w)
            case 4:
                note4w.image = UIImage(named: imageName)
                note4w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note4w)
                imageViewsW.append(note4w)
            case 5:
                note5w.image = UIImage(named: imageName)
                note5w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note5w)
                imageViewsW.append(note5w)
            case 6:
                note6w.image = UIImage(named: imageName)
                note6w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note6w)
                imageViewsW.append(note6w)
            case 7:
                note7w.image = UIImage(named: imageName)
                note7w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note7w)
                imageViewsW.append(note7w)
            case 8:
                note8w.image = UIImage(named: imageName)
                note8w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note8w)
                imageViewsW.append(note8w)
            case 9:
                note9w.image = UIImage(named: imageName)
                note9w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note9w)
                imageViewsW.append(note9w)
            case 10:
                note10w.image = UIImage(named: imageName)
                note10w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note10w)
                imageViewsW.append(note10w)
            case 11:
                note11w.image = UIImage(named: imageName)
                note11w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note11w)
                imageViewsW.append(note11w)
            default:
                note0w.image = UIImage(named: imageName)
                note0w.frame = CGRect(x: x - 25, y: y - 25, width: CGFloat(noteWidth), height: CGFloat(noteHeight))
                lettersViewW.addSubview(note0w)
                imageViewsW.append(note0w)
            }
        }

        
            //        adding rotation to the images accordingly
            
            for i in 0...11{
                let index=(i+9)%12
                imageViewsG[index].transform=imageViewsG[index].transform.rotated(by: CGFloat(CGFloat(i)*CGFloat.pi/CGFloat(6)))
                
            }
            for i in 0...11{
                let index=(i+9)%12
                imageViewsY[index].transform=imageViewsY[index].transform.rotated(by: CGFloat(CGFloat(i)*CGFloat.pi/CGFloat(6)))

            }
            for i in 0...11{
                let index=(i+9)%12
                imageViewsW[index].transform=imageViewsW[index].transform.rotated(by: CGFloat(CGFloat(i)*CGFloat.pi/CGFloat(6)))

            }
        

            circleView.addSubview(lettersViewG)
            circleView.addSubview(lettersViewY)
            circleView.addSubview(lettersViewW)
            
            note0g.isHidden = true
            note1g.isHidden = true
            note2g.isHidden = true
            note3g.isHidden = true
            note4g.isHidden = true
            note5g.isHidden = true
            note6g.isHidden = true
            note7g.isHidden = true
            note8g.isHidden = true
            note9g.isHidden = true
            note10g.isHidden = true
            note11g.isHidden = true
            
            note0y.isHidden = true
            note1y.isHidden = true
            note2y.isHidden = true
            note3y.isHidden = true
            note4y.isHidden = true
            note5y.isHidden = true
            note6y.isHidden = true
            note7y.isHidden = true
            note8y.isHidden = true
            note9y.isHidden = true
            note10y.isHidden = true
            note11y.isHidden = true


            imageView.isHidden = true
            imageView.isHidden = true
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            if(self.view.frame.height<800){
                imageView.transform = CGAffineTransform(translationX: 0, y: 40)

            }
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 250),
                imageView.heightAnchor.constraint(equalToConstant: 250)
            ])
            
            imageView.addSubview(centre)
            centre.translatesAutoresizingMaskIntoConstraints=false
            centre.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            NSLayoutConstraint.activate([
                centre.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                centre.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                centre.widthAnchor.constraint(equalToConstant: 100),
                centre.heightAnchor.constraint(equalToConstant: 100)
            ])

            NSLayoutConstraint.activate([
                centre.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                centre.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                centre.widthAnchor.constraint(equalToConstant: 100),
                centre.heightAnchor.constraint(equalToConstant: 100)
            ])

            imageView.addSubview(v71ImageView)
            v71ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v71ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 40),
                v71ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -65),
                v71ImageView.widthAnchor.constraint(equalToConstant: 35),
                v71ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])
            //v71ImageView.alpha = 0
            imageView.addSubview(v75ImageView)
            v75ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v75ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 60),
                v75ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -35),
                v75ImageView.widthAnchor.constraint(equalToConstant: 35),
                v75ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])
            //v74ImageView.alpha = 0
            imageView.addSubview(v74ImageView)
            v74ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v74ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                v74ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -70),
                v74ImageView.widthAnchor.constraint(equalToConstant: 35),
                v74ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])
            //v72ImageView.alpha = 0
            imageView.addSubview(v72ImageView)
            v72ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v72ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 70),
                v72ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                v72ImageView.widthAnchor.constraint(equalToConstant: 35),
                v72ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])
            //v76ImageView.alpha = 0
            imageView.addSubview(v76ImageView)
            v76ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v76ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 60),
                v76ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 35),
                v76ImageView.widthAnchor.constraint(equalToConstant: 35),
                v76ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])
            //v73ImageView.alpha = 0
            imageView.addSubview(v73ImageView)
            v73ImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v73ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 40),
                v73ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 65),
                v73ImageView.widthAnchor.constraint(equalToConstant: 35),
                v73ImageView.heightAnchor.constraint(equalToConstant: 35)
            ])

            //dimii.alpha = 0
            imageView.addSubview(dimii)
            dimii.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dimii.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -70),
                dimii.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -17),
                dimii.widthAnchor.constraint(equalToConstant: 35),
                dimii.heightAnchor.constraint(equalToConstant: 35)
            ])
            //dimv.alpha = 0
            imageView.addSubview(dimv)
            dimv.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dimv.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -65),
                dimv.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 23),
                dimv.widthAnchor.constraint(equalToConstant: 35),
                dimv.heightAnchor.constraint(equalToConstant: 35)
            ])
            //dimi.alpha = 0
            imageView.addSubview(dimi)
            dimi.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dimi.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -40),
                dimi.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 60),
                dimi.widthAnchor.constraint(equalToConstant: 35),
                dimi.heightAnchor.constraint(equalToConstant: 35)
            ])
            //dimii.alpha = 0
            imageView.addSubview(dimiv)
            dimiv.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dimiv.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                dimiv.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 80),
                dimiv.widthAnchor.constraint(equalToConstant: 35),
                dimiv.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        
            // For displaying the tensions
        let tensionImageViews = [t1ImageView, t5ImageView, t9ImageView, t13ImageView, t3ImageView, t7ImageView, ts11ImageView, tb9ImageView, tb13ImageView, ts9ImageView, tb7ImageView, t11ImageView]
        positionTensionImageViews(tensionImageViews, in: centre)

        

        

            makeSecondaryDominantsVisible(false)
            makeDiminishedNotesVisible(false)
            txtBarOn.center = CGPoint(x: centerX, y: centerY-30)
                txtBarOn.textAlignment = .center
            if(self.view.frame.height<800)
            {
                txtBarOn.transform = CGAffineTransform(translationX: 0, y: 40)

            }
            self.view.addSubview(txtBarOn)

            
           

        }
    func positionTensionImageViews(_ imageViews: [UIImageView], in imageView: UIView) {
        let radius = CGFloat(31)
        let centerX = imageView.bounds.midX
        let centerY = imageView.bounds.midY
        let angleIncrement = 2 * CGFloat.pi / CGFloat(imageViews.count)
        
        for (index, tensionView) in imageViews.enumerated() {
            tensionView.translatesAutoresizingMaskIntoConstraints = false
            imageView.addSubview(tensionView)
            
            let angle = CGFloat(index) * angleIncrement - CGFloat.pi / 2 // Adjust for starting position at 12 o'clock
            let xPosition = centerX + radius * cos(angle)
            let yPosition = centerY + radius * sin(angle)
            
            tensionView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: xPosition - centerX).isActive = true
            tensionView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: yPosition - centerY).isActive = true
            tensionView.widthAnchor.constraint(equalToConstant: 15).isActive = true
            tensionView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        NSLog("View did appear")

        noteOn = songKey

        if(selectedSong != nil){
            selectSong()
        }else{
            songKey = key
            selectKey(songKey: songKey)

        }

        NSLog("Rotation angle: \(rotationAngle)")
        adjustWheelPosition()


    }
       
    var rotationAngle: CGFloat = 0.0

    func selectKey(songKey: String) {
        circleView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        circleView.transform = CGAffineTransform.identity

        switch songKey {
        case "C":
            rotationAngle = 0
        case "G":
            rotationAngle = CGFloat.pi * (30 * 11) / 180
        case "D":
            rotationAngle = CGFloat.pi * (30 * 10) / 180
        case "A":
            rotationAngle = CGFloat.pi * (30 * 9) / 180
        case "E":
            rotationAngle = CGFloat.pi * (30 * 8) / 180
        case "B":
            rotationAngle = CGFloat.pi * (30 * 7) / 180
        case "F#":
            rotationAngle = CGFloat.pi * (30 * 6) / 180
        case "Db":
            rotationAngle = CGFloat.pi * (30 * 5) / 180
        case "Ab":
            rotationAngle = CGFloat.pi * (30 * 4) / 180
        case "Eb":
            rotationAngle = CGFloat.pi * (30 * 3) / 180
        case "Bb":
            rotationAngle = CGFloat.pi * (30 * 2) / 180
        case "F":
            rotationAngle = CGFloat.pi * 30 / 180
        default:
            rotationAngle = 0
        }
        NSLog("Height: \(self.view.frame.height)")
     

        // Apply the rotation transform to the circleView
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.circleView.transform = .identity

            self?.circleView.transform = self?.circleView.transform.rotated(by: self!.rotationAngle) ?? .identity
        }
    
    
    }
    func adjustWheelPosition(){
        NSLog("Centre: \(self.view.center.y)")
        switch(initialHeight!){
//        case 932: circleView.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 95)
//            break
        // When a different key was selected on the XS, the letters were shifted. The following case statements are to fix that. Values were found through trial and error
        case 812:
            switch(songKey){
                case "C":
                    circleView.center = CGPoint(x: self.view.center.x, y: initialCentre! - 90)
                case "D":
                    circleView.center = CGPoint(x: self.view.center.x+5, y: initialCentre! - 90)
                case "A":
                    circleView.center = CGPoint(x: self.view.center.x+4, y: initialCentre! - 93)
                case "B":
                    circleView.center = CGPoint(x: self.view.center.x+3, y: initialCentre! - 100)
                case "F#":
                    circleView.center = CGPoint(x: self.view.center.x-3, y: initialCentre! - 100)
                case "E":
                    circleView.center = CGPoint(x: self.view.center.x+4, y: initialCentre! - 100)
                case "Db":
                    circleView.center = CGPoint(x: self.view.center.x-4, y: initialCentre! - 100)
                case "Eb":
                    circleView.center = CGPoint(x: self.view.center.x-5, y: initialCentre! - 96)
                case "Bb":
                    circleView.center = CGPoint(x: self.view.center.x-3, y: initialCentre! - 90)
                case "F":
                    circleView.center = CGPoint(x: self.view.center.x, y: initialCentre! - 90)
                default:
                    circleView.center = CGPoint(x: self.view.center.x, y: initialCentre! - 90)

                    break
                }
        default:
            circleView.center = CGPoint(x: self.view.center.x, y: initialCentre! - 95)


        }

    }

    func unlockPremiumVersion(){
//        btnLevel.isHidden = false
        buttonsView.isHidden = false
        labelBPM.isHidden = false
        slider.isHidden = false
        ring.isHidden = false
        circleView.isHidden = false
        imageView.isHidden = false
        centre.isHidden = false
        
        
        
    }
    
    func initProbabilityList() {
        //Probabilities of going to different notes from the 1
        // Probabilities of going to different notes from each starting note
        probabilityList1 = [3, 3, 3, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 7]
        probabilityList2 = [1, 1, 1, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7]
        probabilityList3 = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 4, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 7]
        probabilityList4 = [1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 5, 5, 5, 5, 6, 6, 7, 7, 7]
        
        
        
        //Probabilities of going to different notes from the 5
        probabilityList5 += [1, 1, 1, 1, 1, 1]
        probabilityList5 += [2, 2, 2, 2]
        probabilityList5 += [3, 3, 3, 3]
        probabilityList5 += [4, 4, 4, 4]
        probabilityList5 += [6]
        probabilityList5 += [7]
        // Probabilities of going to different notes from the 6
        probabilityList6 += [1, 1, 1, 1, 1, 1]
        probabilityList6 += [2, 2, 2, 2]
        probabilityList6 += [3, 3, 3, 3]
        probabilityList6 += [4, 4, 4, 4]
        probabilityList6 += [5]
        probabilityList6 += [7]
        
        // Probabilities of going to different notes from the 7
        probabilityList7 += [1, 1, 1, 1, 1, 1]
        probabilityList7 += [2, 2, 2, 2]
        probabilityList7 += [3]
        probabilityList7 += [4, 4, 4, 4]
        probabilityList7 += [5]
        probabilityList7 += [6, 6, 6, 6]
        
        // Probabilities of going to different notes from the different diminished notes. -1 means the secondary dominant. The probability of coming from that note to the diminished note is the same as going from the diminished note to that note
        probabilityListDimSharpV += [-1, 7, 6, 6]
        
        probabilityListDimSharpI += [-1, 3, 2, 2]
        
        probabilityListDimSharpIV += [-1, 6, 5, 5]
        
        probabilityListDimSharpII += [-1, 7, 3, 3]
    }
    @IBAction func sliderReleased(_ sender: Any) {
        print("Slider released")
        var sliderValue = slider.value
        sliderValue=sliderValue*100
        bpmText=Int(sliderValue)
        labelBPM.text=String(Int(sliderValue))
        timeInterval = 60.0 / Double(bpmText)
        metronome.bpm = UInt(bpmText/4)
//        if(isController){
//           let bpmData = Data(Data(bytes: &timeInterval, count: MemoryLayout<Float>.size))
//            sendData(data: bpmData)
//        }
    
        if(gameStarted){
            metronome.on = true
            if beat >= 4 {
                beat = 1
            } else {
                beat += 1
            }
            beatOn += 1
            if beatOn > 4 {
                barOn += 1
                print("increasing bar on to :\(barOn)")
                beatOn = 1
            }
        
           // timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(startGame), userInfo: nil, repeats: true) // Recreate the timer with the updated time interval
        }
      
        NSLog("slider " + String(sliderValue))
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        print("Slider touched")
        timer?.invalidate()

        metronome.on = false
       
    }
    private func initTurnAroundLists() {
        //These are the outros. Either of the 4 will be played based on a 1/4 probability
        turnaroundList1.append(1)
        turnaroundList1.append(6)
        turnaroundList1.append(2)
        turnaroundList1.append(5)

        turnaroundList2.append(3)
        turnaroundList2.append(5)

        turnaroundList3.append(6)
        turnaroundList3.append(5)

        turnaroundList4.append(1)
        turnaroundList4.append(5)

        let r = Int.random(in: 0..<3)
        turnaroundRandom = r
    }
    private func songMode(song: [SongChord], bar: Int, beat: Int){
      
        let nextStepAndTension = utils.getNoteAndTension(song: song, bar: bar, beat: beat)
        let nextStep = (nextStepAndTension?.note)!
        let tension = (nextStepAndTension?.tension)!
        savedProgression.append(noteFromNumber(n: nextStep))
        tensions.append(tension)
        
        
        
    }
    private func beginnerDifficulty(_ bar :Int) {
        if nextNote == "" {
            nextNote = songKey  //initializing
        }
        if !isPeer {
            if !replayGame {
                //todo the default (1) gets returned sometimes here. Fix!
                let step = Utils().getStepFromNote(key: songKey, note: nextNote)   //The step is either a first, second, third, fourth, fifth, sixth of seventh. We need to find if the note we are on is which 'step' of the key
    //            NSLog("step " + String(step))
                var nextStep = 0
                switch step {
                    case 1:
                    nextStep = probabilityList1.randomElement()!
                    case 2:
                    nextStep = probabilityList2.randomElement()!
                    case 3:
                    nextStep = probabilityList3.randomElement()!
                    case 4:
                    nextStep = probabilityList4.randomElement()!
                    case 5:
                    nextStep = probabilityList5.randomElement()!
                    case 6:
                    nextStep = probabilityList6.randomElement()!
                    case 7:
                    nextStep = probabilityList7.randomElement()!
                    default:
                        break
                }
    //            NSLog("Next step "+String(nextStep))
                if bar == 1 || bar == 5  || bar == 9{
                    nextNote = getNoteFromInterval(interval: nextStep)
                }
                savedProgression.append(nextNote)
            } else {
                if replayIndex < savedProgression.count {
                    nextNote = savedProgression[replayIndex]
                    replayIndex += 1
                } else {
                    restartGame()
                    replayGame = true
                }
            }
            if replayIndex >= savedProgression.count + 1 {  //adding 1 as the tonic is not in the array
                restartGame()
                replayGame = true
            }
          
            
        }
       print("Next note from beginner difficulty: \(nextNote)")
    }
   
    func intermediateDifficulty(_ bar: Int){
        if !replayGame {
            print("Random sec dom: \(randomSecDom)")
            print("Bar on: \(barOn)")
            if bar < 2 {
            
                if(!isPeer){  //added without testing
                    let random1 = Int.random(in: 0...2)    // There is an equal chance for it to go either to the first, third, or sixth
                    switch random1 {
                    case 0:
                        nextNote = noteFromNumber(n: Utils().getFirst(songKey))
                        savedProgression.append(nextNote)
                        break;
                    case 1:
                        nextNote = noteFromNumber(n: Utils().getThird(songKey))
                        savedProgression.append(nextNote)
                        break;
                    case 2:
                        nextNote = noteFromNumber(n: Utils().getSixth(songKey))
                        savedProgression.append(nextNote)
                        break;
                    default:
                        break;
                    }
                }
                   
            } else if bar == 2 {
                if(!isPeer){
                    randomSecDom = Int.random(in: 0...5)      // One of 6 secondary dominants will be chosen
                }
                print("random sec dom: \(randomSecDom)")

                if(!isPeer){
                    nextNote = noteFromNumber(n: Utils().getSecondaryDominant(secondaryDominantNumber: randomSecDom, key: songKey))
                    savedProgression.append(nextNote)
                }
               
            } else if bar == 3 {
                if(!isPeer){
                    nextNote = noteFromNumber(n: Utils().getDominant(secondaryDominant: randomSecDom, key: songKey))
                    savedProgression.append(nextNote)
                    difficultySelection = -1 // -1 is a temporary difficulty for the intermediate section. The fifth and sixth bars in the intermediate section will be identical to the beginner section
                }
               
            } else if bar >= 6 {    // We will check from the 6 note onwards as the turn around starts on bar 7. We will decide the next note here
                if turnaroundRandom == 0 {    // the first turn around list has 4 elements, so we check for it separately
                    if turnaroundListCounter >= 4 {
                        return
                    }
                } else {
                    if turnaroundListCounter >= 2 {
                
                        return
                    }
                }

                if(!isPeer){
                    switch turnaroundRandom {
                    case 0:
                        nextNote = getNoteFromInterval(interval: turnaroundList1[turnaroundListCounter])
                        savedProgression.append(nextNote)
                        break;
                    case 1:
                        nextNote = getNoteFromInterval(interval: turnaroundList2[turnaroundListCounter])
                        savedProgression.append(nextNote)
                        break;
                    case 2:
                        nextNote = getNoteFromInterval(interval: turnaroundList3[turnaroundListCounter])
                        savedProgression.append(nextNote)
                        break;
                    case 3:
                        nextNote = getNoteFromInterval(interval: turnaroundList4[turnaroundListCounter])
                        savedProgression.append(nextNote)
                        break;
                    default:
                        break;
                    }
                    turnaroundListCounter += 1
                }
                
//                NSLog("intermediateDifficulty: next note" + String(nextNote))
            }
        } else {
            if replayIndex < savedProgression.count {
                if barOn < 2 {
                    DispatchQueue.main.async { [self] in
                        changeColorSecondaryDom(secDomNum: randomSecDom, color: "w")
                    }
                } else if barOn == 2 {
                    DispatchQueue.main.async { [self] in
                        changeColorSecondaryDom(secDomNum: randomSecDom, color: "y")
                    }
                } else if barOn == 3 {
                    DispatchQueue.main.async { [self] in
                        changeColorSecondaryDom(secDomNum: randomSecDom, color: "g")
                    }
                    nextNote = noteFromNumber(n: Utils().getDominant(secondaryDominant: randomSecDom, key: songKey))
                    difficultySelection = -1
                    replayIndex += 1
                    return
                }
                nextNote = savedProgression[replayIndex]
                replayIndex += 1
            }
            
        }

    }
    private func advancedDifficulty(_ bar: Int) {
        if !replayGame {
            if bar < 2 {
        
                if(!isPeer){
                    let random1 = Int.random(in: 0...2) // There is an equal chance for it to go either to the first, third, or sixth
                    switch random1 {
                    case 0:
                        nextNote = noteFromNumber(n: utils.getFirst(songKey))
                        savedProgression.append(nextNote)
                        break;
                    case 1:
                        nextNote = noteFromNumber(n: utils.getThird(songKey))
                        savedProgression.append(nextNote)
                        break;
                    case 2:
                        nextNote = noteFromNumber(n: utils.getSixth(songKey))
                        savedProgression.append(nextNote)
                        break;
                    default:
                        break;
                    }
                }
               

            } else if bar == 2 {
                if(!isPeer){
                    randomSecDom = Int.random(in: 0...5) // One of 6 secondary dominants will be chosen
                    nextNote = noteFromNumber(n: utils.getSecondaryDominant(secondaryDominantNumber: randomSecDom, key: songKey))
                    savedProgression.append(nextNote)
                }
            } else if bar == 3 {
                if(!isPeer){
                    nextNote = noteFromNumber(n: utils.getDominant(secondaryDominant: randomSecDom, key: songKey))
                    savedProgression.append(nextNote)
                }

            }
        } else {
            if replayIndex < savedProgression.count {
                if bar < 2 {
                    onSecondaryDominant = false
                    DispatchQueue.main.async { [self] in
                        changeColorSecondaryDom(secDomNum: randomSecDom, color: "w")}
                } else if barOn == 2 {
                    DispatchQueue.main.async { [self] in
                        changeColorSecondaryDom(secDomNum: randomSecDom, color: "y")}
                } else if barOn == 3 {
                    onSecondaryDominant = true
                    DispatchQueue.main.async {
                        self.changeColorSecondaryDom(secDomNum: self.randomSecDom, color: "g")
                    }
                    onSecondaryDominant = false
                }
                nextNote = savedProgression[replayIndex]
                replayIndex += 1

            } else {
                restartGame()
                replayGame = true

            }
            if replayIndex >= savedProgression.count + 1 { // adding 1 as the tonic is not in the array
                replayGame = true
                restartGame()

            }
        }
    }

    func createTimer(){
        if(difficultySelection != 1){ // checking if we haven;t selected song mode
            for bar in 1...12{
                if (bar>=5 && difficultySelection == -1){  // The intermediate diffficluty will be similar to the beginner difficulty for bars 5 and 6
                    difficultySelection = 2
                }
                switch difficultySelection {
                case 2:
                    intermediateDifficulty(bar)
                case -1:   //This is the modified case in the advanced difficulty, which works like the beginner difficulty for the first few bars
                    if barOn >= 5 {
                        difficultySelection = 2
                    }
                    beginnerDifficulty(bar)
                case 3:
                    advancedDifficulty(bar)
                    if bar == 2 {
                        if !replayGame {
                            if(!isPeer){
                                ranDiminished = Int.random(in: 0..<3)
                                goToDiminished = Int.random(in: 0..<3)
                            }
                        }
                    }
                   
                default:
                    break
                }
            }
        }else{
            transposeSongToSelectedKey()
            for barIndex in 0..<utils.numberOfBars(in: selectedSongForSongMode) {
                for beat in 0...3{
                    songMode(song: selectedSongForSongMode, bar: barIndex, beat: beat)
                }
            }
        }
    
        if(isController){
            dataToSend["key"] = songKey
            NSLog("Sending key"+songKey)
            dataToSend["progression"] = savedProgression.joined(separator: ",")
            dataToSend["difficulty"] = difficultySelection
            dataToSend["ranSecDom"] = randomSecDom
            dataToSend["ranDim"] = ranDiminished
            dataToSend["goToDim"] = goToDiminished
            dataToSend["bpm"] = timeInterval
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: dataToSend, requiringSecureCoding: false)
                sendData(data: data)

            } catch {
                print("Error encoding data: \(error)")
            }
            

        }
        countdown = 5
        //self.metronome.on = true
        print(savedProgression)
        print(tensions)
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(startGame), userInfo: nil, repeats: true)
      

        timer?.tolerance = 0.01
       
       
    }
    private func transposeSongToSelectedKey(){
        var interval = utils.getFirst(songKey)
        selectedSongForSongMode = utils.transposeSong(chords: selectedSongForSongMode, interval: interval)
    }
    var countdown = 0;
    @objc func startGame(){
        if(countdown>1){
            if(isFirstLoop){
                metronome.on = true
                isFirstLoop = false
            }
            DispatchQueue.main.async { [self] in
                txtBarOn.text = "\(countdown)"
                
            }
            countdown -= 1
        }else{
            
            NSLog("Start Game")
            
            if (barOn == savedProgression.count+2) {
                restartGame()
                replayGame = true
            }
            print("beat on: \(beatOn) \(currentTimeFormatted())")
            loopEnded = false
            print("Bar on: \(barOn)")
            //AudioManager.shared.startAudio()
          
            DispatchQueue.global(qos: .background).async { [self] in
                    if self.beat == 1 {
                        DispatchQueue.main.async { [self] in
                            txtBarOn.text = "\(barOn)"
                            
                        }
                        
                        DispatchQueue.main.async { [self] in
                            self.resetWheel()
                            //                        NSLog("Turning note " + String(self.noteOn) + "green")
                        }
                        if(difficultySelection != 1 ){ // todo change
                            startRandomMode()
                        }
                        
                        
                        
                    }
                    else {
                        if difficultySelection == 3 && barOn == 2 {
                            goToDiminishedNote(ranDiminished: ranDiminished)
                        }
                    }
                    if barOn == 3 {
                        DispatchQueue.main.async { [self] in
                            self.changeColorDiminished(self.ranDiminished, "w")
                        }
                    }
                if(difficultySelection == 1){
                    startSongMode()

                }

                
                
               
                
                if beat >= 4 {
                    beat = 1
                } else {
                    beat += 1
                }
                beatOn += 1
                if beatOn > 4 {
                    barOn += 1
                    print("increasing bar on to :\(barOn)")
                    beatOn = 1
                }
                
                noteOn = nextNote
                
            }
            
            self.loopEnded = true
        }
  
        
        
    }
    private func rotateTensionWheel(note: String){
        print("Note to rotate to: " + note.description)
        switch note {
        case "C":
            rotationAngle = 0
        case "G":
            rotationAngle = CGFloat.pi * (30 * 11) / 180
        case "D":
            rotationAngle = CGFloat.pi * (30 * 10) / 180
        case "A":
            rotationAngle = CGFloat.pi * (30 * 9) / 180
        case "E":
            rotationAngle = CGFloat.pi * (30 * 8) / 180
        case "B":
            rotationAngle = CGFloat.pi * (30 * 7) / 180
        case "F#":
            rotationAngle = CGFloat.pi * (30 * 6) / 180
        case "Db":
            rotationAngle = CGFloat.pi * (30 * 5) / 180
        case "Ab":
            rotationAngle = CGFloat.pi * (30 * 4) / 180
        case "Eb":
            rotationAngle = CGFloat.pi * (30 * 3) / 180
        case "Bb":
            rotationAngle = CGFloat.pi * (30 * 2) / 180
        case "F":
            rotationAngle = CGFloat.pi * 30 / 180
        default:
            rotationAngle = 0
        }
     

        // Apply the rotation transform to the circleView
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.centre.transform = .identity

            self?.centre.transform = self?.centre.transform.rotated(by: -self!.rotationAngle) ?? .identity
        }
    
    }
    private func startSongMode(){
        DispatchQueue.main.async{ [self] in
            self.resetWheel()
            if(self.beatFromStart == 1){
                self.changeColor(note: self.utils.getFirst(self.savedProgression[0]), c: "g")
                self.changeColorTension(tensionNo: tensions[1], color: "y")

            }else{
               
                //if(beatOn == 1){
                    self.changeColor(note: self.utils.getFirst(self.savedProgression[self.beatFromStart - 1]), c: "y")
                    self.changeColorTension(tensionNo: tensions[self.beatFromStart - 1], color: "y")
                self.changeColor(note: self.utils.getFirst(self.savedProgression[self.beatFromStart - 2]), c: "g")
                self.changeColorTension(tensionNo: tensions[self.beatFromStart - 2], color: "g")
                rotateTensionWheel(note: self.savedProgression[self.beatFromStart - 1])
                
               // }
               


            }
        }
        print("Switching to note : " + (self.savedProgression[self.beatFromStart]))
        print("Beat on from start: " + String(beatFromStart))
        beatFromStart += 1
        
    }
    private func startRandomMode(){
        DispatchQueue.main.async { [self] in
            if(self.barOn == 1){
                self.changeColor(note: self.utils.getFirst(self.songKey), c: "g")
                self.changeColor(note: self.utils.getFirst(self.savedProgression[self.barOn-1]), c: "y")
            }else{
                if(self.barOn == savedProgression.count+1){
                    self.changeColor(note: self.utils.getFirst(self.songKey), c: "y")
                }else{
                    self.changeColor(note: self.utils.getFirst(self.savedProgression[self.barOn-1]), c: "y")
                    
                }
                self.changeColor(note: self.utils.getFirst(self.savedProgression[self.barOn-2]), c: "g")
            }
        }
        if(difficultySelection==2 || difficultySelection==3){
            
            if barOn==3 {
                DispatchQueue.main.async {
                    self.changeColorSecondaryDom(secDomNum: self.randomSecDom, color: "g")
                    
                }
            }
            if barOn == 2{
                DispatchQueue.main.async {
                    self.changeColorSecondaryDom(secDomNum: self.randomSecDom, color: "y")
                }
            }
            if(barOn<2 || barOn>3){
                DispatchQueue.main.async {
                    self.changeColorSecondaryDom(secDomNum: self.randomSecDom, color: "w")
                }
                
            }
            
        }

    }
  
   
   
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


// For game multiplayer capability
extension GameViewController : MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("\(peerID) state: \(state)")
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        isPeer = true
        isController = false
        // The stopGame signal has been sent
        if(data.first == 1){
            stopGame()
        }
       
        do {
            if let receivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String: Any] {
                let songKeySent = receivedData["key"] as? String
                let difficulty = receivedData["difficulty"] as? Int
                let ranSecDom = receivedData["ranSecDom"] as? Int
                let ranDim = receivedData["ranDim"] as? Int
                let goToDim = receivedData["goToDim"] as? Int
                let progression = receivedData["progression"] as? String
                let bpm = receivedData["bpm"] as? Double
                self.songKey = songKeySent!
                self.timeInterval = bpm!
                NSLog("Key sent: "+self.songKey)
                DispatchQueue.main.async {
                    self.selectKey(songKey: self.songKey)
                }
                if(barOn == 1 && beatOn == 1 && isFirstLoop == true){
                    
                    DispatchQueue.main.async {
                      
                        print("Setting difficulty: \(difficulty!-1)")
                        self.difficultySelection = difficulty!

                        switch(self.difficultySelection){
                        case 1:
                            self.makeSecondaryDominantsVisible(false);
                            self.makeDiminishedNotesVisible(false)
                            break
                        case 2:
                            self.makeSecondaryDominantsVisible(true);
                            self.makeDiminishedNotesVisible(false);
                            break
                        case 3:
                            self.makeDiminishedNotesVisible(true);
                            self.makeSecondaryDominantsVisible(true);
                            break
                        default:
                            self.makeSecondaryDominantsVisible(false);
                            self.makeDiminishedNotesVisible(false)
                            
                        }
                        print("Difficulty selection: \(self.difficultySelection)")
                        print("Next note: \(self.nextNote)")
                        self.randomSecDom = ranSecDom!
                        self.ranDiminished = ranDim!
                        self.goToDiminished = goToDim!
                        self.savedProgression = (progression?.components(separatedBy: ","))!
                        self.createTimer()

                    }
                }                // Access other variables using their keys
            }
        } catch {
            print("Error decoding data: \(error)")
        }

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
   
//    func initPD(){
//        if let mainBundlePath = Bundle.main.resourcePath {
//            // Load the metronome.pd file
//            metronome = PDMetronome(bpm: 60, andSubdivisions: 0)
//        
//            // If the patch doesn't load, throw an alert with an error
//            if metronome == nil {
//                let alert = UIAlertController(title: "Error", message: "Patch not found", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                // Show the alert
//                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//            }else{
//                metronome.setOn(true)
//            }
//        }

         


   // }
    
    
}
