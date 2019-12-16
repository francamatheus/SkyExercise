//
//  HomeViewController.swift
//  SkyExercise
//
//  Created by Matheus França on 13/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var seeCatalogButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Setup
    func setupNavBar() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        self.title = ""
    }
    
    func setupLayout() {
        iconImage.layer.cornerRadius = 8
        seeCatalogButton.layer.cornerRadius = 8
    }
    
    //MARK: - Acitons
    @IBAction func seeCatalog(_ sender: Any) {
        self.navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
}
