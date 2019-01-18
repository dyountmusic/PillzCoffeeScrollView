//
//  ViewController.swift
//  PillzCoffeeOrder
//
//  Created by Daniel Yount on 1/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class CoffeeOrderSelectorViewController: UIViewController {
    
    @IBOutlet weak var coffeeHeroScrollView: UIScrollView!
    
    var currentItemInFocus: CoffeeOrder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        view1.frame = CGRect(x: coffeeHeroScrollView.frame.width * 0, y: 0, width: coffeeHeroScrollView.frame.width, height: coffeeHeroScrollView.frame.height)
        view1.backgroundColor = .red
        let view2 = UIView()
        view2.frame = CGRect(x: coffeeHeroScrollView.frame.width * 1, y: 0, width: coffeeHeroScrollView.frame.width, height: coffeeHeroScrollView.frame.height)
        view2.backgroundColor = .green
        
        
        
        coffeeHeroScrollView.addSubview(view1)
        coffeeHeroScrollView.addSubview(view2)
        
        coffeeHeroScrollView.isScrollEnabled = true
        
    }


}

