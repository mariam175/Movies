////
////  TableViewController.swift
////  movies
////
////  Created by Macos on 30/04/2025.
////
//
//import UIKit
//
//
//class TableViewController: UITableViewController {
//    var moviesList : [Movie] = [
//        Movie(id:1,
//            title:"Home Alone" ,
//              image: "https://filmartgallery.com/cdn/shop/products/Home-Alone-Vintage-Movie-Poster-Original_866d9d28.jpg?v=1741732804" ,
//              rating:  4.5 ,releaseYear:1990 , genre: "Comedy"),
//        
//        Movie(id:2,
//            title: "Harry Potter",
//              image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTK38tEeJiYTWzabBXNBoRta9hhg6G8eZvEA&s",
//              rating: 5.0, releaseYear: 2000, genre: "Fantasy"),
//        
//        Movie(id:3,
//            title: "Inside Out2",
//              image: "https://resizing.flixster.com/8yCWg9MRcT7LnnuHtqe1ACAyDHQ=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzZmZDY4MmFmLTE2ZGYtNDY1NS1iZmY5LWZmYjVjZjBkNTk3OC5qcGc=", rating: 4.9, releaseYear: 2024, genre: "Animation"),
//        
//        Movie(id:4,
//            title: "Night at Museum",
//              image: "https://m.media-amazon.com/images/M/MV5BNGMyYjYyZDAtNzRiZC00ZjRkLTkwYjktODkxODQzNTFiMTVmXkEyXkFqcGc@._V1_.jpg",
//              rating: 4.5, releaseYear: 2006, genre: "Adventure"),
//        
//        Movie(id:5,
//              title: "Zootopia",
//              image: "https://wallpapers.com/images/featured/zootopia-pictures-e8u4m9lttr2wlg4q.jpg", rating: 5.0, releaseYear: 2016, genre: "Animation")
//    ]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return moviesList.count
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = moviesList[indexPath.row].title
//
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let details : ViewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
//        details.movie = moviesList[indexPath.row]
//        
//        self.navigationController?.pushViewController(details, animated: true)
//        
//    }
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
