//
//  MovieDetailViewController.swift
//  SkyExercise
//
//  Created by Matheus França on 16/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var movieCoverImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var movieData: MovieModel?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavBar()
    }
    
    //MARK: - Init
    convenience required init(movieData: MovieModel) {
        self.init()
        self.movieData = movieData
    }
    
    //MARK: - Setup
    func setupNavBar() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        self.title = "Descrição"
    }
    
    func setupLayout() {
        movieTitleLabel.text = movieData?.title
        releaseYearLabel.text = "Ano de lançamento: \(movieData?.releaseYear ?? "--")"
        durationLabel.text = "Duração: \(movieData?.duration ?? "--")"
        descriptionLabel.text = movieData?.overview
        //Could use vertical collectionView for all cover images
        if let url = URL(string: movieData?.backdropsUrl?[0] ?? "") {
            movieCoverImage.downloaded(from: url)
        }
    }
}
