
import UIKit

class Theme {
    
    static var mainColor: UIColor {
        return UIColor(netHex: 0x362268)
    }
    
    static var mutedMainColor: UIColor {
        return UIColor(netHex: 0x493776)
    }
    
    static var textColor:UIColor {
        return UIColor(netHex: 0xffffff).withAlphaComponent(1.0)
    }
    
    static var purpleTextColor:UIColor {
        return UIColor(netHex: 0x7F729E).withAlphaComponent(1.0)
    }
    
    static var whiteColor:UIColor {
        return .white
    }

   
    static var barStyle: UIBarStyle {
        return .default
    }
    
    class func apply() {
        
        // MARK: UINavigationBar
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().barStyle = barStyle
        UINavigationBar.appearance().tintColor = whiteColor
        UINavigationBar.appearance().barTintColor = mainColor
        UINavigationBar.appearance().isTranslucent = false
    }

}
