//
//  ViewController.swift
//  AYSegmentBar
//
//  Created by 王亚威 on 2022/11/6.
//

import UIKit

protocol MyTextFieldDelegate: NSObjectProtocol {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
}

class MyTextField: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var respodDelegate: MyTextFieldDelegate?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        respodDelegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        return true
    }
    
}


class Model: NSObject {
     @objc var name: String?
     var age: Int = 0
    
    init(_ dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}

class ViewController: UIViewController {

    let dic: [String: Any] = ["name": "zs", "age": 12, "sex": 1]

//    lazy var segmentBarVc = AYSegmentBarVc()
    
    lazy var t1: MyTextField = {
        let t = MyTextField()
        t.respodDelegate = self
        return t
    }()
    
    lazy var t2: MyTextField = {
        let t = MyTextField()
        t.respodDelegate = self
        return t
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        t1.frame = CGRect.init(x: 10, y: 10, width: 200, height: 50)
        t1.backgroundColor = .red
        view.addSubview(t1)
        
        t2.frame = CGRect.init(x: 10, y: 220, width: 200, height: 50)
        t2.backgroundColor = .blue
        view.addSubview(t2)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }

    
    

}


extension ViewController: MyTextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        if textField == t1 {
            t2.becomeFirstResponder()
        }
        
        if textField == t2 {
            t1.becomeFirstResponder()
        }
        
    }
}


