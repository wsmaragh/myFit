//
//  EventsVC.swift
//  Fit
//
//  Created by Winston Maragh on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class FindVC: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapOrListButton: UIBarButtonItem!
    
    deinit {
        
    }
    
    enum SearchCriteria: String {
        case Events = "Events"
        case Gym = "Gym"
        case Parks = "Parks"
    }
    
    private var selectedSearchCriteria: SearchCriteria = SearchCriteria.Events {
        didSet{
            fetchSearchResults(searchCriteria: selectedSearchCriteria)
        }
    }
    
    private var venues = [YelpBusiness](){
        didSet {
            addAnnotationsToMap()
            tableView.reloadData()
        }
    }
    
    private var events = [YelpEvent](){
        didSet {
            addAnnotationsToMap()
            tableView.reloadData()
        }
    }
    
    private var annotations = [MKAnnotation]()
    
    private var selectedVenue: YelpBusiness?
    private var selectedEvent: YelpEvent?

    private var panGesture: UIPanGestureRecognizer!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocation()
        setupTableView()
        selectedSearchCriteria = SearchCriteria.Gym
    }
    
    private func setupLocation(){
        LocationService.shared.determineMyLocation()
        let _ = LocationService.shared.checkForLocationServices()
        let defaultCoordinate = CLLocationCoordinate2DMake(UserPreferenceService.shared.getLatitude(),UserPreferenceService.shared.getLongitude())
        mapView.setCenter(defaultCoordinate, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let region = MKCoordinateRegion.init(center: defaultCoordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func setupMapView(){
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.isRotateEnabled = true
        mapView.isScrollEnabled = true
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 400, width: self.view.bounds.width, height: self.view.bounds.height)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panTableView))
        tableView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }
    
    private func fetchSearchResults(searchCriteria: SearchCriteria){
        switch searchCriteria {
        case .Gym:
            BusinessAPIService.shared.getBusiness(category: .gyms) { [unowned self] (businesses) in
                self.venues = businesses
            }
        case .Parks:
            BusinessAPIService.shared.getBusiness(category: .parks) { [unowned self]  (businesses) in
                self.venues = businesses
            }
        case .Events:
            YelpEventAPIService.shared.getActiveEvents { [unowned self]  (yelpEvents) in
                self.events = yelpEvents
            }
        }
    }
    
    private func addAnnotationsToMap(){
        mapView.removeAnnotations(self.annotations)
        annotations.removeAll()
        
        switch selectedSearchCriteria {
        case .Parks, .Gym:
            venues.forEach { (venue) in
                let newAnnotation = MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: venue.coordinates.latitude, longitude: venue.coordinates.longitude), title: venue.name, subtitle: venue.location.address1)
                annotations.append(newAnnotation)
            }
        case .Events:
            events.forEach { (event) in
                let newAnnotation = MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude), title: event.name, subtitle: event.id)
                annotations.append(newAnnotation)
            }
        }
        
        mapView.addAnnotations(self.annotations)
        mapView.showAnnotations(self.annotations, animated: true)
        
        tableView.reloadData()
    }
    
    
    @IBAction func mapListToggleButtonPressed(_ sender: UIBarButtonItem) {
        if mapOrListButton.image == #imageLiteral(resourceName: "navbar_list") {
            maximizeList()
        } else if mapOrListButton.image == #imageLiteral(resourceName: "navbar_map") {
            minimizeList()
        }

    }
    
    private func minimizeList(){
        mapOrListButton.image = #imageLiteral(resourceName: "navbar_list")
        UIView.animate(withDuration: 0.5) {
//            self.tableView.frame = CGRect(x: 0, y: self.view.bounds.height * 0.75, width: self.view.bounds.width, height: self.view.bounds.height)
            self.tableView.frame = CGRect(x: 0, y: self.mapView.layer.bounds.maxY - 50.0, width: self.view.bounds.width, height: self.view.bounds.height)
        }
    }
    
    private func maximizeList(){
        mapOrListButton.image = #imageLiteral(resourceName: "navbar_map")
        UIView.animate(withDuration: 0.5) {
            self.tableView.frame = CGRect(x: 0, y: self.view.bounds.height * 0.15, width: self.view.bounds.width, height: self.view.bounds.height)
        }
    }
    
    @objc private func panTableView(gesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)
        panGesture.view?.center = CGPoint(x: panGesture.view!.center.x, y: panGesture.view!.center.y + translation.y)
        panGesture.setTranslation(CGPoint.zero, in: view)
        if tableView.frame.origin.y <= self.view.bounds.height * 0.15 { maximizeList() }
        if tableView.frame.origin.y >= view.bounds.height * 0.8 { minimizeList() }
    }
    
    // MARK: Segment Control
    @IBAction func segmentedContolChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: selectedSearchCriteria = .Events
        case 1: selectedSearchCriteria = .Gym
        case 2: selectedSearchCriteria = .Parks
        default: break
        }
    }
    
}


// MARK: Tableview
extension FindVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results:"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        header.textLabel?.textColor = UIColor.orange
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedSearchCriteria {
        case .Events: return events.count
        case .Gym, .Parks: return venues.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedSearchCriteria {
        case .Gym:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymCell.id, for: indexPath) as! GymCell
            let venue = venues[indexPath.row]
            cell.configureCell(venue: venue)
            cell.layer.cornerRadius = 4
            return cell
        case .Parks:
            let cell = tableView.dequeueReusableCell(withIdentifier: ParkCell.id, for: indexPath) as! ParkCell
            let venue = venues[indexPath.row]
            cell.configureCell(venue: venue)
            cell.layer.cornerRadius = 4
            return cell
        case .Events:
            let cell = tableView.dequeueReusableCell(withIdentifier: ParkCell.id, for: indexPath) as! ParkCell
            let venue = venues[indexPath.row]
            cell.configureCell(venue: venue)
            cell.layer.cornerRadius = 4
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



// MARK: MapView
extension FindVC: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "PlaceAnnotationView") as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "PlaceAnnotationView")
            
            //left callout
            let imageView = UIImageView.init(frame: CGRect(origin: CGPoint(x:0,y:0),size:CGSize(width:30,height:30)))
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "calloutGym")
            annotationView!.leftCalloutAccessoryView = imageView
            
            //right callout
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            annotationView?.canShowCallout = true
            annotationView?.animatesWhenAdded = true
            annotationView?.markerTintColor = UIColor(red: 238/255, green: 83/255, blue: 80/255, alpha: 1)
            annotationView?.isHighlighted = true
            
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {        
        let index = annotations.index {$0 === view.annotation}
        guard let unwrappedIndex = index else {print("Index in nil"); return}
        print(unwrappedIndex)
        
        switch selectedSearchCriteria {
        case .Events:
            let event = events[unwrappedIndex]
            //go to detail
        case .Gym, .Parks:
            let venue = venues[unwrappedIndex]
            //go to detail
        }
        
    }
}


extension FindVC: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if tableView.frame.origin.y <= 0.1 {
            return false
        }
        return true
    }
}
