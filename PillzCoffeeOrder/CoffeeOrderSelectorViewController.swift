//
//  ViewController.swift
//  PillzCoffeeOrder
//
//  Created by Daniel Yount on 1/18/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class CoffeeOrderSelectorViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var coffeeHeroScrollView: UIScrollView!
    
    var currentItemInFocus: CoffeeOrder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        
        let view1 = UIView()
        view1.frame = CGRect(x: view.frame.width * 0, y: 0, width: coffeeHeroScrollView.frame.width, height: coffeeHeroScrollView.frame.height)
        view1.backgroundColor = .red
        let view2 = UIView()
        view2.frame = CGRect(x: view.frame.width * 1, y: 0, width: coffeeHeroScrollView.frame.width, height: coffeeHeroScrollView.frame.height)
        view2.backgroundColor = .green
        
        print(view1.frame)
        print(view2.frame)
        
        coffeeHeroScrollView.addSubview(view1)
        coffeeHeroScrollView.addSubview(view2)
        
    }
    
    func setupScrollView() {
        coffeeHeroScrollView.delegate = self
        coffeeHeroScrollView.showsHorizontalScrollIndicator = false
        coffeeHeroScrollView.showsVerticalScrollIndicator = false
        coffeeHeroScrollView.isPagingEnabled = true
        coffeeHeroScrollView.isScrollEnabled = true
        
        coffeeHeroScrollView.contentSize = CGSize(width: coffeeHeroScrollView.frame.width * 2, height: coffeeHeroScrollView.frame.height)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }


}

