//
//  VideoCell.swift
//  youtube
//
//  Created by Amy Turnah on 9/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            //solution to previous code that crashes easily
            if let thumbnailImageName = video?.thumbnailImageName {
                thumbnailImageView.image = UIImage(named: thumbnailImageName)
            }
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName)
            }
            
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill //Fits width and height might be cut off (or fits height with width cut off - basically a part of the image may be cut off as oppose to aspectfit where it would be letter boxed)
        imageView.clipsToBounds = true // makes part of image that comes out of bounds to be cut off instead of extending out (i.e. does not resize container, just cuts off extra bits of image)
        //--- save for now ----
        //imageView.backgroundColor = UIColor.blue
        // imageView.translatesAutoresizingMaskIntoConstraints = false //has been moved to addConstraintsWithFormat func in UIView extension
        
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named:"taylor_swift_profile")
        imageView.layer.cornerRadius = 22  // half of profileImageView height
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    let separatorView: UIView =  {
        let view = UIView()
        //view.backgroundColor = UIColor.black
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        //view.translatesAutoresizingMaskIntoConstraints = false //has been moved to addConstraintsWithFormat func in UIView extension
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false // uses normal function for setting constraints so this needs to be set here.
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = UIColor.red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO - 1,604,684,607 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0,-4,0,0)
        textView.textColor = UIColor.lightGray
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        //horizontal constraints
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        
        //top constraint
        //had to be changed for new swift
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        //--- save for notes ---//
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        
        //addConstraintsWithFormat("V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, separatorView)
        
        
    }
    

    
}

