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
    var delegate: selectSongFromSongMode?
    @IBAction func btnDonePressed(_ sender: Any) {
        delegate?.sendSong(data: Utils().setSelectedSong(songString: songSelection))
       dismiss(animated: true)

    }
    @IBOutlet weak var songPicker: UIPickerView!
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
           print("You selected: " + songSelection)
       }

}
