//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Grey on 9/12/23.
//
//

import CoreData
import Foundation
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    
    var hasPhoto: Bool {
      return photoID != nil
    }
    var photoURL: URL {
      assert(photoID != nil, "No photo ID set")
      let filename = "Photo-\(photoID!.intValue).jpg"
      return
    applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    var photoImage: UIImage? {
      return UIImage(contentsOfFile: photoURL.path)
    }
    
    class func nextPhotoID() -> Int {
        
      let userDefaults = UserDefaults.standard
      let currentID = userDefaults.integer(forKey: "PhotoID") + 1
      userDefaults.set(currentID, forKey: "PhotoID")
      return currentID
    }
    
    
    
    
    
    //NOTE: The following are read-only properties.
    //The book states this, "...means they don’t actually store a value in a memory location."
    
       
        
        public var coordinate: CLLocationCoordinate2D {
            
            return CLLocationCoordinate2DMake(latitude, longitude)
        }
        
        public var title: String? {
            if locationDescription.isEmpty {
                return "(No Description)"
            } else {
                return locationDescription
            }
        }
        
        public var subtitle: String? {
            return category
        }
        
      
    
    
    
    
    func removePhotoFile() {
        
        if hasPhoto {
            do {
            try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("Error removing file: \(error)")
            }
        }
        
    }
    
}
