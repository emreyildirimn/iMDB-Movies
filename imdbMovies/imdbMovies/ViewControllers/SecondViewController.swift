//
//  SecondViewController.swift
//  imdbMovies
//
//  Created by mac on 12.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    @IBOutlet var tableView: UITableView!
    var movies : [Results] = []
    var category : Int = 0
    var searchingMovies : [String] = []
    var moviesTitles : [String] = []
    var voteAverage : [Double] = []
    var overview : [String] = []
    var posterPath : [String] = []
    var searchingNow : Bool = false
    var movieDetail : [String] = []
    var savedArrayTitle : [String] = []
    var savedArrayPoster : [String] = []
    var savedArrayOverview : [String] = []
    var savedArrayRating : [String] = []
    var savedArrayCategory : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        savedArrayTitle = UserDefaults.standard.object(forKey: "savedArrayTitle") as? [String] ?? [String]()
        savedArrayPoster = UserDefaults.standard.object(forKey: "savedArrayPoster") as? [String] ?? [String]()
        savedArrayOverview = UserDefaults.standard.object(forKey: "savedArrayOverview") as? [String] ?? [String]()
        savedArrayRating = UserDefaults.standard.object(forKey: "savedArrayRating") as? [String] ?? [String]()
        savedArrayCategory = UserDefaults.standard.object(forKey: "savedArrayCategory") as? [Int] ?? [Int]()
        print (savedArrayTitle)
                  print (savedArrayRating)
                  print (savedArrayOverview)
                  print (savedArrayPoster)
                  print (savedArrayCategory)
        for index in 0...movies.count-1{
            if movies[index].genre_ids.contains(category) {
                moviesTitles.append(movies[index].title)
                voteAverage.append(movies[index].vote_average)
                overview.append(movies[index].overview)
                posterPath.append(movies[index].poster_path)
            }
        }
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNow = true
        searchingMovies = moviesTitles.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchingNow == true {
        return  searchingMovies.count
        } else {
        return moviesTitles.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if searchingNow == false {
            cell.textLabel?.text = String(indexPath.row + 1) + ". " + moviesTitles[indexPath.row]
        }
        else {
            cell.textLabel?.text = String(indexPath.row + 1) + ". " + searchingMovies[indexPath.row]
        }
        return cell
          
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieDetail.removeAll()
        if searchingNow == true {
          //  movieIndex = (searchingMovies[indexPath.row]) // burayı yapacaksın
            movieDetail.append(moviesTitles[moviesTitles.firstIndex(of: searchingMovies[indexPath.row])!])
            movieDetail.append(String(voteAverage[moviesTitles.firstIndex(of: searchingMovies[indexPath.row])!]))
            movieDetail.append(overview[moviesTitles.firstIndex(of: searchingMovies[indexPath.row])!])
            movieDetail.append(posterPath[moviesTitles.firstIndex(of: searchingMovies[indexPath.row])!])
        }
        else {
            movieDetail.append(moviesTitles[indexPath.row])
            movieDetail.append(String(voteAverage[indexPath.row]))
            movieDetail.append(overview[indexPath.row])
            movieDetail.append(posterPath[indexPath.row])
        }
        performSegue(withIdentifier: "SecondToThird", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ThirdViewController
        destinationVC.movieDetail = movieDetail
        destinationVC.savedArrayTitle = savedArrayTitle
        destinationVC.savedArrayPoster = savedArrayPoster
        destinationVC.savedArrayOverview = savedArrayOverview
        destinationVC.savedArrayRating = savedArrayRating
        destinationVC.savedArrayCategory = savedArrayCategory
        destinationVC.category = category

    }
}

