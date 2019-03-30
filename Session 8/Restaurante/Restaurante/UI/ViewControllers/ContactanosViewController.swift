//
//  ContactanosViewController.swift
//  Restaurante
//
//  Created by Arturo Gamarra on 3/2/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ContactanosViewController: UIViewController {

    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet var telefonoTapGestureRecognizer: UITapGestureRecognizer!
    var mapView:GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        
        let coordenada = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let pin = GMSMarker(position: coordenada)
        pin.map = mapView
    }
    
    private func setupMap() {
        mapView = GMSMapView()
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapContainerView.addSubview(mapView)
        
        mapView.settings.myLocationButton = true
        
        // ANCHORS
        mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor, constant: 0).isActive = true
        
        mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor, constant: 0).isActive = true
        
        mapView.leadingAnchor.constraint(equalTo: mapContainerView.leadingAnchor, constant: 0).isActive = true
        
        mapView.trailingAnchor.constraint(equalTo: mapContainerView.trailingAnchor, constant: 0).isActive = true
        
        // Constraint Visual Human Format
        /*
        let dictViews:[String:Any] = ["map":mapView]
        let vContraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[map]-0-|",
            options: .directionLeadingToTrailing,
            metrics: nil,
            views: dictViews)
        let hContraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[map]-0-|",
            options: .directionLeadingToTrailing,
            metrics: nil,
            views: dictViews)
        mapContainerView.addConstraints(vContraints)
        mapContainerView.addConstraints(hContraints)
         */
        
        // Constraint Manual
        /*
        let containt = NSLayoutConstraint(item: mapView
            , attribute: NSLayoutConstraint.Attribute.leading
            , relatedBy: NSLayoutConstraint.Relation.equal
            , toItem: mapContainerView
            , attribute: NSLayoutConstraint.Attribute.leading
            , multiplier: 1
            , constant: 0)
        mapContainerView.addConstraint(containt)
        */
    }
    
    @IBAction func telefonoLabelTapped(_ sender: UITapGestureRecognizer) {
        //let label = sender.view as! UILabel
        let urlString = "tel://17173350"
        let url = URL(string: urlString)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }
        
    }
    
    @IBAction func emailLabelTapped(_ sender: UITapGestureRecognizer) {
        print("Enviar email")
    }
}

extension ContactanosViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("Mostrar opciones de navegacion")
        return true
    }
    
}
