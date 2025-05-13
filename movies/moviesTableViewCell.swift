//
//  moviesTableViewCell.swift
//  movies
//
//  Created by Macos on 13/05/2025.
//

import UIKit

class moviesTableViewCell: UITableViewCell {

    @IBOutlet weak var favBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    var movie : MoviesApi? = nil
    var isFav : Bool = false
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToFav(_ sender: Any) {
        if let storedMovie = movie{
            if isFav {
                FavsDB.instance.deleteMovie(title: storedMovie.Title ?? "")
                favBtn.setImage(UIImage(systemName: "heart"), for: .normal)

            }else{
                FavsDB.instance.insertIntoTable(movie: storedMovie)
                favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
    }
    
}
