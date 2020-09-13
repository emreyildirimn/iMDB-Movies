//
//  ViewController.swift
//  imdbMovies
//
//  Created by mac on 12.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var category = 0
    var movies : [Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func aileBtn(_ sender: Any) {
        category = 10751
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func aksiyonBtn(_ sender: Any) {
        category = 28
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func animasyonBtn(_ sender: Any) {
        category = 16
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func belgeselBtn(_ sender: Any) {
        category = 99
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func bilimkurguBtn(_ sender: Any) {
        category = 878
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func dramBtn(_ sender: Any) {
        category = 18
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func fantastikBtn(_ sender: Any) {
        category = 14
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func gerilimBtn(_ sender: Any) {
        category = 53
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func gizemBtn(_ sender: Any) {
        category = 9648
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func komediBtn(_ sender: Any) {
        category = 35
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func korkuBtn(_ sender: Any) {
        category = 27
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func maceraBtn(_ sender: Any) {
        category = 12
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func muzikalBtn(_ sender: Any) {
        category = 10402
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func romantikBtn(_ sender: Any) {
        category = 10749
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func savasBtn(_ sender: Any) {
        category = 10752
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func sucBtn(_ sender: Any) {
        category = 80
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func tarihBtn(_ sender: Any) {
        category = 36
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    @IBAction func vashibatiBtn(_ sender: Any) {
        category = 37
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.movies = movies
        destinationVC.category = category
       }
}
