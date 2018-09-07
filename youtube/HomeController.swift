//
//  ViewController.swift
//  youtube
//
//  Created by Amy Turnah on 6/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        view.backgroundColor = UIColor.red //changed for new swift
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId") //changed for new swift
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        // cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200) // changed for new swift
        
    }

}

class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false // for setting constraints on a view in code this has to be set
        //  imageView.image = UIImage(named: "taylor_swift_blank_space")
        //  imageView.contentMode = .ScaleAspectFill //Fits width and height might be cut off (or fits height with width cut off - basically a part of the image may be cut off as oppose to aspectfit where it would be letter boxed)
        //  imageView.clipToBounds = true // makes part of image that comes out of bounds to be cut off instead of extending out (i.e. does not resize container, just cuts off extra bits of image)
        
        return imageView
    }()
    
//    let userProfileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.green
//        imageView.image = UIImage(named:"taylor_swift_profile")
    
//        //imageView.layer.cornerRadius = 22
//        //imageView.layer.masksToBounds = true
//        return imageView
//    }()
    

    let separatorView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let titleLabel: UILable = {
//        let lable = UILabel()
//        label.backgroundColor = UIColor.purple
//        label.translatesAutoresizingMaskIntoConstraints = false
    
//        //label.text = "Taylor Swift - Blank Space"
//        return label
//    }()
    
//    let subtitleTextView: UITextView = {
//        let textView = UITextView()
//        textView.backgroundColor = UIColor.red
//        textView.translatesAutoresizingMaskIntoConstraints = false
    
//        //textView.text = "TaylorSwiftVEVO - 1,604,684,607 views • 2 years"
//        //textView.textContainerInset = UIEdgeInset(0,-4,0,0)
//        //textView.textColor = UIColor.lightGray
//        return textView
//    }()

    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        //addSubview(userProfileImageView)
        //addSubview(titleLabel)
        //addSubview(subtitleTextView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":thumbnailImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":thumbnailImageView]))
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))

        //  add visual constraints for profileImage, titleLabel and subtitleLabel here (Ep 1)
        
        //  thumbnailImageView.frame = CGRect(x: 0, y:0, width: 100, height: 100)
        //  backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//13)add new cell class VideoCell
//instantiate thumbnailView
//add thumbnailView as subview of cell
//set thumbnail size
//add constraints for thumbnailView padding (vertical and horizontal)
//remove thumnail size setting (no longer needed)

//add separator view
//correct the contraint notation (wrong notation causes crashes)
//make separator 1 pixel vertically
//remove blue background color for whole cell
//the last commit had many mistakes...

//14)add settings for thumbnailView and initialize profileImage, titleLabel and subtitleLabel





//2)add background color for main view
//3)change view controller subclass to collectionviewcontroller
//4)refactor(rename) ViewController class to HomeController

//6)remove view background color, has been replaced with collection view
//7)add collection view background color (it defaults to black)
//8)add navigationItem title
//9)add collectionView number of items func
//(crashes, cell to return needed)

//10)add collectionView cellforItematIndexPath func
//(still crashes, cell with identifier "cellId" not set)
//11)add function to register cell identifier "cellId"

//12)make blank "main interface" field in "deployment info", in general tab of project settings





