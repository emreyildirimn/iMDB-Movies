//
//  ThirdViewController.swift
//  imdbMovies
//
//  Created by mac on 13.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var mainTextLbl: UITextView!
    @IBOutlet var posterImg: UIImageView!
    @IBOutlet var favoriteImg: UIButton!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    var movieDetail : [String] = []
    var savedArrayTitle : [String] = []
    var savedArrayPoster : [String] = []
    var savedArrayOverview : [String] = []
    var savedArrayRating : [String] = []
    var savedArrayCategory : [Int] = []
    var category : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        if savedArrayTitle.contains(movieDetail[0]) {
            favoriteImg.setImage(UIImage(named: "favori"), for: UIControl.State.normal)
        }
        else {
            favoriteImg.setImage(UIImage(named: "ekle"), for: UIControl.State.normal)
        }
        titleLbl.text = movieDetail [0]
        ratingLbl.text = "iMDB: \(movieDetail [1])"
        mainTextLbl.text = (movieDetail [2])
        downloadImage(from: URL(string: "https://image.tmdb.org/t/p/original\(movieDetail[3])")!)
        
    }
    
    @IBAction func favoriBtn(_ sender: Any) {
        if savedArrayTitle.contains(movieDetail[0]) {
            savedArrayTitle.remove(at: savedArrayTitle.firstIndex(of: movieDetail[0])!)
            savedArrayRating.remove(at: savedArrayRating.firstIndex(of: movieDetail[1])!)
            savedArrayOverview.remove(at: savedArrayOverview.firstIndex(of: movieDetail[2])!)
            savedArrayPoster.remove(at: savedArrayPoster.firstIndex(of: movieDetail[3])!)
            savedArrayCategory.remove(at: savedArrayCategory.firstIndex(of: category)!)
            favoriteImg.setImage(UIImage(named: "ekle"), for: UIControl.State.normal)
        }
        else {
            savedArrayTitle.append(movieDetail[0])
            savedArrayRating.append(movieDetail[1])
            savedArrayOverview.append(movieDetail[2])
            savedArrayPoster.append(movieDetail[3])
            savedArrayCategory.append(category)
            favoriteImg.setImage(UIImage(named: "favori"), for: UIControl.State.normal)
        }
        resetDefaults()
        UserDefaults.standard.setValue(savedArrayTitle, forKey: "savedArrayTitle")
        UserDefaults.standard.setValue(savedArrayRating, forKey: "savedArrayRating")
        UserDefaults.standard.setValue(savedArrayOverview, forKey: "savedArrayOverview")
        UserDefaults.standard.setValue(savedArrayPoster, forKey: "savedArrayPoster")
        UserDefaults.standard.setValue(savedArrayCategory, forKey: "savedArrayCategory")
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.posterImg.image = UIImage(data: data)
            }
        }
    }
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
}
