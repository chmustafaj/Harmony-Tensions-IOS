//
//  GameViewController.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 13/02/2023.
//

import UIKit
import SwiftUI

class GameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
    private var difficultySelection = 0
    private var beat = 0
    let circleView = UIImageView(image: UIImage(named: "letters.jpeg"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        // button.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        button.isHidden = true
        
        let beatLabel = UILabel()
        beatLabel.text = "\(beat)"
        beatLabel.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(beatLabel)
        beatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            beatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            beatLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let difficultyPicker = UIPickerView()
        difficultyPicker.dataSource = self
        difficultyPicker.delegate = self
        view.addSubview(difficultyPicker)
        difficultyPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            difficultyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            difficultyPicker.topAnchor.constraint(equalTo: beatLabel.bottomAnchor, constant: 16),
            difficultyPicker.widthAnchor.constraint(equalToConstant: 200),
            difficultyPicker.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 400),
            circleView.heightAnchor.constraint(equalToConstant: 400)
        ])

        let imageView = UIImageView(image: UIImage(named: "simple_hw"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        let v71ImageView = UIImageView(image: UIImage(named: "v71_white"))
        //v71ImageView.alpha = 0
        imageView.addSubview(v71ImageView)
        v71ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v71ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 40),
            v71ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -65),
            v71ImageView.widthAnchor.constraint(equalToConstant: 35),
            v71ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        let v75ImageView = UIImageView(image: UIImage(named: "v75_white"))
        //v71ImageView.alpha = 0
        imageView.addSubview(v75ImageView)
        v75ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v75ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 60),
            v75ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -35),
            v75ImageView.widthAnchor.constraint(equalToConstant: 35),
            v75ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        let v74ImageView = UIImageView(image: UIImage(named: "v74_white"))
        //v74ImageView.alpha = 0
        imageView.addSubview(v74ImageView)
        v74ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v74ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            v74ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -70),
            v74ImageView.widthAnchor.constraint(equalToConstant: 35),
            v74ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        
        
        let v72ImageView = UIImageView(image: UIImage(named: "v72_white"))
        //v72ImageView.alpha = 0
        imageView.addSubview(v72ImageView)
        v72ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v72ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 70),
            v72ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            v72ImageView.widthAnchor.constraint(equalToConstant: 35),
            v72ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        let v76ImageView = UIImageView(image: UIImage(named: "v76_white"))
        //v76ImageView.alpha = 0
        imageView.addSubview(v76ImageView)
        v76ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v76ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 60),
            v76ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 35),
            v76ImageView.widthAnchor.constraint(equalToConstant: 35),
            v76ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        let v73ImageView = UIImageView(image: UIImage(named: "v73_white"))
        //v73ImageView.alpha = 0
        imageView.addSubview(v73ImageView)
        v73ImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            v73ImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 40),
            v73ImageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 65),
            v73ImageView.widthAnchor.constraint(equalToConstant: 35),
            v73ImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        let dimii = UIImageView(image: UIImage(named: "dimiiwhite"))
        //dimii.alpha = 0
        imageView.addSubview(dimii)
        dimii.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimii.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -70),
            dimii.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -17),
            dimii.widthAnchor.constraint(equalToConstant: 35),
            dimii.heightAnchor.constraint(equalToConstant: 35)
        ])
        let dimv = UIImageView(image: UIImage(named: "dimvwhite"))
        //dimv.alpha = 0
        imageView.addSubview(dimv)
        dimv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimv.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -65),
            dimv.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 23),
            dimv.widthAnchor.constraint(equalToConstant: 35),
            dimv.heightAnchor.constraint(equalToConstant: 35)
        ])
        let dimi = UIImageView(image: UIImage(named: "dimiwhite"))
        //dimi.alpha = 0
        imageView.addSubview(dimi)
        dimi.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimi.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -40),
            dimi.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 60),
            dimi.widthAnchor.constraint(equalToConstant: 35),
            dimi.heightAnchor.constraint(equalToConstant: 35)
        ])
        let dimiv = UIImageView(image: UIImage(named: "dimivwhite"))
        //dimii.alpha = 0
        imageView.addSubview(dimiv)
        dimiv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimiv.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            dimiv.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 80),
            dimiv.widthAnchor.constraint(equalToConstant: 35),
            dimiv.heightAnchor.constraint(equalToConstant: 35)
        ])

      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        circleView.transform=CGAffineTransformIdentity
        selectKey()
        NSLog("key"+key)
    }
        
   
//        let wheel = SMRotaryWheel(frame: CGRect(x: 0, y: 0, width: 350, height: 350), andDelegate: self, withSections: 12)
//        wheel.center = CGPoint(x: 215, y: 400)
//        wheel.transform = CGAffineTransform(rotationAngle: -0.1) // rotation in radians
//        self.view.addSubview(wheel)

    func selectKey(){
        switch(key){
        case "c":
            circleView.transform=circleView.transform.rotated(by: CGFloat(0))
            break;
        case "g":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*11)/180))
            break;
        case "d":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*10)/180))
            break;
        case "a":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*9)/180))
            break;
        case "e":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*8)/180))
            break;
        case "b":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*7)/180))
            break;
        case "fs":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*6)/180))
            break;
        case "db":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*5)/180))
            break;
        case "ab":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*4)/180))
            break;
        case "eb":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*3)/180))
            break;
        case "bb":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30*2)/180))
            break;
        case "f":
            circleView.transform=circleView.transform.rotated(by: CGFloat(Double.pi * (30)/180))
            break;
        default:
            circleView.transform.rotated(by: 0)
            
        }
        
    }
//    struct SMRotaryWheel: UIViewRepresentable {
//     
//
//        func makeUIView(context: Context) -> SMRotaryWheel {
//            SMRotaryWheel()
//        }
//
//        func updateUIView(_ uiView: UITextView, context: Context) {
//            uiView.attributedText = text
//        }
//    }
   
}

