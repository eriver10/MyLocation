//
//  LocationCell.swift
//  MyLocations
//
//  Created by Grey on 9/15/23.
//

import UIKit

class LocationCell: UITableViewCell {
    
    //Do these lose storyboard connection when debugging???
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Rounded corners for images
        photoImageView.layer.cornerRadius =
        photoImageView.bounds.size.width / 2
        photoImageView.clipsToBounds = true
        separatorInset = UIEdgeInsets(top: 0, left: 82, bottom: 0,
        right: 0)
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Helper Method
    func configure(for location: Location) {
        
        if location.locationDescription.isEmpty {
            descriptionLabel.text = "(No Description)"
        } else {
            descriptionLabel.text = location.locationDescription
        }
        
        if let placemark = location.placemark {
          var text = ""
          text.add(text: placemark.subThoroughfare)
          text.add(text: placemark.thoroughfare, separatedBy: " ")
          text.add(text: placemark.locality, separatedBy: ", ")
          addressLabel.text = text
            
        /*
        if let placemark = location.placemark {
            var text = ""
            if let tmp = placemark.subThoroughfare {
                text += tmp + " "
            }
            if let tmp = placemark.thoroughfare {
                text += tmp + ", "
            }
            if let tmp = placemark.locality {
                text += tmp
            }
            addressLabel.text = text
            
            */
        } else {
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
        }
        
        photoImageView.image = thumbnail(for: location)
        
    }
    
    func thumbnail(for location: Location) -> UIImage {
        
      if location.hasPhoto, let image = location.photoImage {
          
          return image.resized(
          withBounds: CGSize(width: 52, height: 52))
      }
            return UIImage(named: "No Photo")!
    }
    
    
    
    
}

