//
//  StartingViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 20/04/2023.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewDidAppear(_ animated: Bool) {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if launchedBefore {
            // App has been launched before, so skip onboarding screen
            let homeScreenViewController = storyBoard.instantiateViewController(withIdentifier: "PagingViewController") as! PagingViewController
            homeScreenViewController.modalPresentationStyle = .currentContext
            self.present(homeScreenViewController, animated:true, completion:nil)
            NSLog("Launched before")
        } else {
            // App is launching for the first time, so show onboarding screen
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            let onBoardingController = storyBoard.instantiateViewController(withIdentifier: "onBoardingViewController") as! onBoardingViewController
            onBoardingController.modalPresentationStyle = .currentContext
            self.present(onBoardingController, animated:true, completion:nil)
            NSLog("first launch")

            // Present the onboarding screen using a segue or present()
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
