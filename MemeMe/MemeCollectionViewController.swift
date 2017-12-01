//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Apple on 30/11/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    let memeLabelTextAttributes: [String: AnyObject] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 18)!,
        NSStrokeWidthAttributeName: CGFloat(-4.0) as AnyObject
        
    ]
    
    let reuseIdentifier = "MemeCollectionViewCell"
    
    //TODO: adjust flowlayout
    @IBOutlet weak var collectiveflowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2*space)) / 3.0
        
        collectiveflowLayout.minimumLineSpacing = space
        collectiveflowLayout.minimumInteritemSpacing = space
        collectiveflowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }

    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
        
        collectionView?.backgroundColor = UIColor.white
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        
        
        // Configure the cell
        let meme = memes[indexPath.item]
        cell.imageView.image = meme.originalImage
        cell.top.text = meme.topText
        cell.bottom.text = meme.bottomText
        
        self.configureCellLabel(cell.top)
        self.configureCellLabel(cell.bottom)
        
        return cell
    }
    
    func configureCellLabel(_ label: UILabel) {
        let attributeString = NSMutableAttributedString(string: label.text!, attributes: memeLabelTextAttributes)
        label.attributedText = attributeString
    }

}
