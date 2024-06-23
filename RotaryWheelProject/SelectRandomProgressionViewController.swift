//
//  SelectRandomProgressionViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 22/05/2024.
//

import UIKit

class SelectRandomProgressionViewController: UIViewController {
    var difficulty: Int?
    @IBAction func didTapSegment(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex{
        case 0:
            difficulty = 2
            break
        case 1:
            difficulty = 3
            break
        default:
            difficulty = 2
        }
    }
    @IBAction func btnDone(_ sender: Any) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        difficulty = 2
    }

}
