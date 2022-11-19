//
//  AYSegmentBarConfig.swift
//  AYSegmentBar
//
//  Created by 王亚威 on 2022/11/6.
//

import UIKit

class AYSegmentBarConfig: NSObject {
    
    static func defaultConfig() -> AYSegmentBarConfig {
        let config = AYSegmentBarConfig()
        config.itemNormalColor = .gray
        config.itemSelectColor = .orange
        
        config.indicatorColor = .red
        config.indicatorHeight = 2
        config.indicatorExtraW = 10
        return config
    }
    
    var itemNC:((UIColor) -> AYSegmentBarConfig) {
        return { color in
            self.itemNormalColor = color
            return self
        }
    }

    var itemSC:((UIColor) -> AYSegmentBarConfig) {
        return { color in
            self.itemNormalColor = color
            return self
        }
    }
    
    var indicatorC:((UIColor) -> AYSegmentBarConfig) {
        return { color in
            self.indicatorColor = color
            return self
        }
    }
    
    var indicatorH:((CGFloat) -> AYSegmentBarConfig) {
        return { height in
            self.indicatorHeight = height
            return self
        }
    }
    
    var indicatorEW:((CGFloat) -> AYSegmentBarConfig) {
        return { width in
            self.indicatorExtraW = width
            return self
        }
    }

    
    var itemSelectColor: UIColor = .orange {
        didSet {
            
        }
    }
    
    var itemNormalColor: UIColor = .gray {
        didSet {
            
        }
    }
     
    
    var indicatorColor: UIColor = .gray {
        didSet {
            
        }
    }
    
    var indicatorHeight: CGFloat = 40 {
        didSet {
            
        }
    }
    
    var indicatorExtraW: CGFloat = 10 {
        didSet {
            
        }
    }
    
  
 
}
