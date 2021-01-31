//
//  FormLibraryViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/17/21.
//

import UIKit
import SnapKit

/*
 
 /* test */
 let queue = QueueViewController()
 queue.setQueue([
     ChoiceViewController(title: "Favourite color.", subtitle: "What is ye favourite color?", choices: ["Blue", "Red", "Brown"]),
     BasicTextViewController(title: "Who are you?", subtitle: "What's your first and last name.", placeholder: "First Last"),
     ChoiceViewController(title: "Last question.", subtitle: "Favourite fruit?", choices: ["Watermelon", "Apple", "Orange", "Guava", "Strawberry"]),
 ], animated: false)
 
 */


class FormLibraryViewController : UIViewController, UICollectionViewDelegate {
    
    var gradientHeader:GradientHeader!
    
    var collectionView:FormLibraryCollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupCollectionView()
        loadDummyData()
        createAutolayoutConstraints()
    }
    
    func setupHeader() {
        gradientHeader = GradientHeader()
        gradientHeader.colors = [
            UIColor(red: 0.05, green: 0.92, blue: 0.92, alpha: 1.00).cgColor,
            UIColor(red: 0.13, green: 0.89, blue: 0.70, alpha: 1.00).cgColor,
            UIColor(red: 0.16, green: 1.00, blue: 0.78, alpha: 1.00).cgColor                
        ]
        view.addSubview(gradientHeader)
    }
    
    func setupCollectionView() {
        collectionView = FormLibraryCollectionView()
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    func createAutolayoutConstraints() {
        gradientHeader.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.height.lessThanOrEqualToSuperview()
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.gradientHeader.snp.bottom).offset(-20)
            make.left.right.equalTo(self.view)
            make.bottom.equalToSuperview()
        }
    }
    
    func loadDummyData() {
        var snap = collectionView.data.snapshot()
        snap.appendSections([LibrarySection(type: .inProgress), LibrarySection(type: .complete)])
        snap.appendItems([
            LibraryRow(text: "Stock Dividends", image: UIImage(named: "Stocks")!, percent: 0.17, form: Form()),
            LibraryRow(text: "Stock Dividends II", image: UIImage(named: "Stocks")!, percent: 0.59, form: Form()),
            LibraryRow(text: "Stock Dividends III", image: UIImage(named: "Stocks")!, percent: 0.94, form: Form()),
        ], toSection: snap.sectionIdentifiers[0])
        snap.appendItems([LibraryRow(text: "Stock Dividends IV", image: UIImage(named: "Stocks")!, percent: 1.0, form: Form()),], toSection: snap.sectionIdentifiers[1])
        collectionView.data.apply(snap)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = self.collectionView.data.snapshot().sectionIdentifiers[indexPath.section]
        guard section.type == .inProgress else { return }
        let item = self.collectionView.data.snapshot().itemIdentifiers[indexPath.row]
        print(item.text)
    }
}
