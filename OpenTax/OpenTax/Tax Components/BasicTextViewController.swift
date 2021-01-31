//
//  BasicTextViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/27/21.
//

import UIKit
import SnapKit
import Closures



class BasicTextViewController : BaseComponentViewController, UIScrollViewDelegate, UICollectionViewDelegate {
    
    
    var placeholder:String
    
        
    init(title:String, subtitle:String, placeholder:String) {
        self.placeholder = placeholder
        super.init()
        self._title = title
        self._subtitle = subtitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createDataHandler()
        fillData()
        self.collectionView.delegate = self
    }
        
    func fillData() {
        var snap = data.snapshot()
        snap.appendSections([TitleCell.identifier, SubtitleCell.identifier, TextfieldCell.identifier])
        snap.appendItems([ComponentData(text: _title, image: nil)], toSection: TitleCell.identifier)
        snap.appendItems([ComponentData(text: _subtitle, image: nil)], toSection: SubtitleCell.identifier)
        snap.appendItems([
            ComponentData(text: self.placeholder, image: nil),
        ],toSection: TextfieldCell.identifier)
        data.apply(snap)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
