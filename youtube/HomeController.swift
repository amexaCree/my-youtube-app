//
//  ViewController.swift
//  youtube
//
//  Created by Amy Turnah on 6/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = {
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        return [blankSpaceVideo]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        view.backgroundColor = UIColor.red //changed for new swift
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId") //changed for new swift
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5  //video.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        // cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        let heightForOthers = CGFloat(16 + 68) // for extra height from profile, title and subtitle views, calculated from constraints) // 32 for 16px padding above and below (without profileView, titleView and subtitleView)
        return CGSize(width: view.frame.width, height: height + heightForOthers) // changed for new swift
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
        // imageView.translatesAutoresizingMaskIntoConstraints = false //has been moved to addConstraintsWithFormat func in UIView extension
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill //Fits width and height might be cut off (or fits height with width cut off - basically a part of the image may be cut off as oppose to aspectfit where it would be letter boxed)
        imageView.clipsToBounds = true // makes part of image that comes out of bounds to be cut off instead of extending out (i.e. does not resize container, just cuts off extra bits of image)
        
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        //imageView.image = UIImage(named:"taylor_swift_profile")

        //imageView.layer.cornerRadius = 22
        //imageView.layer.masksToBounds = true
        return imageView
    }()
    

    let separatorView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.black
        //view.backgroundColor = UIColor(red: 230/2555, green: 230/255, blue: 230/255, alpha: 1)
        //view.translatesAutoresizingMaskIntoConstraints = false //has been moved to addConstraintsWithFormat func in UIView extension
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
        addSubview(userProfileImageView)
        //addSubview(titleLabel)
        //addSubview(subtitleTextView)
        
        //horizontal constraints
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        //addConstraintsWithFormat("V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, separatorView)
        
        
        
        
        //--- saving for later ---//
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))

        
        
        //  add visual constraints for profileImage, titleLabel and subtitleLabel here (Ep 1)
        
        //       addConstraints(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        //       addConstraints(NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //       addConstraints(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        //       addConstraints(NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //  .....more to add for subtitle and profile pic.......

        
        
        //  thumbnailImageView.frame = CGRect(x: 0, y:0, width: 100, height: 100)
        
        //  backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for index in views.indices {  // had to be changed for new swift
            let key = "v\(index)"
            let view = views[index]
            view.translatesAutoresizingMaskIntoConstraints = false // this has to be set to false is constraints on a view is set in code
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


//20)prior mistake - miscalcution
//The 16:9 ratio for thumbnail image was always correct.
//I was supposed to add to height of cell the padding above and below thumbnail (32px)
//It works properly with 16:9 ratio now after adding this.



//19)refactor/cleanup/simplify code by putting separator and thumbnail vertical constraints in one visual format discription
//18)more refactoring:
//add new extension to UIView with addConstraintsWithFormat func
//replace addConstraints with visual format implementations with new func (addConstraintsWithFormat)
//move translatesAutoresizingMaskIntoConstraints into addConstraintsWithFormat func





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
//changed size returned in sizeforItemAtIndexpath func height, to give more space for thumbnailImage
//15)remove extra space between cells (I jumped this step was supposed to be before adding separator) by adding minimumLineSpacingAtIndexpath func (need to commit this note!)
//16)add default thumbnail image (taylor swift blank space, HD image gotten from google search)
//17)adjust height ratio for new youtube thumbnail dimensions.
//18)make separator not touch top edge by removing first pipe in visual format constraints (I missed this aswell)




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





