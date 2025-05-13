//
//  CustomViewController.swift
//  movies
//
//  Created by Macos on 30/04/2025.
//

import UIKit
import SDWebImage
import CoreData
import Reachability

class CustomViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , ReloadData  ,URLSessionDelegate, URLSessionDataDelegate {
    
    
    @IBOutlet weak var moviesTable: UITableView!
    var moviesList = [MoviesApi]()
    var favList = FavsDB.instance.getFavsMovies()
    var favs = [String]()
    var savedMovies = [MoviesEntity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "moviesTableViewCell", bundle: nil)
        moviesTable.register(cellNib, forCellReuseIdentifier: "customcell")
        
        
        
        if self.checkNetwork(){
            self.fetchDataURL()
        }
        else {
            self.fetchDataFromCoreData()
        }

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
            as! moviesTableViewCell
        
        cell.movieLabel.text = moviesList[indexPath.row].Title
        
      
        
        cell.movieImage.contentMode = .scaleAspectFill
        cell.movieImage.layer.cornerRadius = cell.movieImage.frame.size.width / 2
       
        cell.movieImage.sd_setImage(
            with: URL(string: moviesList[indexPath.row].Poster ?? "placeholder 2"),
            placeholderImage: UIImage(named: "placeholder 2")
        
        )
        cell.movie = moviesList[indexPath.row]
        if favs.contains(cell.movie?.Title ?? ""){
            cell.favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            cell.isFav = true
        }else{
            cell.favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            cell.isFav = false

        }
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
  
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // let details : ViewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        let details : DetatilsStaticTableViewController = self.storyboard?.instantiateViewController(identifier: "DetatilsStaticTableViewController") as! DetatilsStaticTableViewController
        details.movie = moviesList[indexPath.row]
    
        self.navigationController?.pushViewController(details, animated: true)
        
    }
  
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if !checkNetwork(){
                self.deleteMovie(movie: moviesList[indexPath.row])
            }
            moviesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addMovie = segue.destination as! AddMovieViewController
        addMovie.reloadDataProtocol = self as ReloadData
       /* if let lastId = moviesList.last?.id{
            addMovie.id = lastId + 1
        }*/
    }
    
    

    @IBAction func FavMovies(_ sender: UIButton) {
        let favs : FavsTableViewController = self.storyboard?.instantiateViewController(identifier: "FavsTableViewController") as! FavsTableViewController
        self.navigationController?.pushViewController(favs, animated: true)
    }
    func reloadData(movie:MoviesApi) {
        moviesList.append(movie)
        moviesTable.reloadData()
    }
    
    func fetchDataURL(){
        let url = URL(string: "https://dummyjson.com/c/8b9b-3f93-4c8d-a8b9")
        let req = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: req){
            data,response,error in
            do{
                let json = try JSONDecoder().decode([MoviesApi].self, from: data!)
                let movie = json[0].Title ?? ""
                self.moviesList = json
                
                
                DispatchQueue.main.async {
                    self.moviesTable.reloadData()
                }
                print(movie)
                for i in 0..<json.count{
                    for j in 0..<self.favList.count{
                        if json[i].Title == self.favList[j].Title{
                           // print("\(json[i].Title) is Fav")
                            self.favs.append(json[i].Title ?? "")
                            break
                        }
                    }
                }
            }catch{
                print("error")
            }
        }
        task.resume()
    }
    
    
    func fetchDataFromCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manager = appDelegate.persistentContainer.viewContext
        let fetchedData:NSFetchRequest<MoviesEntity> = MoviesEntity.fetchRequest()
        
        do{
            savedMovies = try manager.fetch(fetchedData)
            for i in savedMovies{
                moviesList.append(
                    MoviesApi(
                        Title: i.value(forKey: "title") as? String,
                              Year: i.value(forKey: "year") as? String,
                              Rated: i.value(forKey: "rating") as? String,
                            Genre: i.value(forKey: "genere") as? String,
                            Poster: i.value(forKey: "image") as? String)
                )
                
            }
        }catch{
            print("Can not Fetch....")
        }
    }
    
    func checkNetwork() ->Bool{
        var isConnect :Bool?
        let reachability = try! Reachability()

        
            if reachability.connection == .unavailable {
                isConnect = false
            }
        else {
            isConnect = true
        }
       
        return isConnect ?? false
    }
    
 
    
    
    func deleteMovie(movie:MoviesApi){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manager = appDelegate.persistentContainer.viewContext
        let fetchedData:NSFetchRequest<MoviesEntity> = MoviesEntity.fetchRequest()
        let predicate = NSPredicate(format: "title  == %@" ,  movie.Title ?? "" )
        fetchedData.predicate = predicate
        
        do{
            
            let resMovie = try manager.fetch(fetchedData)
            for i in resMovie{
                manager.delete(i)
                
            }
            try manager.save()

            
        }catch{
            print("error")
        }
        
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
