//
//  ViewController.swift
//  PagingCollectionViewPlay
//
//  Created by Remigio, Kevin (Contractor) on 10/11/17.
//  Copyright © 2017 Remigio, Kevin (Contractor). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tabSwitcher: UIView? = nil
    var blueUnderline: UIView? = nil
    
    var detailsButton: UIButton? = nil
    var pHButton: UIButton? = nil
    var notesButton: UIButton? = nil
    var wifiButton: UIButton? = nil
    
    var numberOfItems:Int = 4
    var buttonTagCurrentlyOn:Int = 0
    
    var paging: PagingViewController? = nil
    var containerView: UIView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupContainerView()
        setTabSwitcher()
        
    }
    func setTabSwitcher() {
        var tabSwitcherYOffset: CGFloat = 60
        

        tabSwitcher = UIView(frame: CGRect(x: 0, y: tabSwitcherYOffset, width: view.frame.width, height: 60.0))
        tabSwitcher?.backgroundColor = UIColor.white
        
        let segmentPosition = getSegmentPartition(numberOfPartitions: numberOfItems)
        
        detailsButton = UIButton(frame: CGRect(x: 0, y: 0, width: segmentPosition.firstP , height: 40.0))
        pHButton = UIButton(frame: CGRect(x: 0, y: 0, width: segmentPosition.firstP , height: 40.0))
        notesButton = UIButton(frame: CGRect(x: 0, y: 0, width: segmentPosition.firstP , height: 40.0))
        wifiButton = UIButton(frame: CGRect(x: 0, y: 0, width: segmentPosition.firstP , height: 40.0))
        
        detailsButton!.setTitleColor(UIColor.blue, for: .normal)
        pHButton!.setTitleColor(UIColor.black, for: .normal)
        notesButton!.setTitleColor(UIColor.black, for: .normal)
        wifiButton!.setTitleColor(UIColor.black, for: .normal)
        
        // [INI] ----------------------------------------
        // Below order should match (tag and button center properties)
        
        // Tags
        detailsButton!.tag = 0
        pHButton!.tag = 1
        wifiButton!.tag = 2
        notesButton!.tag = 3
        
        detailsButton!.center = getCenter(width: segmentPosition.firstP, height: tabSwitcher!.frame.height)
        pHButton!.center = getCenter(width: segmentPosition.firstP + segmentPosition.secondP, height: tabSwitcher!.frame.height)
        wifiButton!.center = getCenter(width: segmentPosition.secondP + segmentPosition.thirdP, height: tabSwitcher!.frame.height)
        notesButton!.center = getCenter(width: segmentPosition.thirdP + segmentPosition.fourthP, height: tabSwitcher!.frame.height)
        
        // [END] ----------------------------------------
        
        let detailsString = "Details"
        detailsButton!.setTitle(detailsString, for: .normal)
        let phTString = "pH"
        pHButton!.setTitle(phTString, for: .normal)
        let notesString = "Notes"
        notesButton!.setTitle(notesString, for: .normal)
        let wifiString = "Wifi"
        wifiButton!.setTitle(wifiString, for: .normal)
        

        
        detailsButton!.addTarget(self, action: #selector(selectTab(sender:)), for: .touchUpInside)
        pHButton!.addTarget(self, action: #selector(selectTab(sender:)), for: .touchUpInside)
        notesButton!.addTarget(self, action: #selector(selectTab(sender:)), for: .touchUpInside)
        wifiButton!.addTarget(self, action: #selector(selectTab(sender:)), for: .touchUpInside)
        


        
        
        tabSwitcher!.addSubview(detailsButton!)
        tabSwitcher!.addSubview(pHButton!)
        tabSwitcher!.addSubview(notesButton!)
        tabSwitcher!.addSubview(wifiButton!)
        
        blueUnderline = UIView(frame: CGRect(x: 0, y: tabSwitcher!.frame.height - 3.0, width: view.frame.width / CGFloat(numberOfItems) , height: 3.0))
        blueUnderline!.backgroundColor = UIColor.blue
        tabSwitcher!.addSubview(blueUnderline!)
        
        
        view.addSubview(tabSwitcher!)
    }
    func selectTab(sender:UIButton) {
        
        if buttonTagCurrentlyOn == sender.tag{
            return
        }
        
        let blueLinePosition = getSegmentPartition(numberOfPartitions: numberOfItems)
        resetTabButtonColors()
        

        
        switch sender.tag {
        case 0:
            
            blueUnderline!.frame.origin.x = 0.0
            detailsButton!.setTitleColor(UIColor.blue, for: .normal)
            buttonTagCurrentlyOn = sender.tag
            paging!.setViewControllers([(paging?.orderedViewControllers[sender.tag])!], direction: .reverse, animated: false, completion: nil)
            
            break
            
        case 1:
            
            buttonTagCurrentlyOn = sender.tag
            blueUnderline!.frame.origin.x = blueLinePosition.firstP
            pHButton!.setTitleColor(UIColor.blue, for: .normal)
            buttonTagCurrentlyOn = sender.tag
            paging!.setViewControllers([(paging?.orderedViewControllers[sender.tag])!], direction: .forward, animated: false, completion: nil)
            
            break
            
        case 2:
            
            blueUnderline!.frame.origin.x = blueLinePosition.secondP
            wifiButton!.setTitleColor(UIColor.blue, for: .normal)
            buttonTagCurrentlyOn = sender.tag
            paging!.setViewControllers([(paging?.orderedViewControllers[sender.tag])!], direction: .forward, animated: false, completion: nil)
            
            break
            
        case 3:
            
            blueUnderline!.frame.origin.x = blueLinePosition.thirdP
            notesButton!.setTitleColor(UIColor.blue, for: .normal)
            buttonTagCurrentlyOn = sender.tag
            paging!.setViewControllers([(paging?.orderedViewControllers[sender.tag])!], direction: .forward, animated: false, completion: nil)
            
            break
            
        default:
            break
        }
        

        
        
    }
    func setupContainerView() {
        let rect:CGRect = CGRect(x: 0, y: 200, width: view.frame.width, height: view.frame.height)
        containerView = UIView(frame:rect)
        containerView?.backgroundColor = UIColor.gray
        view.addSubview(containerView!)
        
        paging = PagingViewController()
        
        self.addChildViewController(paging!)
        self.containerView?.addSubview(paging!.view)
        paging?.didMove(toParentViewController: self)
        
        
    }
    func resetTabButtonColors() {
        detailsButton!.setTitleColor(UIColor.black, for: .normal)
        pHButton!.setTitleColor(UIColor.black, for: .normal)
        notesButton!.setTitleColor(UIColor.black, for: .normal)
        wifiButton!.setTitleColor(UIColor.black, for: .normal)
    }
    func getSegmentPartition(numberOfPartitions: Int) -> (firstP: CGFloat, secondP: CGFloat, thirdP: CGFloat, fourthP: CGFloat){
        
        let first = view.frame.width / CGFloat(numberOfPartitions)
        let second = 2 * (view.frame.width / CGFloat(numberOfPartitions))
        let third = 3 * (view.frame.width / CGFloat(numberOfPartitions))
        let fourth = 4 * (view.frame.width / CGFloat(numberOfPartitions))
        
        return (first, second, third, fourth)
    }
    func getCenter(width: CGFloat, height:CGFloat) -> CGPoint{
        let x:CGFloat = width / CGFloat(2.0)
        let y:CGFloat = height / CGFloat(2.0)
        
        return CGPoint(x: x, y: y)
    }
}

