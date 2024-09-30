//
//  CAImageView.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 29.09.2024.
//

import UIKit

final class CAImageView: UIImageView {
    
    //MARK: - private properties
    
    private lazy var icon = UIImage(named: "standartImage")
    
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(imageName: String) {
        icon = UIImage(named: imageName)
    }
    
    func downLoadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if error != nil { print("error"); return }
            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else { print("response"); return }
            } else { return }
            guard let data = data else { print("data"); return }
            
            guard let image = UIImage(data: data) else { print("image"); return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
    
    //MARK: - configure
    
    private func configure() {
        layer.cornerRadius = 10
        image = icon
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
