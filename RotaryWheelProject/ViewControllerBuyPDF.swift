//
//  ViewControllerBuyPDF.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 13/12/2023.
//

import UIKit
import CoreData
@objc @objcMembers class ViewControllerBuyPDF: UIViewController {
    var premiumVersionPurchased : Bool = false
    var storekit = StoreKitManager()

    @IBAction func btnDismiss(_ sender: Any) {
        hide()
    }
    @IBAction func btnBuyNow(_ sender: Any) {
        NSLog("Products: "+String(describing: storekit.purchasedProducts.first))
        Task{
            if let product = storekit.storeProducts.first {
                do {
                    let transaction = try await storekit.purchase(product)
                    NSLog("Transaction: "+String(describing: transaction))
                    if(transaction?.productID=="com.mustafa.paidversion"){
                        DataManager.shared.savePremiumStatus(isPremium: true)
                    }
                } catch {
                    // Handle any errors that occurred during the purchase
                }
            }
        }
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var contentView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        if(!storekit.purchasedProducts.isEmpty){     //Should change later if more paid products are added
            DataManager.shared.savePremiumStatus(isPremium: true)
        }
        print("Premium status: " + String(DataManager.shared.getPremiumStatus()))
    }
    
    init() {
        super.init(nibName: "ViewControllerGetPDF", bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        view.backgroundColor = UIColor.clear
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        backView.alpha = 0
        contentView.alpha = 0
        contentView.layer.cornerRadius = 10
    }
    @objc
   func appear(sender: UIViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }
    
    func show() {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }, completion: nil)
    }
    
    func hide() {
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        }, completion: { finished in
            self.dismiss(animated: false, completion: nil)
            self.removeFromParent()
        })
    }
}

