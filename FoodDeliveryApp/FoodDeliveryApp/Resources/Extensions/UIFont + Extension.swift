//
//  UIFont + Extension.swift
//  FoodDeliveryApp
//
//  Created by .Leeerrrmmm . on 10.08.2025.
//
import UIKit

extension UIFont {
    enum Roboto {
        enum black {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.black, size: size)!
            }
        }
        enum medium {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.medium, size: size)!
            }
        }
        enum regular {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size)!
            }
        }
        enum light {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size)!
            }
        }
        enum thin {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thin, size: size)!
            }
        }
        enum bold {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.bold, size: size)!
            }
        }
        enum italic {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.italic, size: size)!
            }
        }
        enum extraBold {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.extraBold, size: size)!
            }
        }
        enum semiBold {
            static func size(_ size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.semiBold, size: size)!
            }
        }
    }
}

private extension UIFont {
    enum Constants {
        enum Roboto {
            static let black = "Roboto-Black"
            static let medium = "Roboto-Medium"
            static let regular = "Roboto-Regular"
            static let light = "Roboto-Light"
            static let thin = "Roboto-Thin"
            static let bold = "Roboto-Bold"
            static let italic = "Roboto-Italic"
            static let extraBold = "Roboto-ExtraBold"
            static let semiBold = "Roboto-SemiBold"
        }
    }
}
