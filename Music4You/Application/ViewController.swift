//
//  ViewController.swift
//  Application
//
//  Created by Mélanie Drevet on 11/02/2021.
//  Copyright © 2021 Mélanie Drevet. All rights reserved.
//

import UIKit

class Musique {
    var image : String
    var name : String
    var son : String
    init(name:String, image:String, son: String) {
        self.name = name
        self.image = image
        self.son = son
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FilterDelegate {
    func filter(text: String) {
        filterData = datas

        
        filterData = datas.filter({ $0.name.contains(text) })
        
        collectionView.reloadData()
    }
    
    func clear() {
        filterData = datas
        collectionView.reloadData()
    }
    
    
    
    
    var datas: [Musique] = [Musique(name:"Beethoven - Sonate n°8", image:"beethoven", son:"beethoven"),
                            Musique(name:"Mozart - Symphonie n°40", image:"mozart", son:"mozart"),
                            Musique(name:"Bach - Un Poco Allegro", image:"bach", son:"bach"),
                            Musique(name:"Vivaldi - Les 4 saisons, Été", image:"vivaldi", son:"vivaldi")]
    
    @IBOutlet weak var logoApplication : UIImageView!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var filterData : [Musique]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        logoApplication.image = UIImage(named:"music.png")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        filterData = datas
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .vertical
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        let ligneActuelle = indexPath.row
        let imageName = filterData[ligneActuelle].image
        let musiqueName = filterData[ligneActuelle].name
        
        
    
        cell.configure(imageName: imageName, musiqueName: musiqueName)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: (width - 40) / 2, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 350, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ligneActuelle = indexPath.row

        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController

        detailsViewController.configure(datas[ligneActuelle].name, datas[ligneActuelle].image, datas[ligneActuelle].son)

        self.navigationController?.pushViewController(detailsViewController, animated:true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let searchView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath) as! CollectionReusableView
        
        searchView.delegate = self
        
        return searchView
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
    }
    
    
    
    
}

