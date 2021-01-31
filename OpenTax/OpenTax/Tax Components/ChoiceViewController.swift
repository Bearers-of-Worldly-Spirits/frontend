//
//  ChoiceViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/24/21.
//

import UIKit
import SnapKit



class ChoiceViewController : BaseComponentViewController, UICollectionViewDelegate {
    
        
    var choices:[String]
            
    
    init(title:String, subtitle:String, choices:[String]) {
        self.choices = choices
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
        
        collectionView.delegate = self
    }
        
    func fillData() {
        var snap = data.snapshot()
        snap.appendSections([TitleCell.identifier, SubtitleCell.identifier, TextOption.identifier])
        snap.appendItems([ComponentData(text: _title, image: nil)], toSection: TitleCell.identifier)
        snap.appendItems([ComponentData(text: _subtitle, image: nil)], toSection: SubtitleCell.identifier)
        
        for i in choices {
            snap.appendItems([
                ComponentData(text: i, image: nil),
            ],toSection: TextOption.identifier)
        }        
        
        data.apply(snap)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TextOption {
            guard cell.clicked == false else {
                cell.clicked = false
                return
            }
            for cell in collectionView.visibleCells {
                if let cell = cell as? TextOption {
                    cell.clicked = false
                }
            }
            cell.clicked = true
        }
    }
}
