//
//  UIViewController + StatusBar.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBarBackGroundColor(withColor color: UIColor) {
        DispatchQueue.main.async {
            let tag = 12321
            if let taggedView = self.view.viewWithTag(tag) {
                taggedView.removeFromSuperview()
            }
            let overView = UIView()
            if let statusBarFrame = self.view.window?.windowScene?.statusBarManager?.statusBarFrame {
                overView.frame = statusBarFrame
                overView.backgroundColor = color
                overView.tag = tag
                self.view.addSubview(overView)
            } else {
                print("Can't change Status Bar Color")
            }
        }
    }
}
