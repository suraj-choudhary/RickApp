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
        
        let request = RMRequest(
            endPoint: .character,
            pathComponet: ["1"]
        )
        
        print(request.url)
    }
    
    
    
    
}

