//
//  Comments.swift
//  youtube
//
//  Created by Amy Turnah on 9/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import Foundation







//HOME CONTROLLER
//27)add profile image asset
//28)add circular mask to profileImageView


//------------------------
//HOME CONTROLLER
//24)cleanup:
//get rid of no longer needed comments
//image asset was added sometime within the last steps...

//21)add profileImageView and constraints
//22)add titleLabel and constraints
//23)add subtitleLabel adn constraints


//HOME CONTROLLER
//20)prior mistake - miscalcution
//The 16:9 ratio for thumbnail image was always correct.
//I was supposed to add to height of cell the padding above and below thumbnail (32px)
//It works properly with 16:9 ratio now after adding this.




//HOME CONTROLLER
//19)refactor/cleanup/simplify code by putting separator and thumbnail vertical constraints in one visual format discription
//18)more refactoring:
//add new extension to UIView with addConstraintsWithFormat func
//replace addConstraints with visual format implementations with new func (addConstraintsWithFormat)
//move translatesAutoresizingMaskIntoConstraints into addConstraintsWithFormat func



//HOME CONTROLLER
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



//HOME CONTROLLER
//2)add background color for main view
//3)change view controller subclass to collectionviewcontroller
//4)refactor(rename) ViewController class to HomeController

//IN APPDELEGATE
//5)initialize (UICollectionView with non nil layout parameter)


//IN HOME CONTROLLER
//6)remove view background color, has been replaced with collection view
//7)add collection view background color (it defaults to black)
//8)add navigationItem title
//9)add collectionView number of items func
//(crashes, cell to return needed)

//10)add collectionView cellforItematIndexPath func
//(still crashes, cell with identifier "cellId" not set)
//11)add function to register cell identifier "cellId"

//12)make blank "main interface" field in "deployment info", in general tab of project settings

//IN APPDELEGATE
//1)Added here -- to make setting up layout from code easier.



