//
//  RMCharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 22/02/23.
//

import Foundation
struct RMCharacterListViewModel {
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
