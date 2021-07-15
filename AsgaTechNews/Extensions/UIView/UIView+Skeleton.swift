//
//  UIView+Skeleton.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func enableSkeleton(with color: UIColor = UIColor(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0), enable: Bool) {
        isUserInteractionEnabled = !enable
        if enable, !isAnimating() {
            let animatigGradientColor = UIColor(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0, alpha: 0.2)
            let gradientView = SkeletonUIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            gradientView.animatingGriadintColor = animatigGradientColor
            gradientView.tag = -1
            gradientView.backgroundColor = color
            gradientView.layer.cornerRadius = 3
            gradientView.clipsToBounds = true
            addSubview(gradientView)
            gradientView.fillInView(self)
            bringSubviewToFront(gradientView)
            addGradientSublayerWithAnimation(gradientView: gradientView, color: animatigGradientColor)
        } else if !enable, isAnimating() {
            viewWithTag(-1)?.removeFromSuperview()
        }
    }

    private func isAnimating() -> Bool {
        if viewWithTag(-1) != nil {
            return true
        }
        return false
    }

    func addGradientSublayerWithAnimation(gradientView: UIView, color: UIColor) {
        gradientView.layoutIfNeeded()
        let gradienntLayer = CAGradientLayer(layer: gradientView.layer)
        gradienntLayer.colors = [color.cgColor, UIColor.clear.cgColor]
        gradienntLayer.locations = [0, 1]
        gradienntLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradienntLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradienntLayer.frame = CGRect(x: 0, y: 0, width: gradientView.frame.width, height: gradientView.frame.height)

        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = CGPoint(x: -1, y: 0.5)
        startPointAnim.toValue = CGPoint(x: 1, y: 0.5)

        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = CGPoint(x: 0, y: 0.5)
        endPointAnim.toValue = CGPoint(x: 2, y: 0.5)

        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1.5
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animGroup.repeatCount = .infinity

        gradienntLayer.add(animGroup, forKey: "skeletonAnimation")
        gradientView.layer.addSublayer(gradienntLayer)
        gradientView.updateConstraintsIfNeeded()
        gradientView.layoutIfNeeded()
    }

    func fillInView(_ container: UIView!) {
        translatesAutoresizingMaskIntoConstraints = false
        frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
