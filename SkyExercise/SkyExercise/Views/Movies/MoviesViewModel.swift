//
//  MoviesViewModel.swift
//  SkyExercise
//
//  Created by Matheus França on 16/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    var movies: [MovieModel]?

    func fetchData(success: @escaping() -> Void, errorr: @escaping(String) -> Void) {
        //Ideal colocar em um repositorio / service
        if let url = URL(string: "https://sky-exercise.herokuapp.com/api/Movies") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res: [MovieModel] = try JSONDecoder().decode([MovieModel].self, from: data)
                        self.movies = res
                        success()
                    } catch let errorMessage {
                        errorr(errorMessage.localizedDescription)
                    }
                }
            }.resume()
        }
    }
    
    func getNumberOfItems() -> Int {
        return movies?.count ?? 0
    }
    
    func getCollectionViewItem(index: Int) -> MovieModel {
        return movies?[index] ?? MovieModel()
    }
}
