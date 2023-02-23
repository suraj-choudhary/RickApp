//
//  RMCharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 22/02/23.
//
import Foundation
import UIKit
final class RMCharacterListViewModel: NSObject {
    func fetchCharacter() {
        RMService.shared.execute(.listChracter, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
                print(model.info.count)
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
        
    }
}

extension RMCharacterListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    /// cell for item of collectiob view
    /// - Parameters:
    ///   - collectionView: its a charcater of collection
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    
    
}
