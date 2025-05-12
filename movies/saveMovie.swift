//
//  saveMovie.swift
//  movies
//
//  Created by Macos on 04/05/2025.
//

import Foundation
import SQLite3

class FavsDB{
    
    let saveMoveDB:String? = "movies.sqlite"
    var db:OpaquePointer?
    static let instance = FavsDB()
    
    private init(){
        db = openDatabase()
        createTable()
    }
    func openDatabase() -> OpaquePointer? {
       
        var db: OpaquePointer?
        guard let saveMoveDB = saveMoveDB else {
            print("DB is nil.")
            return nil
        }
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(saveMoveDB)
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(saveMoveDB)")
            return db
        } else {
            print("Unable to open database.")
            return nil
        }
    }
    
    func createTable(){
        let createFavsTable = """
        create table IF NOT EXISTS FavsMovies(
        title TEXT PRIMARY KEY,
            image TEXT,
            rating TEXT,
            releaseYear TEXT,
            genre TEXT)
        """
        var createTableStatment : OpaquePointer?
        if sqlite3_prepare(db, createFavsTable, -1, &createTableStatment, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatment) == SQLITE_DONE{
                print("Table Created")
            }
            else{
                print("Fail to create table")
            }
        }else{
            print("Table Not Prepared")
        }
        sqlite3_finalize(createTableStatment)
    }
    
    func insertIntoTable(movie : MoviesApi){
        let insertMovie = "INSERT INTO FavsMovies (title, image, rating, releaseYear, genre) VALUES (?, ?, ?, ?, ?);"
        var insertMovieStatment : OpaquePointer?
        
        if sqlite3_prepare(db, insertMovie, -1, &insertMovieStatment, nil) == SQLITE_OK{
            sqlite3_bind_text(insertMovieStatment, 1, (movie.Title! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertMovieStatment, 2, (movie.Poster! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertMovieStatment, 3, (movie.Rated! as NSString).utf8String , -1 , nil)
            sqlite3_bind_text(insertMovieStatment, 4, (movie.Year! as NSString).utf8String , -1 , nil)
            sqlite3_bind_text(insertMovieStatment, 5, (movie.Genre! as NSString).utf8String, -1, nil)
            if sqlite3_step(insertMovieStatment) == SQLITE_DONE{
                print("Successfully inserted row \(movie.Title)")
            }else{
                print("Can not insert row")
            }
            
        }else{
            print("Table Not Prepared")
        }
        sqlite3_finalize(insertMovieStatment)
    }
    
    func getFavsMovies()->[MoviesApi]{
        let quary = "SELECT * FROM FavsMovies;"
        var quaryStatment : OpaquePointer?
        var movieList : [MoviesApi] = []
        if sqlite3_prepare(db, quary, -1, &quaryStatment, nil) == SQLITE_OK{
            while sqlite3_step(quaryStatment) == SQLITE_ROW{
                guard let title = sqlite3_column_text(quaryStatment, 0) else{
                    return []
                }
                guard let image = sqlite3_column_text(quaryStatment, 1)else{
                    return []
                }
                guard let rating = sqlite3_column_text(quaryStatment, 2)else{
                    return []
                }
                    guard let year = sqlite3_column_text(quaryStatment, 3)else{
                        return []
                    }
                guard let genere = sqlite3_column_text(quaryStatment, 4)else{
                    return []
                }
                
                movieList.append(
                    MoviesApi(Title: String(cString: title),
                              Year: String(cString: year),
                              Rated: String(cString: rating),
                              Genre: String(cString: genere),
                              Poster: String(cString: image)))
                
                
               // print("Title\(title)")
            }
        }else{
            print("Can not prepare")
        }
        sqlite3_finalize(quaryStatment)
        return movieList
        
    }
    
    func deleteMovie(title : String){
        let deleteMovie = "DELETE FROM FavsMovies WHERE title = ?; "
        var deleteStatment : OpaquePointer?
        
        if sqlite3_prepare(db, deleteMovie, -1, &deleteStatment, nil) == SQLITE_OK{
            sqlite3_bind_text(deleteStatment, 1, (title as NSString).utf8String, -1, nil)
            if sqlite3_step(deleteStatment) == SQLITE_DONE{
                print("Deleted")
            }else{
                print("Can not delete")
            }
            
        }else{
            print("Can not prepare")
        }
        sqlite3_finalize(deleteStatment)

        
    }
    
}

                    
