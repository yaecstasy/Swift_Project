//
//  ViewController.swift
//  Filterer
//
//  Created by Tzu-I Lee on 11/15/15.
//  Copyright © 2015 Tzu-I Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var filteredImage:UIImage?

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var SecondaryMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SecondaryMenu.translatesAutoresizingMaskIntoConstraints=false
        
        SecondaryMenu.backgroundColor=UIColor.whiteColor().colorWithAlphaComponent(0.5)
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNewPhoto(sender: AnyObject) {
        
        let actionSheet=UIAlertController(title:"New Photo",message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title:"Camera",style: .Default, handler:{
        action in
            self.showCamera()
            
        
        }))
        
        actionSheet.addAction(UIAlertAction(title:"Album",style: .Default, handler:{
            action in
            
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
        
    }
    
    func showCamera(){
        let cameraPicker=UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        presentViewController(cameraPicker, animated: true, completion: nil)
        
    }
    
    func showAlbum(){
        let cameraPicker=UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onShare(sender: AnyObject) {
        let activityController=UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }
    @IBAction func onFilter(sender: UIButton) {
        if(sender.selected){
           hideSecondaryMenu()
           sender.selected=false
        }else{
           showSecondaryMenu()
          sender.selected=true
        }
        
    }
    
    func showSecondaryMenu(){
        view.addSubview(SecondaryMenu)
        
        let bottomConstraint = SecondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint=SecondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint=SecondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint=SecondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        view.layoutIfNeeded()
        self.SecondaryMenu.alpha=0
        UIView.animateWithDuration(0.4){
           self.SecondaryMenu.alpha=1.0
        }
        
    }
    func hideSecondaryMenu(){

        UIView.animateWithDuration(0.4, animations: {self.SecondaryMenu.alpha=0}){completed in
            if completed == true{
                self.SecondaryMenu.removeFromSuperview()}
        }
    }

}

