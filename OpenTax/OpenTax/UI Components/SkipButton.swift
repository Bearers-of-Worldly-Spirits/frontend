//
//  SkipButton.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/25/21.
//

import UIKit
import SnapKit
import Closures


class SkipButton : UIButton {
    
    
    var line:UIView!
    var label:UILabel!
    var spacer:UIView!
    
    var pressed:Bool = false {
        didSet {
            if pressed == true {
                self.label.textColor = .primary
            }else{
                self.label.textColor = .tertiaryLabel
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupUI()
        snap()
        self.addTarget(self, action: #selector(SkipButton.didPress), for: .touchDown)
        self.addTarget(self, action: #selector(SkipButton.didRelease), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    @objc func didPress() {
        self.pressed = true
    }
    
    @objc func didRelease() {
        self.pressed = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupUI() {        
        line = UIView()
        line.backgroundColor = .systemGray5
        line.layer.cornerRadius = 0.5
        addSubview(line)
        
        label = UILabel()
        label.text = "Skip this question?"
        label.textColor = .tertiaryLabel
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        addSubview(label)
        
        spacer = UIView()
        addSubview(spacer)
    }
    
    func snap() {
        line.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(self.line.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
