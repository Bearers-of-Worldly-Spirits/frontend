//
//  TextOption.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/27/21.
//

import UIKit
import SnapKit


final class TextOption : UICollectionViewCell, ComponentBased {
    
    static var identifier = "text_option"
    
    var data:ComponentData = ComponentData() {
        didSet {
            label.text = data.text
        }
    }
    
    var clicked = false {
        didSet{
            if clicked == true {
                label.textColor = .systemBackground
                box.layer.borderColor = UIColor.primary.cgColor
                box.backgroundColor = .primary
            }else{
                label.textColor = .tertiaryLabel
                box.layer.borderColor = UIColor.systemGray5.cgColor
                box.backgroundColor = .clear
            }
        }
    }
    
    private var label:UILabel!
    
    private var box:UIView!
    
    private var spacer:UIView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        box = UIView()
        box.layer.cornerCurve = .continuous
        box.layer.cornerRadius = 10
        box.layer.borderWidth = 2
        box.layer.borderColor = UIColor.systemGray5.cgColor
        box.backgroundColor = .clear
        contentView.addSubview(box)
        
        label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textColor = .tertiaryLabel
        contentView.addSubview(label)
        
        spacer = UIView()
        contentView.addSubview(spacer)
                
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(200)
            make.height.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        box.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
    }
}
