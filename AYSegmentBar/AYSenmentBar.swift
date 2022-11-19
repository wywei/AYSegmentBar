//
//  AYSenmentBar.swift
//  AYSegmentBar
//
//  Created by 王亚威 on 2022/11/6.
//

import UIKit


protocol AYSegmentBarDeleagte: NSObjectProtocol {
    func segmentBarDidSelected(index to: Int, from: Int)
}

fileprivate let titleW: CGFloat = 80
fileprivate let titleH: CGFloat = 80

class AYSegmentBar: UIView {
    public private(set) lazy var config = AYSegmentBarConfig.defaultConfig()
    public var selectIndex: Int = 0
    
    public lazy var itemBtns = [UIButton]()
    public var items: [String]? {
        didSet {
            guard let items = items else { return }
            itemBtns.forEach { $0.removeFromSuperview() }
            for (i , title) in items.enumerated() {
                let btn = UIButton()
                btn.setTitle(title, for: .normal)
                btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
                btn.frame = CGRect(x: CGFloat(i) * titleW, y: 0, width: titleW, height: titleH)
                contentView.addSubview(btn)
                itemBtns.append(btn)
            }
            
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    lazy var contentView = UIScrollView()
    @objc func clicked() {
        print("clicked")
    }
    
    func updateConfig(configCallback: ((AYSegmentBarConfig) -> Void)) {
        
        configCallback(config)
        
        itemBtns.forEach { btn in
            btn.setTitleColor(config.itemSelectColor, for: UIControl.State.selected)
            btn.setTitleColor(config.itemNormalColor, for: UIControl.State.normal)
        }
        // 设置其他控件属性
        setNeedsLayout()
        layoutIfNeeded()
    }

    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
}


extension AYSegmentBar {
    
    fileprivate func setupUI() {
        addSubview(contentView)
    }
    
}
