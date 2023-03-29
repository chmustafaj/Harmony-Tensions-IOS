//
//  ViewControllerSavedSongs.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 29/03/2023.
//

import UIKit

class ViewControllerSavedSongs: UIViewController, UITableViewDataSource, UITableViewDelegate {

 
    var songs: [Song] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        songs = DataManager.shared.getSongs()


        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! SongCell
        let thisSong = songs[indexPath.row]
        tableViewCell.labelSongName.text = thisSong.name
        return tableViewCell
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
