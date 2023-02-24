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
                print(model.results.first?.image as Any)
                print(String(describing: model))
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterViewCell.cellIdentifier, for: indexPath) as? RMCharacterViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterColletionViewCellViewModel(characterName: "Suraj", characterStatus: .Alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        cell.backgroundColor = .systemGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
