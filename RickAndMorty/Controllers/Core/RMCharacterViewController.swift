//
//  RMCharterViewController.swift
//  RickAndMorty
//
//  Created by suraj kumar on 26/01/23.
//

import UIKit
/// controller to show and serach for character
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character"
        view.backgroundColor = .systemBackground
        RMService.shared.execute(.listCharacter, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

