//
//  savedCellTableViewCell.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/8/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class createSongTableViewCell: UITableViewCell{
    var e = UILabel()
    var a = UILabel()
    var d = UILabel()
    var g = UILabel()
    var b = UILabel()
    var ee = UILabel()
    
    override func layoutSubviews() {
        let eLine = UIView()
        let aLine = UIView()
        let dLine = UIView()
        let gLine = UIView()
        let bLine = UIView()
        let eeLine = UIView()
        let eL = UILabel(); eL.text = "E"; eL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); eL.adjustsFontSizeToFitWidth = true
        let aL = UILabel(); aL.text = "A"; aL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); aL.adjustsFontSizeToFitWidth = true
        let dL = UILabel(); dL.text = "D"; dL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); dL.adjustsFontSizeToFitWidth = true
        let gL = UILabel(); gL.text = "G"; gL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); gL.adjustsFontSizeToFitWidth = true
        let bL = UILabel(); bL.text = "B"; bL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); bL.adjustsFontSizeToFitWidth = true
        let eeL = UILabel(); eeL.text = "e";eeL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);eeL.adjustsFontSizeToFitWidth = true
        
        //eadgbe ebgdae
        eeLine.frame = CGRect(x: 10, y: 45, width: frame.width-20, height: 2.5)
        eeL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        ee.frame = CGRect(x: 5, y: -10, width: eeLine.frame.width - 10, height: 20)
        // e.text = "1 2 3 4 5 6 7 8 9 10"
        ee.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ee.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        ee.textAlignment = .left
        ee.sizeToFit()
        ee.adjustsFontSizeToFitWidth = true
        eeLine.addSubview(ee)
        eeLine.addSubview(eeL)
        
        bLine.frame = CGRect(x: 10, y: eeLine.frame.maxY + 20, width: frame.width-20, height: 2.5)
        bL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        b.frame = CGRect(x: 5, y: -10, width: bLine.frame.width - 10, height: 20)
        //a.text = "12 2 3 4 5 6 7 8 9 10"
        b.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        b.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        b.textAlignment = .left
        b.sizeToFit()
        b.adjustsFontSizeToFitWidth = true
        bLine.addSubview(b)
        bLine.addSubview(bL)
        
        gLine.frame = CGRect(x: 10, y: bLine.frame.maxY + 20, width: frame.width-20, height: 2.5)
        gL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        g.frame = CGRect(x: 5, y: -10, width: gLine.frame.width - 10, height: 20)
        //d.text = "13 2 3 4 5 6 7 8 9 10"
        g.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        g.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        g.textAlignment = .left
        g.sizeToFit()
        g.adjustsFontSizeToFitWidth = true
        gLine.addSubview(g)
        gLine.addSubview(gL)
        
        dLine.frame = CGRect(x: 10, y: gLine.frame.maxY + 20, width: frame.width-20, height: 2.5)
        dL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        d.frame = CGRect(x: 5, y: -10, width: dLine.frame.width - 10, height: 20)
        //g.text = "14 2 3 4 5 6 7 8 9 10"
        d.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        d.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        d.textAlignment = .left
        d.sizeToFit()
        d.adjustsFontSizeToFitWidth = true
        dLine.addSubview(d)
        dLine.addSubview(dL)
        
        aLine.frame = CGRect(x: 10, y: dLine.frame.maxY + 20, width: frame.width-20, height: 2.5)
        aL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        a.frame = CGRect(x: 5, y: -10, width: aLine.frame.width - 10, height: 20)
        //b.text = "15 2 3 4 5 6 7 8 9 10"
        a.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        a.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        a.textAlignment = .left
        a.sizeToFit()
        //b.adjustsFontSizeToFitWidth = true
        aLine.addSubview(a)
        aLine.addSubview(aL)
        
        eLine.frame = CGRect(x: 10, y: aLine.frame.maxY + 20, width: frame.width-20, height: 2.5)
        eL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        e.frame = CGRect(x: 5, y: -10, width: eLine.frame.width - 10, height: 20)
        //ee.text = "16 2 3 4 5 6 7 8 9 10"
        e.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        e.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        e.textAlignment = .left
        e.adjustsFontSizeToFitWidth = true
        e.sizeToFit()
        eLine.addSubview(e)
        eLine.addSubview(eL)
        //160
        eLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        aLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        dLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        gLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        bLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        eeLine.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        addSubview(eLine)
        addSubview(aLine)
        addSubview(dLine)
        addSubview(gLine)
        addSubview(bLine)
        addSubview(eeLine)
        
        
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
