//
//  ViewController.swift
//  movies
//
//  Created by Macos on 30/04/2025.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var fimRating: UILabel!
    
    @IBOutlet weak var filmYear: UILabel!
    @IBOutlet weak var filmGenre: UILabel!
    
    var movie:MoviesApi?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filmTitle.text = movie?.Title
       // filmImage.image = UIImage(named: movie?.image ?? "placeholder 2")
        
        filmImage.sd_setImage(with: URL(string: movie?.Poster ?? "placeholder 2"), placeholderImage: UIImage(named: "placeholder 2"))
        
        fimRating.text = movie?.Rated
        filmYear.text = movie?.Year
        filmGenre.text = movie?.Genre
        
    }


}

