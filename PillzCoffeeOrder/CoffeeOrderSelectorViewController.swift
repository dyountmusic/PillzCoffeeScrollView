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
    @IBOutlet weak var coffeeTitle: UILabel!
    @IBOutlet weak var coffeeSubtitle: UILabel!
    
    var currentItemInFocus: CoffeeOrder? {
        didSet {
            self.coffeeTitle.text = currentItemInFocus?.title
            self.coffeeSubtitle.text = currentItemInFocus?.subtitle
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor = self.currentItemInFocus?.color
            }
        }
    }
    var coffeeOrders: [CoffeeOrder] = [CoffeeOrder]()
    
    private var transitioningInfoProvider: HorizontalSceneTransitionInfoProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeOrders = createCoffeeOrders()
        setupScrollView()
        
        var counter = 0
        
        for coffee in coffeeOrders {
            
            let view = UIImageView(frame: CGRect(x: coffeeHeroScrollView.frame.width * CGFloat(counter), y: 0, width: coffeeHeroScrollView.frame.width, height: coffeeHeroScrollView.frame.height))
            
            view.image = coffee.image
            view.contentMode = .scaleAspectFit
            self.coffeeHeroScrollView.addSubview(view)
            counter += 1
        }
        
        setupFirstCoffee()
        
        transitioningInfoProvider = HorizontalSceneTransitionInfoProvider(containerView: coffeeHeroScrollView, scenes: coffeeHeroScrollView.subviews)
        
    }
    
    func setupFirstCoffee() {
        let coffee = coffeeOrders.first
        self.coffeeTitle.text = coffee?.title
        self.coffeeSubtitle.text = coffee?.subtitle
        self.view.backgroundColor = coffee?.color
    }
    
    func setupScrollView() {
        coffeeHeroScrollView.delegate = self
        coffeeHeroScrollView.showsHorizontalScrollIndicator = false
        coffeeHeroScrollView.showsVerticalScrollIndicator = false
        coffeeHeroScrollView.isPagingEnabled = true
        coffeeHeroScrollView.isScrollEnabled = true
        
        let width = coffeeHeroScrollView.frame.width * CGFloat(coffeeOrders.count)
        let height = coffeeHeroScrollView.frame.height
        
        coffeeHeroScrollView.contentSize = CGSize(width: width, height: height)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var counter = 0
        
        for subview in scrollView.subviews {
            
            guard let transitioningInfoProvider = transitioningInfoProvider else { return }
            
            let percent = transitioningInfoProvider.percentageComplete(for: subview)
            
            if transitioningInfoProvider.isMainScene(scene: subview) {
                currentItemInFocus = coffeeOrders[counter]
            }
            
            counter += 1
        }
    }
    
    func createCoffeeOrders() -> [CoffeeOrder] {
        
        let flickrAPIClient = FlickrAPIAlbumDownloader()
        flickrAPIClient.downloadAlbum()
        
        var result = [CoffeeOrder]()
        
        let coffeeOrder1 = CoffeeOrder(title: "Mint Mojito", subtitle: "Is it Mint Mojito time?", image: #imageLiteral(resourceName: "mintMojito"), color: UIColor(red:0.32, green:0.90, blue:0.56, alpha:1.0))
        
        let coffeeOrder2 = CoffeeOrder(title: "Silken Splendor", subtitle: "In search of a Silken Splendor?", image: #imageLiteral(resourceName: "silkenSplendor"), color: UIColor(red:1.00, green:0.78, blue:0.25, alpha:1.0))
        
        let coffeeOrder3 = CoffeeOrder(title: "Tesora", subtitle: "Got time for our classic Tesora?", image: #imageLiteral(resourceName: "tesora"), color: UIColor(red:1.00, green:0.66, blue:0.00, alpha:1.0))
        
        let coffeeOrder4 = CoffeeOrder(title: "Ecstatic", subtitle: "Excited for an Ecstatic?", image: #imageLiteral(resourceName: "ecstatic"), color: UIColor(red:0.96, green:0.53, blue:0.01, alpha:1.0))
        
        let coffeeOrder5 = CoffeeOrder(title: "Jacob’s Wonderbar", subtitle: "Enjoy a Jacob’s Wonderbar?", image: #imageLiteral(resourceName: "jacobswonderbar"), color: UIColor(red:0.42, green:0.26, blue:0.13, alpha:1.0))
        
        let coffeeOrder6 = CoffeeOrder(title: "Philharmonic", subtitle: "Craving a Philharmonic?", image: #imageLiteral(resourceName: "philharmonic"), color: UIColor(red:0.31, green:0.83, blue:0.64, alpha:1.0))
        
        result.append(coffeeOrder1)
        result.append(coffeeOrder2)
        result.append(coffeeOrder3)
        result.append(coffeeOrder4)
        result.append(coffeeOrder5)
        result.append(coffeeOrder6)
        
        return result
    }


}

extension UIColor {
    func interpolateRGBColorTo(_ end: UIColor, fraction: CGFloat) -> UIColor? {
        let f = min(max(0, fraction), 1)
        
        guard let c1 = self.cgColor.components, let c2 = end.cgColor.components else { return nil }
        
        let r: CGFloat = CGFloat(c1[0] + (c2[0] - c1[0]) * f)
        let g: CGFloat = CGFloat(c1[1] + (c2[1] - c1[1]) * f)
        let b: CGFloat = CGFloat(c1[2] + (c2[2] - c1[2]) * f)
        let a: CGFloat = CGFloat(c1[3] + (c2[3] - c1[3]) * f)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
