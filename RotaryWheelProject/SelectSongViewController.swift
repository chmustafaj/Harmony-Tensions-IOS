//
//  SelectSongViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 22/05/2024.
//

import UIKit

class SelectSongViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var delegate: selectSongFromSongMode?
    let songs = Utils().songsString
    var songSelection: String!
    var sheetMusicUrl: String = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/mode/2up"
    @IBAction func btnDonePressed(_ sender: Any) {
        delegate?.sendSong(data: songSelection)
               dismiss(animated: true)

    }
    @IBAction func viewSheetMusicPressed(_ sender: Any) {
        if let url = URL(string: sheetMusicUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    @IBOutlet weak var songPicker: UIPickerView!
    private func setUrl(row: Int){
        switch row{
        case 0:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/page/n9/mode/2up"
        case 1:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/page/n9/mode/2up"
        case 2:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/page/n11/mode/2up"
        case 3:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/page/n11/mode/2up"
        case 4:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/page/n11/mode/2up"
        default:
            sheetMusicUrl = "https://archive.org/details/TheCommercialMusicFakebook1/Charlie%20Parker%20Tune%20Book/mode/2up"

            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        songPicker.delegate = self
        songPicker .dataSource = self
        songSelection = songs[0]
            

    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return songs.count
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return songs[row]
           
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           songSelection = songs[row]
           setUrl(row: row)
           print("You selected: " + songSelection)
       }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as? SMAppDelegate)?.orientation = .landscapeRight

        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        if #available(iOS 16.0, *) {
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
        } else {
            // Fallback on earlier versions
        }

        if #available(iOS 16.0, *) {
            UIApplication.navigationTopViewController()?.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            // Fallback on earlier versions
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         (UIApplication.shared.delegate as? SMAppDelegate)?.orientation = .portrait

         let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        if #available(iOS 16.0, *) {
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
        } else {
            // Fallback on earlier versions
        }

        if #available(iOS 16.0, *) {
            UIApplication.navigationTopViewController()?.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            // Fallback on earlier versions
        }
     }

     override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
         return .landscape
     }

     override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
         return .landscapeRight
     }

     override var shouldAutorotate: Bool {
         return false
     }
}
