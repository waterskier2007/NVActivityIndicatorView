//
//  NVActivityIndicatorAnimationBallScale.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/24/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallScale: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 1
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath:"transform.scale")
        
        scaleAnimation.duration = duration;
        scaleAnimation.fromValue = 0;
        scaleAnimation.toValue = 1;
        
        // Opacity animation
        let opacityAnimation = CABasicAnimation(keyPath:"opacity")
        
        opacityAnimation.duration = duration;
        opacityAnimation.fromValue = 1;
        opacityAnimation.toValue = 0
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation];
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw circle
        let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: size, color: color)
        
        circle.frame = CGRect(x: (layer.bounds.width - size.width) / 2,
            y: (layer.bounds.height - size.height) / 2,
            width: size.width,
            height: size.height);
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
