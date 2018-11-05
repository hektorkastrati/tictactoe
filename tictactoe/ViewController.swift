//
//  ViewController.swift
//  tictactoe
//
//  Created by Hektor Kastrati on 9/23/18.
//  Copyright © 2018 Hektor Kastrati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isGameActive:Bool = true
    var gameState:[Int] = [0,0,0,0,0,0,0,0,0]
    var winningCombinations:[[Int]] = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var activePlayer = 1
    
    
    @IBOutlet weak var labelRezultati: UILabel!
    @IBOutlet weak var btnLuaj: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RifilloLojen()
        
    }

   
    @IBAction func btnLoja(_ sender: UIButton) {
        
        if (gameState[sender.tag - 1] == 0 && isGameActive == true){
        
            gameState[sender.tag - 1] = activePlayer
            if(activePlayer == 1){
            
            sender.setImage(UIImage(named: "cross"), for: .normal)
            activePlayer = 2
            
        }else{
            sender.setImage(UIImage(named: "circle"), for: .normal)
            activePlayer = 1
        }
      }
        for combination in winningCombinations{
            
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                
                 isGameActive = false
                if(gameState[combination[0]] == 1){
                    
                    labelRezultati.text = "Fitues eshte X"
                }else{
                    
                    labelRezultati.text = "Fitues eshte O"
                }
                
                labelRezultati.isHidden = false
                btnLuaj.isHidden = false
                
                UIView.animate(withDuration: 1){
                    
                    self.labelRezultati.center = CGPoint(x: self.labelRezultati.center.x + 15, y: self.labelRezultati.center.y)
                    self.btnLuaj.center = CGPoint(x: self.btnLuaj.center.x - 15, y: self.btnLuaj.center.y)
                }
            }
            
            isGameActive = false
            for i in gameState{
                
                if(i == 0){
                    
                    isGameActive = true
                    break
                }
            }
            
            if(isGameActive == false){
                
                labelRezultati.text = "Loja eshte baraz"
                labelRezultati.isHidden = false
                btnLuaj.isHidden = false
                
                UIView.animate(withDuration: 1){
                    
                    self.labelRezultati.center = CGPoint(x: self.labelRezultati.center.x, y: self.labelRezultati.center.y)
                    self.btnLuaj.center = CGPoint(x: self.btnLuaj.center.x, y: self.btnLuaj.center.y)
                }
            }
        }
  }
    
    @IBAction func btnPlay(_ sender: Any) {
        
        RifilloLojen()
        
        }
    
    func RifilloLojen(){
        
        isGameActive = true
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        
        labelRezultati.isHidden = true
        btnLuaj.isHidden = true
        
        UIView.animate(withDuration: 1){
            
            self.labelRezultati.center = CGPoint(x: self.labelRezultati.center.x - 15, y: self.labelRezultati.center.y)
            self.btnLuaj.center = CGPoint(x: self.btnLuaj.center.x + 15, y: self.btnLuaj.center.y)
        }
        
        for i in 1...9{
            
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
    
}

