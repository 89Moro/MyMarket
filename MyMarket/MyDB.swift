//
//  MyDB.swift
//  MyMarket
//
//  Created by Ospite on 30/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import Foundation
import SQLite

class MyDB
{
    static let instance = MyDB()
    
    private let db: Connection?
    
    private let movimenti     = Table("movimenti")
    private let id            = Expression<Int64>("id")
    private let data          = Expression<Date?>("data")
    private let descrizione   = Expression<String>("descrizione")
    private let importo       = Expression<String>("importo")
    private let cat_movimento = Expression<Int64>("cat_movimento")
    
    private let categorie       = Table("categorie")
    private let id_categorie    = Expression<Int64>("id")
    private let cat_descrizione = Expression<String>("descrizione")
    private let tipo            = Expression<String>("tipo")
    
    private init()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do
        {
            db = try Connection("\(path)/MyDB.sqlite3")
        }
        catch
        {
            db = nil
            print ("Impossibile aprire database")
        }
        
    }

}
