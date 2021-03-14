import SwiftUI

@available(iOS 14.0, *)
public extension UserDefaults {
    func set(_ color: Color, forKey key: String) {
        set(color.hex, forKey: key)
    }
    func color(forKey key: String) -> Color? {
        guard let hex = object(forKey: key) as? String else { return nil }
        return  Color(hex: hex)
    }
    func set(_ colors: [Color], forKey key: String) {
        set(colors.map { $0.hex }, forKey: key)
    }
    func colors(forKey key: String) -> [Color]? {
        guard let hexArray = object(forKey: key) as? [String] else { return nil }
        return hexArray.compactMap { Color(hex: $0) }
    }

    func set(_ color: UIColor, forKey key: String) {
        set(color.hex, forKey: key)
    }
    func uicolor(forKey key: String) -> UIColor? {
        guard let hex = object(forKey: key) as? String else { return nil }
        return  UIColor(hex: hex)
    }
    func set(_ colors: [UIColor], forKey key: String) {
        set(colors.map { $0.hex }, forKey: key)
    }
    func uicolors(forKey key: String) -> [UIColor]? {
        guard let hexArray = object(forKey: key) as? [String] else { return nil }
        return hexArray.compactMap { UIColor(hex: $0) }
    }
}
