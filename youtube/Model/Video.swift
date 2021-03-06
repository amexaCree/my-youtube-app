//
//  Video.swift
//  youtube
//
//  Created by Amy Turnah on 7/9/18.
//  Copyright © 2018 Amy. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
