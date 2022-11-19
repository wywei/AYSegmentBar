//
//  AYSegmentBarVc.swift
//  AYSegmentBar
//
//  Created by 王亚威 on 2022/11/6.
//

import UIKit

class AYSegmentBarVc: NSObject {
    
    lazy var segmentBar = AYSegmentBar()
    
    public func setup(items: [String], childVcs: [UIViewController]) {
        segmentBar.items = items
    }

}
