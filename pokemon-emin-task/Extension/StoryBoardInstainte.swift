//
//  UIViewController-Extension.swift
//  pokemon-emin-task
//
//  Created by Emin Hayal on 21.04.2022.
//
import UIKit

enum StoryboardType: String {
    case home = "HomeFlow"
    case detail = "DetailFlow"
}

protocol StoryboardInstantiate {
    static var storyboardType: StoryboardType { get }
    static var storyboardIdentifier: String? { get }
    static var bundle: Bundle? { get }
}

extension StoryboardInstantiate {
    static var storyboardIdentifier: String? { return String(describing: self) }
    static var bundle: Bundle? { return nil }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardType.rawValue, bundle: bundle)
        if let strongIdentifier = storyboardIdentifier {
            return (storyboard.instantiateViewController(withIdentifier: strongIdentifier) as? Self)!
        }
        return (storyboard.instantiateInitialViewController() as? Self)!
    }
}
