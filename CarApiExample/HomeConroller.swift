//
//  HomeConroller.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 24.09.2024.
//

import UIKit

final class HomeConroller: UIViewController {
    
    var cars: [Cars] = []
    
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
    }
}
