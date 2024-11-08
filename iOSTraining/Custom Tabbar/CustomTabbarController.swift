//
//  CustomTabbarController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/7/24.
//

import Foundation
import UIKit
class CustomTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    configureViewControllers()
  }
  private func setupTabBar() {
    // Customize your tab bar appearance here (optional)
    tabBar.tintColor = .systemBlue
    tabBar.unselectedItemTintColor = .gray
    tabBar.backgroundColor = .white
    tabBar.isTranslucent = false
  }
  private func configureViewControllers() {
    let vc1 = HomeViewController()
    let vc2 = ProductViewController()
    let vc3 = TextbookViewController()
    let vc4 = SettingsViewController()
      
    // Set titles and images for each tab
    vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    vc2.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "shippingbox"), tag: 0)
    vc3.tabBarItem = UITabBarItem(title: "Textbook", image: UIImage(systemName: "book.pages.fill"), tag: 1)
    vc4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
    // Embed each view controller in a UINavigationController (optional)
    let nav1 = UINavigationController(rootViewController: vc1)
    let nav2 = UINavigationController(rootViewController: vc2)
    let nav3 = UINavigationController(rootViewController: vc3)
    let nav4 = UINavigationController(rootViewController: vc4)
    // Add the view controllers to the tab bar controller
    viewControllers = [nav1, nav2, nav3, nav4]
  }
}
