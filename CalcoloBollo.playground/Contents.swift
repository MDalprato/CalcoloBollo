import UIKit

var euroStandardPrice = [3.00,2.90,2.80,2.70,2.58,2.58,2.58]
var euroElevatedPrice = [4.50,4.35,4.20,4.05,3.87,3.87,3.87]
var overPrice185kw = [12.0,6.0,3.0,0.0]

func priceUnder100kw(kw: Double, euro: Int, productionYear: Int) -> Double{
    
    var tempUnder100kw = 0.0
    var tempOver100kw = 0.0
    
    var priceUnder100kw = 0.0
    var priceOver100kw = 0.0
    var superPriceOver185kw = 0.0
    
    if(kw - 100 <= 0.0){
        
        // under 100 kw of power
        tempUnder100kw = kw
        
        priceUnder100kw = tempUnder100kw * euroStandardPrice[euro]
        
                   print("You've got a standard car !!! ")
        
    }else{
        
        // over 100 kw of power
        tempUnder100kw = 100
        tempOver100kw = kw - 100
        
        priceUnder100kw = tempUnder100kw * euroStandardPrice[euro]
        priceOver100kw = tempOver100kw * euroElevatedPrice[euro]
        
               print("You've got a fast car !!! ")
    }
    
    if(kw >= 185){
        
        let date = Date()
        let calendar = Calendar.current
        let over185kw = kw - 185
        let year = calendar.component(.year, from: date)
        
    
        let yearPassed  = year - productionYear
        
        switch yearPassed {
        case 0 ... 5:
            superPriceOver185kw = overPrice185kw[0] * over185kw
        case 5 ... 10:
            superPriceOver185kw = overPrice185kw[0] * over185kw
        case 10 ... 15:
            superPriceOver185kw = overPrice185kw[0] * over185kw
       
        default:
            superPriceOver185kw = 0.0
        }
        
        print("You've got a super fast car !!! ")
    }
    
   
    let totalPrice = priceOver100kw + priceUnder100kw + superPriceOver185kw
    
    
    return totalPrice
    
    
}


let price = priceUnder100kw(kw: 303.0, euro: 6, productionYear: 2011)

print ("Il tuo bollo è di \(price) €")
