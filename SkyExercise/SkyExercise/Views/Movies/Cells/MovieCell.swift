//
//  MovieCell.swift
//  SkyExercise
//
//  Created by Matheus França on 16/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(data: MovieModel) {
        if let url = URL(string: data.coverUrl ?? "") {
            movieImage.downloaded(from: url)
        }
        movieTitle.text = data.title
    }
}
