//
//  UIViewControllerExtensions.swift
//  WeeklySummary
//
//  Created by user on 4/17/19.
//  Copyright © 2019 user. All rights reserved.
//

import  UIKit.UIViewController
extension UIViewController {
    
    /* add child controller */
    func add(child childViewController: UIViewController) {
        beginAddChild(child: childViewController)
        view.addSubview(childViewController.view)
        endAddChild(child: childViewController)
    }
    
    /* add child controller in a specific view */
    func add(child childViewController: UIViewController, in view: UIView) {
        beginAddChild(child: childViewController)
        view.addSubview(childViewController.view)
        endAddChild(child: childViewController)
    }
    
    /* add child controller in a specific view with a set frame */
    func add(child childViewController: UIViewController, in view: UIView, with frame:CGRect) {
        beginAddChild(child: childViewController)
        childViewController.view.frame = frame
        view.addSubview(childViewController.view)
        endAddChild(child: childViewController)
    }
    
    /* remove child controller */
    func remove(child childViewController:UIViewController){
        guard parent != nil else { return }
        childViewController.beginAppearanceTransition(false, animated: false)
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
        childViewController.endAppearanceTransition()
    }
    
    private func beginAddChild(child childViewController:UIViewController){
        childViewController.beginAppearanceTransition(true, animated: false)
        self.addChild(childViewController)
    }
    
    private func endAddChild(child childViewController:UIViewController){
        childViewController.didMove(toParent: self)
        childViewController.endAppearanceTransition()
    }
    
}
