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
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId") //changed for new swift
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200) // changed for new swift
        
    }

}

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



