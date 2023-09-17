//
//  Location+CoreDataProperties.swift
//  MyLocations
//
//  Created by Grey on 9/12/23.
//
//

import Foundation
import CoreData
import CoreLocation


/*
Not unlike, Struc and Overrides, extensions are additives. In the case of extensions they, "...add additional functionality to an existing object without having to change the original source code for that object." the book says.
*/



extension Location {
    
  @nonobjc
  public class func fetchRequest() -> NSFetchRequest<Location> {
      
      return NSFetchRequest<Location>(entityName: "Location")
  }

  @NSManaged public var latitude: Double
  @NSManaged public var longitude: Double
  @NSManaged public var date: Date
  @NSManaged public var locationDescription: String
  @NSManaged public var category: String
  @NSManaged public var placemark: CLPlacemark?
  @NSManaged public var photoID: NSNumber?
}

extension Location: Identifiable {
    
}



//NOTE: when adding the data store entities I suspected we using a database. The book just confirmed it is using SQLite in the background. 
