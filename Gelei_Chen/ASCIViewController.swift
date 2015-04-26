//
//  ASCIViewController.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/24.
//  Copyright (c) 2015年 Geilei_Chen. All rights reserved.
//

import UIKit
import BKAsciiImage
//import JSImagePickerController

class ASCIViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIScrollViewDelegate,JSImagePickerViewControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.contentSize = CGSizeMake((UIScreen.mainScreen().bounds.size.height-(self.navigationController?.navigationBar.frame.size.height)!), UIScreen.mainScreen().bounds.size.height-(self.navigationController?.navigationBar.frame.size.height)!)
            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 1.0
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickImageButton: UIButton!
    @IBOutlet weak var fontSizeSlider: UISlider!{
        didSet{
            fontSizeSlider.tintColor = UIColor.blackColor()
        }
    }
    @IBOutlet weak var fontSizeLabel: UILabel!
   
    var inputImage = UIImage(named: "testImage.png")
    let converter = BKAsciiConverter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.contentMode = .ScaleAspectFit
        self.imageView.image = self.inputImage
        self.fontSizeSlider.value = Float(self.converter.font.pointSize)
        self.pickImageButton.imageView?.contentMode = .ScaleAspectFit
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveImage:")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back.png"), style: UIBarButtonItemStyle.Done, target: self, action: "done:")
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.blackColor()
        self.navigationController!.navigationBar.translucent = true
        self.title = "Image -> ASCII"
        // Do any additional setup after loading the view.
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeFontSize(sender: UISlider) {
        let slider = self.fontSizeSlider
        self.converter.font = UIFont.systemFontOfSize(slider.value.f)
        self.fontSizeLabel.text = NSString(format: "Font size: %0.1f", slider.value) as String
        
    }
    
    @IBAction func pickNewImage(sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)

        /*
        let imagePicker = JSImagePickerViewController()
        imagePicker.delegate = self
        imagePicker.showImagePickerInController(self.navigationController)
        //imagePicker.resignFirstResponder()
        */
    }
    
    func imagePickerDidSelectImage(image: UIImage!) {
        self.imageView.image = image
        self.inputImage = image
        self.pickImageButton.setImage(image, forState: UIControlState.Normal)
       
    }
    @IBAction func convert(sender: UIButton) {
        println("1")
        converter.convertImage(self.inputImage, completionHandler: { (asciImage:UIImage?) -> Void in
            UIView.transitionWithView(self.imageView, duration: 3.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                self.imageView.image = asciImage!
            }, completion: nil)
        })
        converter.convertToString(self.inputImage, completionHandler: { (asciString:String?) -> Void in
                println(asciString)
        })
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = chosenImage
        self.inputImage = chosenImage
        self.pickImageButton.setImage(chosenImage, forState: UIControlState.Normal)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveImage(sender: UIButton!){
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
    }
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        if error != nil {
           UIAlertView(title: "Error", message: "\(error.debugDescription)", delegate: nil, cancelButtonTitle: "Close").show()
        } else {
            UIAlertView(title: "Success", message: "This image has been saved to your Camera Roll successfully", delegate: nil, cancelButtonTitle: "Close").show()
        }
        
    }
    func done(sender: UIButton!){
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
