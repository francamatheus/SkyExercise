//
//  MoviesViewController.swift
//  SkyExercise
//
//  Created by Matheus França on 16/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent 
    }
    
    var viewModel = MoviesViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavBar()
        setupCollectionView()
        fetchData()
    }
    
    //MARK: - Setup
    func setupLayout() {
        self.view.backgroundColor = .black
        self.collectionView.backgroundColor = .black
    }
    
    func setupNavBar() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        self.title = "Cine Sky"
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    //MARK: - Data
    func fetchData() {
        viewModel.fetchData(success: { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }) { (errorMessage) in
            // Error Message Alert
        }
    }
}

//MARK: - CollectionView Extension
extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell
        cell?.setup(data: viewModel.getCollectionViewItem(index: indexPath.row))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width / 2
        return CGSize(width: screenWidth, height: screenWidth + 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController(movieData: viewModel.getCollectionViewItem(index: indexPath.row))
        self.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
