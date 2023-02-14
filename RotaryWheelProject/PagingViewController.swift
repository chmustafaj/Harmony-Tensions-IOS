//
//  TabLayout.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 13/02/2023.
//

import UIKit
import LZViewPager

class PagingViewController: UIViewController, LZViewPagerDelegate, LZViewPagerDataSource {
 
    
    @IBOutlet weak var viewPager: LZViewPager!
    
    private var subControllers:[UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        viewPagerProperties()
    }
    func viewPagerProperties(){
        viewPager.delegate=self;
        viewPager.dataSource=self;
        viewPager.hostController=self;
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HarmonyWheelViewController")
        as! HarmonyWheelViewController

        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController")
        as! GameViewController
        vc1.title="Wheel"
        vc2.title="Game"
        subControllers=[vc1,vc2]
        viewPager.reload()

    }
    func numberOfItems() -> Int {
        self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
                button.setTitleColor(UIColor.black, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                return button
        
    }
    func colorForIndicator(at index: Int) -> UIColor{
        return .darkGray
    }

   

}
