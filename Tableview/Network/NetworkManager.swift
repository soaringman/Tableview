//
//  NetworkManager.swift
//  Tableview
//
//  Created by Алексей Гуляев on 07.11.2022.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func showData(results: Employee)
    func showError()
}

final class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?

    private let api = Api()
    
    func fetchData(url: String) {
        api.decodeData(url: url) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let employee):
                DispatchQueue.main.async {
                    self.delegate?.showData(results: employee)
                }
            case .failure(_):
                self.delegate?.showError()
            }
        }
    }
}
