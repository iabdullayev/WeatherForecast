
//

import Foundation
import UIKit

struct Forecast {
    
    let dayOfTheWeek: String
    let high: Int
    let low: Int
    let image: UIImage?

}

extension Forecast {
    
    struct Key {
        static let dayOfTheWeek = "dayOfTheWeek"
        static let high = "high"
        static let low = "low"
        static let image = "image"
    }
    
    init?(json: [String: AnyObject]) {
        
        guard let weekDay = json[Key.dayOfTheWeek] as? String,
        let highTemp = json[Key.high] as? Int,
        let lowTemp = json[Key.low] as? Int,
        let imageIcon = json[Key.image] as? UIImage? else { return nil}

        self.dayOfTheWeek = weekDay
        self.high = highTemp
        self.low = lowTemp
        self.image = imageIcon
    }
}
