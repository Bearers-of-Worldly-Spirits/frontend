//
//  FormLibraryCollectionView.swift
//  OpenTax
//
//  Created by Josh Arnold on 1/17/21.
//

import UIKit


class FormLibraryCollectionView : UICollectionView{
    
    
    public var data:UICollectionViewDiffableDataSource<LibrarySection, LibraryRow>!
    private var reuseIdentifier:String = "cell"
    

    init() {
        super.init(frame: .zero, collectionViewLayout: FormLibraryCollectionView.getLayout())
        registerClasses()
        createDataSource()
        handleHeaders()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerClasses() {
        register(FormLibraryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        register(FormLibraryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    func setupAppearance() {
        self.backgroundColor = .systemBackground
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 20
        self.layer.cornerCurve = .continuous
    }
    
    static func getLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(90))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        let layout = UICollectionViewCompositionalLayout.init(section: section)
        return layout
    }
    
    func createDataSource() {
        data = UICollectionViewDiffableDataSource<LibrarySection, LibraryRow>.init(collectionView: self, cellProvider: { (collectionView, indexPath, libraryRow) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? FormLibraryCollectionViewCell else {return nil}
            cell.setData(libraryRow)
            return cell
        })
    }
    
    func handleHeaders() {
        data.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? FormLibraryHeader else {
                return nil
            }
            
            let section = self.data.snapshot().sectionIdentifiers[indexPath.section]
            
            if section.type == .inProgress {
                sectionHeader.label.text = "In Progress"
            }else if section.type == .complete {
                sectionHeader.label.text = "Complete"
            }else{
                sectionHeader.label.text = ""
            }
            
            return sectionHeader
        }
    }
}
