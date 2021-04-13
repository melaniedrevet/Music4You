//
//  CollectionReusableView.swift
//  Music4You
//
//  Created by Mélanie Drevet on 03/03/2021.
//  Copyright © 2021 Mélanie Drevet. All rights reserved.
//

import UIKit

protocol FilterDelegate: class {
    func filter(text:String)
    func clear()
}



class CollectionReusableView: UICollectionReusableView, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    weak var delegate : FilterDelegate?
    
    override func awakeFromNib() {
        searchBar.delegate = self
        // searchBar.showsCancelButton = true
    }
    
    
 
    func searchBar(_ searchBar : UISearchBar, textDidChange searchText : String) {
        
            if searchText.isEmpty == false {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.delegate?.filter(text:searchText)
                }
            }
            else {
                searchBar.showsCancelButton = false
                searchBar.text = ""
                searchBar.resignFirstResponder()
                self.delegate?.clear()
            }
        
    
    }
    
}


