//
//  FavsTableViewController.swift
//  movies
//
//  Created by Macos on 04/05/2025.
//

import UIKit
import SDWebImage
class FavsTableViewController: UITableViewController {

    var moviesList :[MoviesApi] = FavsDB.instance.getFavsMovies()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavsTableViewCell

        cell.favLabel.text = moviesList[indexPath.row].Title
        cell.favImage.contentMode = .scaleAspectFill
        cell.favImage.layer.cornerRadius = cell.favImage.frame.size.width / 2
       
        cell.favImage.sd_setImage(
            with: URL(string: moviesList[indexPath.row].Poster ?? "placeholder 2"),
            placeholderImage: UIImage(named: "placeholder 2")
        
        )
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            FavsDB.instance.deleteMovie(title: moviesList[indexPath.row].Title ?? "No Data")
            moviesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    

}
