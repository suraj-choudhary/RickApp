//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 18/02/23.
//
import UIKit
/// Controller to Show and Search for Character
final class RMCharacterViewController: UIViewController {
    private let characterListView = CharacterListView()
    /// view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Character"
        setupView()
    }
    /// setup view charcater list
    func setupView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

