//
//  HorizontalSceneTransitionInfoProvider.swift
//  PillzCoffeeOrder
//
//  Created by Daniel Yount on 1/19/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class HorizontalSceneTransitionInfoProvider {
    
    var containerView: UIView {
        didSet {
            scrollView = containerView as? UIScrollView
        }
    }
    
    private var scrollView: UIScrollView!
    
    var scenes: [UIView]
    
    init(containerView: UIScrollView, scenes: [UIView]) {
        self.containerView = containerView
        self.scrollView = containerView
        self.scenes = scenes
    }
    
    func isMainScene(scene: UIView) -> Bool {
        return percentageComplete(for: scene) > 0.50
    }
    
    func percentageComplete(for scene: UIView) -> CGFloat {
        
        guard scenes.contains(scene) else { fatalError() }
        let xOffset = scrollView.contentOffset.x
        let transform = CGAffineTransform(translationX: -xOffset, y: 0)
        let sceneFrame = scene.frame.applying(transform)
        
        if sceneFrame.minX < containerView.frame.minX && sceneFrame.maxX > containerView.frame.width {
            return 1.00
        } else if sceneFrame.minX < containerView.frame.minX {
            return (sceneFrame.origin.x + sceneFrame.width) / containerView.frame.width
        } else {
            return (containerView.frame.width - sceneFrame.origin.x) / containerView.frame.width
        }
        
        
    }
    
}
