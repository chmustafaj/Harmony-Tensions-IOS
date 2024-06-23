//
//  SelectSongViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 22/05/2024.
//

import UIKit

class SelectSongViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let songs = Utils().songsString
    var songSelection: String!
    var sheetMusicUrl: String = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/aintsswt.pdf"
    @IBAction func btnDonePressed(_ sender: Any) {
      

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
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/aintsswt.pdf"
        case 1:
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/alcblgwn.pdf"
        case 2:
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/aprlshwr.pdf"
        case 3:
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/babyface.pdf"
        case 4:
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/barkrole.pdf"
        default:
            sheetMusicUrl = "https://github.com/lfinston/Songlist/blob/main/lead_sheets/aintsswt.pdf"

            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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

}
