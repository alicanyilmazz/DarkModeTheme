//
//  ThemeService.swift
//  DarkModeTheme
//
//  Created by alican on 7.11.2021.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    typealias Color = UIColor
#endif
#if os(macOS)
    import Cocoa
    typealias Color = NSColor
#endif
 
import RxSwift
import RxTheme

protocol Theme {
    var backgroundColor: Color { get }
    var textColor: Color { get }
    var btnColor : Color { get }
}

struct LightTheme: Theme {
    let backgroundColor = Color.white
    let textColor = Color.black
    let btnColor = Color.systemPink
}

struct DarkTheme: Theme {
    let backgroundColor = Color.black
    let textColor = Color.white
    let btnColor = Color.systemOrange
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

let themeService = ThemeType.service(initial: .dark)
func themed<T>(_ mapper: @escaping ((Theme) -> T)) -> ThemeAttribute<T> {
    return themeService.attribute(mapper)
}
