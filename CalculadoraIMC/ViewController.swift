//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Tardes on 10/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var IMCrESULT: UILabel!
    @IBOutlet weak var categoriaPesoLabel: UILabel!
    @IBOutlet weak var imgImc: UIImageView!
    var height:Int=140
    var weight:Int=40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SetHeight(_ sender: UISlider) {
        
        
        let newInt = Int(sender.value)
        height=newInt
        heightLabel.text="\(newInt) cm"
        
    }
    
    @IBAction func SetWeight(_ sender: UIStepper) {
        let newInt = Int(sender.value)
        weight=newInt
        weightLabel.text="\(newInt) Kg"
    }
    
    @IBAction func Calculate(_ sender: Any) {
        
        let heightFloat=Float(height)
        
        let heightinMeters = heightFloat/100.0
        
        let weightFloat=Float(weight)
        
        let result=(weightFloat/pow(heightinMeters,2))
        
        
        //Seteando el valor del texto e Imagen
        IMCrESULT.text="\(result) IMC"
        
        print(getWeightImg(result))
        categoriaPesoLabel.text=getWeightImg(result)
        imgImc.image = UIImage(named: getWeightImg(result))
        
    }
    
    func getWeightImg(_ weightPass:Float)->String{
        
        
        switch weightPass{
            
            case ..<16.0:
            return "Bajo Peso Severo"
            case ..<17.0:
            return "Bajo Peso Intermedio"
            case ..<18.5:
            return "Bajo Peso"
            case ..<25:
            return "Normal"
            case ..<30:
            return "SobrePeso"
            case ..<35:
            return "Obesidad"
            case ..<40:
            return "Obesidad Severa"
            case 40...:
            return "Obesidad Morbida"
            default:
            return "Error"
        }

    }
}

