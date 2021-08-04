//
//  BaseViewController.swift
//  My Restaurants
//
//  Created by Eugene Lysenko on 14.07.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initBackButton()
    }
    
    // MARK: - inits

    func initBackButton() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "arrow-left"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 11)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func initSwipe() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func goBack() {
        // self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

}
