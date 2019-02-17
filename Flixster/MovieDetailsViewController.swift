//
//  MovieDetailsViewController.swift
//  Flixster
//
//  Created by Akarsh Kumar on 2/16/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var dateReleasedLabel: UILabel!
    
    @IBOutlet weak var ratingProgressView: UIProgressView!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        dateReleasedLabel.text = movie["release_date"] as? String
        
        titleLabel.sizeToFit()
        synopsisLabel.sizeToFit()
        
        let rating = (movie["vote_average"] as! Double) / 10
        ratingProgressView.progress = Float(rating)
        
        ratingProgressView.tintColor = UIColor(red: CGFloat(1-rating), green: CGFloat(rating), blue: CGFloat(0), alpha: CGFloat(1));
        
        
        let baseUrl = "https://image.tmdb.org/t/p/"
        let backdropPath = movie["backdrop_path"] as! String
        let posterPath = movie["poster_path"] as! String
        
        let posterUrl = (URL(string: baseUrl+"w780"+posterPath))
        let backdropUrl = (URL(string: baseUrl+"w780"+backdropPath))
        backdropImageView.af_setImage(withURL: posterUrl!)
        posterImageView.af_setImage(withURL: backdropUrl!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
