//
//  HomeConroller.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 24.09.2024.
//

import UIKit

final class HomeConroller: UIViewController {
    
    private enum Section {
        case main
    }
    
    private var cars: [Cars] = []
    private var filterdCars: [Cars] = []
    private var dataSource: UICollectionViewDiffableDataSource<Section, Cars>!
    private lazy var collectionVeiw = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        getCars()
        configureCollectionView()
        configureSerchController()
        configureDataSource()
    }
    
    private func getCars() {
        NetworkManager.shared.getCars(page: 1) { [weak self] (items, error) in
            guard let self = self else { return }
            
            guard let cars = items else {
                print(error!.rawValue)
                return
            }
            self.cars = cars
            self.updateData(cars: self.cars)
        }
    }
    
    private func configureCollectionView() {
        collectionVeiw = UICollectionView(frame: view.bounds, collectionViewLayout: getCollectionFlowLayout())
        view.addSubview(collectionVeiw)
        collectionVeiw.backgroundColor = .systemBackground
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
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Cars>(collectionView: collectionVeiw, cellProvider: { (collectionVeiw, IndexPath, car) -> UICollectionViewCell? in
            let cell = collectionVeiw.dequeueReusableCell(withReuseIdentifier: CarCell.reuseId, for: IndexPath) as! CarCell
            cell.set(car: car)
            
            return cell
        })
    }
    
    private func updateData(cars: [Cars]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Cars>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cars)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func configureSerchController() {
        let serchCV = UISearchController()
        serchCV.searchResultsUpdater = self
        serchCV.searchBar.delegate = self
        serchCV.searchBar.placeholder = "Serch mark a vichle"
        navigationItem.searchController = serchCV
    }
}

extension HomeConroller: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        
        filterdCars = cars.filter {
            $0.make.lowercased().contains(filter.lowercased()) ||
            $0.model.lowercased().contains(filter.lowercased())
        }
        
        updateData(cars: filterdCars)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
        updateData(cars: cars)
    }
    
    
}


