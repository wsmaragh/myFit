//
//  MapAnnotation.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class MapAnnotationView: MKAnnotationView {
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
    }
}
