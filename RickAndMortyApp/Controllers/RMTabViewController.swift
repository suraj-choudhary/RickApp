//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 18/02/23.
//
import UIKit

/// Controller to house tabs and root tab view controllers
final class RMTabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    /// To Setup the tab view
    private func setupTabs() {
        
        let characterVc = RMCharacterViewController()
        let locationVc = RMLocationViewController()
        let episodeVc = RMEpisodeViewController()
        let settingVc = RMsettingViewController()
        
        characterVc.navigationItem.largeTitleDisplayMode = .automatic
        locationVc.navigationItem.largeTitleDisplayMode = .automatic
        episodeVc.navigationItem.largeTitleDisplayMode = .automatic
        settingVc.navigationItem.largeTitleDisplayMode = .automatic
        
        characterVc.title = "Character"
        locationVc.title = "Location"
        episodeVc.title = "Episodes"
        settingVc.title = "Setting"
        
        let nav1 = UINavigationController(rootViewController: characterVc)
        let nav2 = UINavigationController(rootViewController: locationVc)
        let nav3 = UINavigationController(rootViewController: episodeVc)
        let nav4 = UINavigationController(rootViewController: settingVc)
        
        nav1.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"),
                                       tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
    
}

