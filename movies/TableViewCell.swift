//
//  TableViewCell.swift
//  movies
//
//  Created by Macos on 03/05/2025.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    var movie : MoviesApi? = nil
    var isFav : Bool = false
    @IBOutlet weak var favBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
       
    }
    
    @IBAction func addTofavs(_ sender: Any) {
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
