//
//  onBoardingCollectionCollectionViewCell.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 20/04/2023.
//

import UIKit

class onBoardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    static let identifier = String(describing: onBoardingCollectionViewCell.self)
    
   
    func setup(_ slide: onBoardingSlide){
        slideImageView.image = slide.image
        title.text = slide.title
        subtitle.text = slide.description
    }
}
