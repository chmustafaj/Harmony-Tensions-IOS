//
//  SwiftUIView.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 12/02/2023.
//

import Foundation
import SwiftUI


@objc extension HarmonyWheelViewController{
    func displaySwiftUIWrapper(){
        let hostingVC = UIHostingController(rootView: SwiftUIView())
        hostingVC.modalPresentationStyle = .fullScreen
        self.present(hostingVC,animated:true)
    }
     
}
struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
