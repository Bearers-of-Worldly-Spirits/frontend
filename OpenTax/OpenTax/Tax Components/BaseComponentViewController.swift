//
//  BaseComponentViewController.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/24/21.
//

import UIKit
import SnapKit


class BaseComponentViewController : UIViewController {
    
    
    
    var collectionView:UICollectionView!
    
    var data:UICollectionViewDiffableDataSource<String, ComponentData>!
    
    var _title:String = ""
    
    var _subtitle:String = ""
    
    var canProceed:Bool = false
        
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.barTintColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: getLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(SubtitleCell.self, forCellWithReuseIdentifier: SubtitleCell.identifier)
        collectionView.register(TextOption.self, forCellWithReuseIdentifier: TextOption.identifier)
        collectionView.register(TextfieldCell.self, forCellWithReuseIdentifier: TextfieldCell.identifier)
        collectionView.delaysContentTouches = false
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func createDataHandler() {
        data = UICollectionViewDiffableDataSource<String, ComponentData>.init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in       
            let section = self.data.snapshot().sectionIdentifiers[indexPath.section]
            var cell = collectionView.dequeueReusableCell(withReuseIdentifier: section, for: indexPath) as? ComponentBased
            cell?.data = data
            return cell as? UICollectionViewCell
        })
    }
}
