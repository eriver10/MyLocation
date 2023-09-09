//
//  LocationDetailsViewController.swift
//  MyLocations
//
//  Created by Grey on 9/8/23.
//

//Reminder: Structs cannot inherit from one another.


import Foundation
import UIKit
//errors after adding variable properties, fix it suggested adding this framework extension.
import CoreLocation


//This constant is set to private and outside the bounds of the following class. Global and private??

//Book says, "(global) but it is only visible inside the LocationDetailsViewController.swift file (private)."

//Interesting, why is it placed outside the class??

private let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .medium
  formatter.timeStyle = .short
  return formatter
}()


//      Here is the class!!!!      \\


class LocationDetailsViewController: UITableViewController {
    
    var coordinate = CLLocationCoordinate2D(
      latitude: 0,
      longitude: 0)
    var placemark: CLPlacemark?
    var categoryName = "No Category"
    
    
    
    
  @IBOutlet var descriptionTextView: UITextView!
  @IBOutlet var categoryLabel: UILabel!
  @IBOutlet var latitudeLabel: UILabel!
  @IBOutlet var longitudeLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  @IBOutlet var dateLabel: UILabel!
    
    
  // MARK: - Actions
  @IBAction func done() {
    navigationController?.popViewController(animated: true)
  }
    
    
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }
    //Workin on the unwind segue lesson on exit button
    @IBAction func categoryPickerDidPickCategory(
      _ segue: UIStoryboardSegue
    ){
        
    let controller = segue.source as!        CategoryPickerViewController
        
        categoryName = controller.selectedCategoryName
        
        categoryLabel.text = categoryName
    }
    
    
    
    
    
    
    
    
    
    
    //VIEWDIDLOAD\\
    override func viewDidLoad() {
      super.viewDidLoad()
      descriptionTextView.text = ""
      
        
        //categoryLabel.text = ""
        categoryLabel.text = categoryName
        
        
      latitudeLabel.text = String(
        format: "%.8f",
        coordinate.latitude)
      longitudeLabel.text = String(
        format: "%.8f",
        coordinate.longitude)
      if let placemark = placemark {
        addressLabel.text = string(from: placemark)
    } else {
        addressLabel.text = "No Address Found"
      }
      dateLabel.text = format(date: Date())
    }
    
    // MARK: - Navigation (segue handling code)
    override func prepare(for segue: UIStoryboardSegue, sender:
    Any?) {
        
      if segue.identifier == "PickCategory" {
        let controller = segue.destination as!
    CategoryPickerViewController
        controller.selectedCategoryName = categoryName
      }
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Helper Methods
    func string(from placemark: CLPlacemark) -> String {
        
        
      var text = ""
        
        
      if let tmp = placemark.subThoroughfare {
        text += tmp + " "
      }
      if let tmp = placemark.thoroughfare {
        text += tmp + ", "
      }
      if let tmp = placemark.locality {
        text += tmp + ", "
      }
      if let tmp = placemark.administrativeArea {
        text += tmp + " "
      }
      if let tmp = placemark.postalCode {
        text += tmp + ", "
      }
      if let tmp = placemark.country {
      text += tmp }
      
        return text
        
    }
          
    func format(date: Date) -> String {
      return dateFormatter.string(from: date)
    }
}
