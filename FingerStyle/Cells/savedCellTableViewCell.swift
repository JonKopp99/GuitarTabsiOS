//
//  savedCellTableViewCell.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/8/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class savedCellTableViewCell: UITableViewCell{
    
    var nameOfSong = UILabel()
    var nameOfArtist = UILabel()
    var difficulty = UILabel()
    
    override func layoutSubviews() {
        
        
        nameOfSong.frame = CGRect(x: 15, y: 10, width: frame.width - 30, height: 50)
        nameOfArtist.frame = CGRect(x: 15, y: nameOfSong.frame.maxY, width: frame.width - 30, height: 50)
        difficulty.frame = CGRect(x: 15, y: nameOfArtist.frame.maxY, width: frame.width - 30, height: 50)
        
        nameOfSong.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameOfArtist.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        difficulty.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        var theColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        if(difficulty.text == "Intermediate")
        {
            theColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }else if(difficulty.text == "Expert")
        {
            theColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }else{
            theColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        difficulty.textColor = theColor
        
        nameOfSong.font = UIFont(name: "AvenirNext-BoldItalic", size: 25)
        nameOfArtist.font = UIFont(name: "Avenir-Book", size: 19)
        difficulty.font = UIFont(name: "Avenir-Book", size: 18)
        
        self.addSubview(nameOfSong)
        self.addSubview(nameOfArtist)
        self.addSubview(difficulty)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
