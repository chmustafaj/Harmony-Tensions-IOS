//
//  GameViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 13/02/2023.
//

import UIKit
import SwiftUI

class GameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private var difficultySelection = 1
    let circleView = UIImageView()
    let lettersView = UIView()
    let utils = Utils()
    let difficulties = ["Level 1","Level 2","Level 3"]
    var nextNote: String=""
    var nextStep = 0
    var bpm = Int()
    var beatOn = 1
    var barOn = 1
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
    var beat = 1 //'beat' will allow us to play the metronome sound and update the textview, and update the notes after every 4 beats
    var loopEnded = true //To make sure the loop is completed before starting it again, or else 2 loops will go on at the same time
    var randomSecDom = 0
    var turnaroundRandom = 0
    var gameStarted = false
    static var gameInitialized = false
    var onSecondaryDominant = false
    var replayGame = false
    var noteOn = key
    var turnaroundListCounter = 0
    var ranDiminished = 0
    var goToDiminished = 0
    var bpmText=Int()
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
    
    @IBOutlet weak var beatLabel: UILabel!
    
    @IBOutlet weak var btnStart: UIButton!
    @IBAction func btnStartPressed(_ sender: Any) {
        if(!gameStarted && loopEnded){
            btnStart.setTitle("Stop", for: .normal)
            gameStarted=true
            savedProgression.removeAll()
//            btnSave.isHidden=true
            startGame()
            
        }else{
            stopGame()
        }
    }
    
    @IBAction func btnLevelPressed(_ sender: Any) {
        btnLevel.isHidden=true
        if(difficultyPicker.isHidden){
            difficultyPicker.isHidden=false
        }
    }
    let labelBar = UILabel()
    @IBOutlet weak var difficultyPicker: UIPickerView!
    @IBOutlet weak var btnLevel: UIButton!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficulties.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficulties[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        btnLevel.setTitle(difficulties[row], for: .normal)
        difficultyPicker.isHidden=true
        btnLevel.isHidden=false

        switch(difficulties[row]){
        case "Level 1":
            difficultySelection=1
            makeSecondaryDominantsVisible(false);
            makeDiminishedNotesVisible(false)
            break
        case "Level 2":
            difficultySelection=2
            makeSecondaryDominantsVisible(true);
            makeDiminishedNotesVisible(false);
            break
        case "Level 3":
            difficultySelection=3
            makeDiminishedNotesVisible(true);
            makeSecondaryDominantsVisible(true);
            break
        default:
            makeSecondaryDominantsVisible(false);
            makeDiminishedNotesVisible(false)
            difficultySelection=1
            
        }
    }
//    let circleView = UIImageView(image: UIImage(named: "letters.jpeg"))

    override func viewDidLoad() {
        super.viewDidLoad()
        bpm = 60;  //default value
        bpmText = bpm;
        initUI()
        

      
        
    }
    func startGame(){
        loopEnded = false

        DispatchQueue.global(qos: .background).async { [self] in
//            metronomeClick.start()
            if beat == 1 {
                DispatchQueue.main.async { [self] in
                    labelBar.text = "\(barOn)"
                }
                if onSecondaryDominant {
                    DispatchQueue.main.async {
                        self.changeColorSecondaryDom(secDomNum: self.randomSecDom, color: "g")
                    }
                }
            }
            if self.beat == 1 {
//                resetWheel()
                changeColor(note: utils.getFirst(noteOn), color: "g")
                switch difficultySelection {
                case 1:
                    beginnerDifficulty()
                case 2:
                    intermediateDifficulty()
                case -1:   //This is the modified case in the advanced difficulty, which works like the beginner difficulty for the first few bars
                    if barOn >= 5 {
                        difficultySelection = 2
                    }
                    beginnerDifficulty()
                case 3:
//                    advancedDifficulty()
                    if barOn == 2 {
                        if !replayGame {
                            ranDiminished = Int.random(in: 0..<3)
                            goToDiminished = Int.random(in: 0..<3)
                        }
                        if goToDiminished == 0 {
                            goToDiminishedNote(ranDiminished: ranDiminished)
                        }
                    } else if barOn == 3 {
                        changeColorDiminished(ranDiminished, "w")
                    }
                default:
                    break
                }
            } else {
                if difficultySelection == 3 && barOn == 2 {
                    goToDiminishedNote(ranDiminished: ranDiminished)
                }
            }
            if beat >= 4 {
                beat = 1
            } else {
                beat += 1
            }
            beatOn += 1
            if beatOn > 4 {
                barOn += 1
                beatOn = 1
            }
            noteOn = nextNote
            
            changeColor(note: utils.getFirst(nextNote), color: "y")
        }
        var dispatchAfter = DispatchTimeInterval.seconds(60000 / bpmText)

        DispatchQueue.main.asyncAfter(deadline: .now() + dispatchAfter) {
            self.loopEnded = true
            if self.gameStarted {
                self.startGame()
            }
        }

        
    }
    func intermediateDifficulty(){
        
    }
    func stopGame(){
        
    }
    func changeColor(note : Int, color: Character ){
        
    }
    private func beginnerDifficulty() {
        if nextNote == "" {
            nextNote = key  //initializing
        }
        if !replayGame {
            let random = Int.random(in: 0..<20)
            let step = utils.getStepFromNote(key: key, note: nextNote)   //The step is either a first, second, third, fourth, fifth, sixth of seventh. We need to find if the note we are on is which 'step' of the key
            var nextStep = 0
            switch step {
                case 1:
                    nextStep = probabilityList1[random]
                case 2:
                    nextStep = probabilityList2[random]
                case 3:
                    nextStep = probabilityList3[random]
                case 4:
                    nextStep = probabilityList4[random]
                case 5:
                    nextStep = probabilityList5[random]
                case 6:
                    nextStep = probabilityList6[random]
                case 7:
                    nextStep = probabilityList7[random]
                default:
                    break
            }
            nextNote = getNoteFromInterval(interval: nextStep)
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
        if barOn == 12 {
            restartGame()
            replayGame = true
        }
    }
    func getNoteFromInterval(interval: Int) -> String {
        switch interval {
            case 1:
            return noteFromNumber(n: utils.getFirst(key))
            case 2:
            return noteFromNumber(n: utils.getSecond(key))
            case 3:
            return noteFromNumber(n: utils.getThird(key))
            case 4:
            return noteFromNumber(n: utils.getFourth(key))
            case 5:
            return noteFromNumber(n: utils.getFifth(key))
            case 6:
            return noteFromNumber(n: utils.getSixth(key))
            case 7:
            return noteFromNumber(n: utils.getSeventh(key))
            default:
                return ""
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
        barOn = 0  // Restart game
        turnaroundListCounter = 0
        replayIndex = 0
        turnaroundRandom = Int.random(in: 0..<3)
        nextNote = key
    }



    override func viewWillAppear(_ animated: Bool) {
        circleView.transform=CGAffineTransformIdentity
        selectKey()
        NSLog("key"+key)
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
            changeColor(note: utils.getDiminished(ranDiminished, key), color: "y")
            changeColorDiminished(ranDiminished, "y")
        } else {
            changeColor(note: utils.getDiminished(ranDiminished, key), color: "g")
            changeColorDiminished(ranDiminished, "g")
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
        view.backgroundColor = .white
    
        let ring = UIImageView(image: UIImage(named: "circle_border"))
        view.addSubview(ring)
        ring.translatesAutoresizingMaskIntoConstraints=false
        ring.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        NSLayoutConstraint.activate([
            ring.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ring.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            ring.widthAnchor.constraint(equalToConstant: 410),
            ring.heightAnchor.constraint(equalToConstant: 410)
        ])
        difficultyPicker.dataSource = self
        difficultyPicker.delegate = self
        difficultyPicker.isHidden=true

        
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 400),
            circleView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        view.addSubview(lettersView)
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lettersView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -11),
            lettersView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            lettersView.widthAnchor.constraint(equalToConstant: 400),
            lettersView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        
        let imageNames = ["note10", "note11","note0", "note1", "note2", "note3", "note4", "note5", "note6", "note7", "note8", "note9"]
            let radius: CGFloat = 170  // Adjust this value to change the size of the ring
            var imageViews = [UIImageView]()
        
        // Calculate the center of the view
        let centerX = view.bounds.midX
        let centerY = view.bounds.midY-70

        // Create image views and position them in a ring around the center
        for i in 0..<imageNames.count {
            let angle = CGFloat(i) * (CGFloat.pi * 2.0 / CGFloat(imageNames.count))
            let x = centerX + radius * cos(angle)
            let y = centerY + radius * sin(angle)
            let imageView = UIImageView(image: UIImage(named: imageNames[i]))
            imageView.frame = CGRect(x: x - 25, y: y - 25, width: 50, height: 50)  // Adjust the size of the images as needed
            lettersView.addSubview(imageView)
            imageViews.append(imageView)
        }
        circleView.addSubview(lettersView)

        let imageView = UIImageView(image: UIImage(named: "simple_hw"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        let centre = UIImageView(image: UIImage(named: "centre"))
        imageView.addSubview(centre)
        centre.translatesAutoresizingMaskIntoConstraints=false
        centre.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        NSLayoutConstraint.activate([
            centre.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            centre.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            centre.widthAnchor.constraint(equalToConstant: 100),
            centre.heightAnchor.constraint(equalToConstant: 100)
        ])

        imageView.addSubview(labelBar)
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
        makeSecondaryDominantsVisible(false)
        makeDiminishedNotesVisible(false)
       

    }


    func selectKey(){
        switch(key){
        case "c":
            circleView.transform=circleView.transform.rotated(by: CGFloat(0))
            break;
        case "g":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*11)/180))
            break;
        case "d":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*10)/180))
            break;
        case "a":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*9)/180))
            break;
        case "e":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*8)/180))
            break;
        case "b":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*7)/180))
            break;
        case "fs":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*6)/180))
            break;
        case "db":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*5)/180))
            break;
        case "ab":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*4)/180))
            break;
        case "eb":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*3)/180))
            break;
        case "bb":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*2)/180))
            break;
        case "f":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30)/180))
            break;
        default:
            circleView.transform.rotated(by: 0)
            
        }
       
       
        
    }

   
}

