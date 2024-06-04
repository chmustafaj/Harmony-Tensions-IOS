//
//  SelectSongViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 22/05/2024.
//

import UIKit

class SelecGameDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    private func setup(){
        let selectSong = SelectSongViewController()
        let selectRandom = SelectRandomProgressionViewController()
        
        addChild(selectSong)
        addChild(selectRandom)
        
        self.view.addSubview(selectSong.view)
        self.view.addSubview(selectRandom.view)
        
        selectSong.didMove(toParent: self)
        selectRandom.didMove(toParent: self)
        
        selectSong.view.frame = self.view.bounds
        selectRandom.view.frame = self.view.bounds
        
        selectRandom.view.isHidden = true
        

    }
    @IBAction func didTapSegment(segment: UISegmentedControl){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
