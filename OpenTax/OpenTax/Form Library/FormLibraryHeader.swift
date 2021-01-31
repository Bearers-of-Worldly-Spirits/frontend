//
//  FormLibraryHeader.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/20/21.
//

import UIKit
import SnapKit


class FormLibraryHeader : UICollectionReusableView {
    
    var label:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .systemGray2
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
