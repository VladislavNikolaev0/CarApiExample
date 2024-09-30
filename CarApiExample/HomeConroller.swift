//
//  HomeConroller.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 24.09.2024.
//

import UIKit

final class HomeConroller: UIViewController {
    
    private var cars: [Cars] = []
    private lazy var collectionVeiw = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        NetworkManager.shared.getCars(page: 1) { (items, error) in
            guard let cars = items else {
                print(error!.rawValue)
                return
            }
            print(cars.count)
            print(cars)
        }
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionVeiw = UICollectionView(frame: view.bounds, collectionViewLayout: getCollectionFlowLayout())
        view.addSubview(collectionVeiw)
        collectionVeiw.backgroundColor = .cyan
        collectionVeiw.register(CarCell.self, forCellWithReuseIdentifier: "carID")
    }
    
    private func getCollectionFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let avialabelWidth = width - (padding * 2) - minimumItemSpacing
        let itemWidth = avialabelWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(
            top: padding,
            left: padding,
            bottom: padding,
            right: padding
        )
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
