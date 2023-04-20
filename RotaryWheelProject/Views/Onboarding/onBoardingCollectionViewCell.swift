//
//  onBoardingCollectionCollectionViewCell.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 20/04/2023.
//

import UIKit

class onBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: onBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    func setup(_ slide: onBoardingSlide){
        slideImageView.image = slide.image
    }
}
