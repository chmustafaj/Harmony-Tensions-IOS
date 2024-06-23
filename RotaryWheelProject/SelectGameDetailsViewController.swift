//
//  SelectSongViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 22/05/2024.
//

import UIKit

class SelectGameDetailsViewController: UIViewController {
    var selectSong: SelectSongViewController!
       var selectRandom: SelectRandomProgressionViewController!

    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    private func setup(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        selectSong = storyboard.instantiateViewController(withIdentifier: "SelectSongViewController") as? SelectSongViewController
                selectRandom = storyboard.instantiateViewController(withIdentifier: "SelectRandomProgressionViewController") as? SelectRandomProgressionViewController
        addChild(selectSong)
        addChild(selectRandom)
        
        self.myView.addSubview(selectSong.view)
        self.myView.addSubview(selectRandom.view)
        
        selectSong.didMove(toParent: self)
        selectRandom.didMove(toParent: self)
        
        selectSong.view.frame = self.myView.bounds
        selectRandom.view.frame = self.myView.bounds
        
        selectRandom.view.isHidden = true
        

    }
    @IBAction func didTapSegment(segment: UISegmentedControl){
        if(segment.selectedSegmentIndex == 0){
            selectSong.view.isHidden = false
            selectRandom.view.isHidden = true
            
        }else if (segment.selectedSegmentIndex == 1){
            selectSong.view.isHidden = true
            selectRandom.view.isHidden = false
            
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

}
