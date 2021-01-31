//
//  TextfieldCell.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/27/21.
//

import UIKit
import SnapKit


final class TextfieldCell : UICollectionViewCell, ComponentBased {
    
    static var identifier = "textfield"
    
    var data:ComponentData = ComponentData() {
        didSet {
            textfield.placeholder = data.text
        }
    }
    
    private var textfield:UITextField!
    
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
        
        textfield = UITextField()
        textfield.font = UIFont.preferredFont(forTextStyle: .body)
        textfield.adjustsFontForContentSizeCategory = true
        textfield.textColor = .primary
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .words
        textfield.tintColor = .primary
        contentView.addSubview(textfield)
        
        spacer = UIView()
        contentView.addSubview(spacer)
            
        textfield.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(60)
            make.height.lessThanOrEqualToSuperview()
        }
        
        spacer.snp.makeConstraints { (make) in
            make.top.equalTo(self.textfield.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        box.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(40)
        }
    }
}
