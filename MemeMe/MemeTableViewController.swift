//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Apple on 30/11/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    let memeLabelTextAttributes: [String: AnyObject] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: CGFloat(-3.0) as AnyObject
        
    ]
    
    let reuseIdentiferCell = "MemeTableViewCell"
    
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentiferCell, for: indexPath) as! MemeTableViewCell
        
        // Configure the cell...
        let meme = memes[indexPath.row]
        
        cell.memeImageView.image = meme.originalImage
        cell.memeTopLabel.text = meme.topText
        cell.memeBottonLabel.text = meme.bottomText
        cell.messageLabel.text = "\(meme.topText) \(meme.bottomText)"
        
        self.configureCellLabel(cell.memeTopLabel)
        self.configureCellLabel(cell.memeBottonLabel)
        
        
        return cell

    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            print(indexPath.row)
            removeMemeAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func removeMemeAtIndex(_ index: Int) {
        let object = UIApplication.shared.delegate as! AppDelegate
        object.memes.remove(at: index)
        //memes.removeAtIndex(index)
    }
    
    func configureCellLabel(_ label: UILabel) {
        let attributeString = NSMutableAttributedString(string: label.text!, attributes: memeLabelTextAttributes)
        label.attributedText = attributeString
    }

}
