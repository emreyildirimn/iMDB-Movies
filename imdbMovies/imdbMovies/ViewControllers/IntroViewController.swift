//
//  IntroViewController.swift
//  imdbMovies
//
//  Created by mac on 9.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet var bgImage: UIImageView!
    var movies : [Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.loadGif(name: "intro")
        DispatchQueue.global(qos: .background).async {
            self.movies = jsonStart()
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "introToFirst", sender: nil)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.movies = movies
    }

}
