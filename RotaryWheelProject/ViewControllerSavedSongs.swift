//
//  ViewControllerSavedSongs.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 29/03/2023.
//

import UIKit

class ViewControllerSavedSongs: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var delegate: isAbleToReceiveData?

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            tableView.beginUpdates()
            DataManager.shared.delete(song: songs[indexPath.row])
            songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        GameViewController().setSelectedSong(s: songs[indexPath.row])
     
//        let gameView = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
//        self.present(gameView, animated: true, completion: nil)
        let gameViewController = GameViewController()
        delegate?.pass(data: songs[indexPath.row])
//
//        GameViewController().selectedSong = songs[indexPath.row]
        self.dismiss(animated: true, completion: nil)
//
//        self.performSegue(withIdentifier: "loadGame", sender: self)
        



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
