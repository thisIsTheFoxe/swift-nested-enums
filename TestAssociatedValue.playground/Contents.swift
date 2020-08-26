import Foundation

// MARK: Definitions

protocol P: CustomStringConvertible {
    init?(rawValue: String)
    var rawValue: String { get }
}


enum E1: String {
    case a, b
}

extension E1: P {
    var description: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        }
    }
}

enum E2: String {
    case c, d
}

extension E2: P {
    var description: String {
        switch self {
        case .d:
            return "d"
        case .c:
            return "c"
        }
    }
}


enum X {
    case e1(E1), e2(E2), x, y, z
}

extension X {
    var associatedValue: P? {
        switch self {
        case let .e1(x):
            return x
        case let .e2(x):
            return x
        default: return nil
        }
    }
    
    var title: String {
        switch self {
        case .e1: return "e1"
        case .e2: return "e2"
        case .x: return "x"
        case .y: return "y"
        case .z: return "z"
        }
    }
}


// MARK: Implementaion

func write(enumCase: X) {
    print("Title: \(enumCase.title)")
    if let aValue = enumCase.associatedValue {
        print("  Value: \(aValue.rawValue)")
    }
}

write(enumCase: .e1(.a))
write(enumCase: .y)
write(enumCase: .e2(.d))
