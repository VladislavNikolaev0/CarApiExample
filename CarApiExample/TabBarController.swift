//
//  TabBarController.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 24.09.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .white
        setupNavigationConrollers()
    }
    
    //MARK: - private method
    private func setupNavigationConrollers() {
        let vc1 = HomeConroller()
        let vc2 = FavoriteConroller()
        
        vc1.title = "Главная"
        vc2.title = "Избранное"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "heart.fill"), tag: 2)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2], animated: true)
    }
    
}
