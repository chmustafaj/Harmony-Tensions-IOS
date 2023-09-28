//
//  OverLayerBuyBook.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 04/12/2023.
//

import UIKit

class OverLayerBuyBook: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBAction func btnBuyBook(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    init(){
        super.init(nibName: "OverLayerBuyBook", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configView(){
        self.view.backgroundColor = .clear
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.backView.alpha = 0
        self.contentView.layer.cornerRadius = 10
    }
    func appear(sender: UIViewController ){
        sender.present(self, animated: false ){
            self.show()
        }
    }
    private func show(){
        UIView.animate(withDuration: 0.5, delay: 0.1){
            self.backView.alpha = 1
            self.contentView.alpha = 1
            
        }
    }
    func hide(){
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut){
            self.backView.alpha = 0
            self.contentView.alpha = 0
        }completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
            
    }
    

}
