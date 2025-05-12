//
//  MoviesList.swift
//  movies
//
//  Created by Macos on 04/05/2025.
//

import UIKit

class MoviesList {
    
    static let instance = MoviesList()
    
    var moviesList : [Movie] = [
        Movie(id:1,
            title:"Home Alone" ,
              image: "https://filmartgallery.com/cdn/shop/products/Home-Alone-Vintage-Movie-Poster-Original_866d9d28.jpg?v=1741732804" ,
              rating:  4.5 ,releaseYear:1990 , genre: "Comedy"),
        
        Movie(id:2,
            title: "Harry Potter",
              image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTK38tEeJiYTWzabBXNBoRta9hhg6G8eZvEA&s",
              rating: 5.0, releaseYear: 2000, genre: "Fantasy"),
        
        Movie(id:3,
            title: "Inside Out2",
              image: "https://resizing.flixster.com/8yCWg9MRcT7LnnuHtqe1ACAyDHQ=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzZmZDY4MmFmLTE2ZGYtNDY1NS1iZmY5LWZmYjVjZjBkNTk3OC5qcGc=", rating: 4.9, releaseYear: 2024, genre: "Animation"),
        
        Movie(id:4,
            title: "Night at Museum",
              image: "https://m.media-amazon.com/images/M/MV5BNGMyYjYyZDAtNzRiZC00ZjRkLTkwYjktODkxODQzNTFiMTVmXkEyXkFqcGc@._V1_.jpg",
              rating: 4.5, releaseYear: 2006, genre: "Adventure"),
        
        Movie(id:5,
              title: "Zootopia",
              image: "https://wallpapers.com/images/featured/zootopia-pictures-e8u4m9lttr2wlg4q.jpg", rating: 5.0, releaseYear: 2016, genre: "Animation")
    ]
    private  init() {
        print("privat init")
    }

}
