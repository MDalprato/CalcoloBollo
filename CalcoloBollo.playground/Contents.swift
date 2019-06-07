import UIKit


// Declaring static variables
// price for the tax, based on this table https://www.theitaliantimes.it/economia/calcolo-bollo-auto-online-quando-pagamento_060619/

let euroStandardPrice = [3.00,2.90,2.80,2.70,2.58,2.58,2.58]
let euroElevatedPrice = [4.50,4.35,4.20,4.05,3.87,3.87,3.87]
let overPrice185kw = [12.0,6.0,3.0,0.0]

func calculatePrice(kw: Double, euro: Int, productionYear: Int) -> Double{
    
    // declaring dynamic variables
    
    var tempUnder100kw = 0.0
    var tempOver100kw = 0.0
    var priceUnder100kw = 0.0
    var priceOver100kw = 0.0
    var superPriceOver185kw = 0.0
    
    if(kw - 100 <= 0.0){
        
        // standard tax for kw under 100

        tempUnder100kw = kw
        priceUnder100kw = tempUnder100kw * euroStandardPrice[euro]
        
    }else{
        
        // adding extra-tax for kw over 100
        
        tempUnder100kw = 100
        tempOver100kw = kw - 100
        
        priceUnder100kw = tempUnder100kw * euroStandardPrice[euro]
        priceOver100kw = tempOver100kw * euroElevatedPrice[euro]
        
    }
    
    if(kw >= 185){
        
        // adding the extra-tax for kw over 185
        
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
        
    }
    
   
    
    // adding all the taxes

    return priceOver100kw + priceUnder100kw + superPriceOver185kw
    
    
}


let price = calculatePrice(kw: 63.0, euro: 6, productionYear: 2011)

print ("Il bollo per la tua auto è di \(price) €")
