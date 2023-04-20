//
//  ViewControllerSaveSong.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 27/03/2023.
//

import UIKit

class ViewControllerSaveSong: UIViewController {
    var songs: [Song] = []
    @IBOutlet weak var txtSongName: UITextField!
    
    @IBAction func btnDismissPressed(_ sender: Any) {
        hide()
    }
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backView: UIView!
    var difficulty:Int?
    var turnaroundRandom:Int?
    var randomSecDom:Int?
    var goToDiminished:Int?
    var ranDiminished:Int?
    var savedProgression:[String]?
    var key:String?
    @IBAction func actionSave(_ sender: Any) {
        let song = DataManager.shared.song(name: txtSongName.text!, progression: savedProgression!.joined(separator: "-"), diminished: ranDiminished!, gotoDiminished: goToDiminished!, key: key!, level: difficulty!, secondaryDominant: randomSecDom!, turnaround: turnaroundRandom!)
        songs.append(song)
        DataManager.shared.save()
        print("Song: ")
        print(song)
        hide()

    }
    @IBOutlet weak var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        

        // Do any additional setup after loading the view.
    }
    init(){
        super.init(nibName: "ViewControllerSaveSong", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configView(){
        self.view.backgroundColor = .clear
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.backView.alpha = 0
        self.contentView.layer.cornerRadius = 10
    }
    func appear(sender: UIViewController ){
        sender.present(self, animated: false ){
            self.show()
        }
    }
    private func show(){
        UIView.animate(withDuration: 0.5, delay: 0.1){
            self.backView.alpha = 1
            self.contentView.alpha = 1
            
        }
    }
    func hide(){
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut){
            self.backView.alpha = 0
            self.contentView.alpha = 0
        }completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
            
        }
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


