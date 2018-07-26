//
//  ViewController.swift
//  RandomNumberApp
//
//  Created by Kevin Calderón on 25/07/18.
//  Copyright © 2018 Kevin Calderón. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var intentosLbl: UILabel!
    @IBOutlet weak var mensajeLbl: UILabel!
    var random = ""
    var intentos = 0
    
    @IBAction func validarBtn(_ sender: Any) {
        if (numberTxt.text?.isEmpty)!{
            self.alertWarningEmpty()
        }else {
            if (Int(numberTxt.text!)! > 9 ){
                self.alertWarningNumber()
            } else if numberTxt.text == random{
                mensajeLbl.text = "Ganaste! :D"
                self.showAlert()
                self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                mensajeLbl.text = "Fallaste, intenta de nuevo :("
                if intentos == 1{
                    self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    self.showAlert()
                } else {
                    intentos = intentos - 1
                    intentosLbl.text = String(intentos)
                    mensajeLbl.text = "Intenta de nuevo"
                    numberTxt.text = ""
                }
            }
        }
      
    }
    
    func showAlert(){
        let alert = UIAlertController(title: nil, message: "Intenta de nuevo :D", preferredStyle: .alert)
        
        let again = UIAlertAction.init(title: "Juega de nuevo", style: .default){(UIAlertAction) in self.setValues()
            
        }
        alert.addAction(again)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWarningNumber(){
        let alert = UIAlertController(title: nil, message: "No ingresar numeros mayor que 9. Reiniciando intentos.", preferredStyle: .alert)
        
        let again = UIAlertAction.init(title: "Juega de nuevo", style: .default){(UIAlertAction) in self.setValues()
            
        }
        alert.addAction(again)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWarningEmpty(){
        let alert = UIAlertController(title: nil, message: "El campo esta vacio, ingresa un digito. Reiniciando intentos.", preferredStyle: .alert)
        
        let again = UIAlertAction.init(title: "Juega de nuevo", style: .default){(UIAlertAction) in self.setValues()
            
        }
        alert.addAction(again)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setValues() {
        random = String(arc4random_uniform(10))
        print(random)
        intentos = 5
        intentosLbl.text = String(intentos)
        numberTxt.text = ""
        mensajeLbl.text = "Ingrese un numero del 0 - 9"
        self.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

