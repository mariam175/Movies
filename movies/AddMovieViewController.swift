//
//  AddMovieViewController.swift
//  movies
//
//  Created by Macos on 30/04/2025.
//

import UIKit
import CoreData

class AddMovieViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var ratingTF: UITextField!
    
    @IBOutlet weak var imageTF: UITextField!
    
    @IBOutlet weak var genreTF: UITextField!
    
    @IBOutlet weak var yearTF: UITextField!
    var id : Int = 0
    var reloadDataProtocol : ReloadData?
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMovie(_ sender: Any) {
        let movie = MoviesApi(Title: titleTF.text, Year: yearTF.text, Rated: ratingTF.text, Genre: genreTF.text, Poster: imageTF.text)
        reloadDataProtocol?.reloadData(movie: movie)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manager = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MoviesEntity", in: manager)
        let movieEntity = NSManagedObject(entity: entity!, insertInto: manager)
        movieEntity.setValue(movie.Title, forKey: "title")
        movieEntity.setValue(movie.Poster, forKey: "image")
        movieEntity.setValue(movie.Rated, forKey: "rating")
        movieEntity.setValue(movie.Year, forKey: "year")
        movieEntity.setValue(movie.Genre, forKey: "genere")
        
        
        do{
            try manager.save()
            print("Saved")
            
        }catch{
            print("Can not save")
        }
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.sourceType = .photoLibrary
            isEditing = true
            self.present(imagePicker, animated: true , completion: nil)
        }else{
            print("Can not pick image")
        }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePath = info[.imageURL]{
            imageTF.text = "\(imagePath)"
        }
        
        dismiss(animated: true)
    }
    

}
