//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Tardes on 10/12/24.
//

import UIKit
import SwiftUI
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var IMCrESULT: UILabel!
    @IBOutlet weak var CalcularButton: UIButton!
    @IBOutlet weak var categoriaPesoLabel: UILabel!
    @IBOutlet weak var imgImc: UIImageView!
    @IBOutlet weak var CategoriaDescription: UILabel!
    var height:Int=140
    var weight:Int=40
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //CalcularButton.setTitle("Calculate",for: .normal)
        CalcularButton.setTitle(String(localized: "Calculate"), for: .normal)
        
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
        let (resultMessageTxtChange,resultImgDirec, resultColor,resultText) = getWeightImgColorDescript(result)
        CategoriaDescription.text=resultText
        IMCrESULT.textColor=resultColor
        categoriaPesoLabel.text=resultMessageTxtChange
        imgImc.image = UIImage(named: resultImgDirec)
        
        
    }
    
    func getWeightImgColorDescript(_ weightPass:Float)->(String,String, UIColor,String){
        
        switch weightPass{
            
            case ..<16.0:
            return (String(localized: "Severe underweight"),"Severe underweight", UIColor.bajoPesoSevero,"Holaa")
            case ..<17.0:
            return (String(localized: "Low Intermediate Weight"),"Low Intermediate Weight",UIColor.bajoPesoIntermedio,"Holiwi")
            case ..<18.5:
            return (String(localized: "Underweight"),"Underweight",UIColor.bajoPeso,"Holiwiii")
            case ..<25:
            return (String(localized: "Regular"),"Regular",UIColor.normal,"hOLA pATOS")
            case ..<30:
            return (String(localized: "OverWeight"),"OverWeight",UIColor.sobrePeso,"hOLA Mandril")
            case ..<35:
            return (String(localized: "obesity"),"obesity",UIColor.obesidad,"mAMAPINGAS")
            case ..<40:
            return (String(localized: "Severe Obesity"),"Severe Obesity",UIColor.obesidadSevera,"mAMADOR")
            case 40...:
            return (String(localized: "Morbid Obesity"),"Morbid Obesity",UIColor.obesidadMorbida,"mIRA quE MINI")
            default:
            return ("Error","Error",UIColor.normal,"eRROR")
        }
    }
    
}

