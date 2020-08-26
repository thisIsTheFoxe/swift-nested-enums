import Foundation

protocol P: CustomStringConvertible {
    init?(rawValue: String)
    var rawValue: String { get }

    static var allEnumCases: [P] { get }
}

extension P where Self: CaseIterable {
    static var allEnumCases: [P] { allCases as! [P] }
}

/*
struct S: P, CaseIterable {
    static var allCases: [E1] { E1.allCases }
    
    typealias AllCases = [E1]
    
    init?(rawValue: String) {
        self.rawValue = rawValue
        self.description = ""
    }
    
    var rawValue: String
        
    var description: String
}

let s = S(rawValue: "x")
S.allEnumCases
 */
enum E1: String, CaseIterable, P {
    
    var description: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        }
    }
    
    case a, b
}

enum E2: String, CaseIterable, P {
    
    var description: String {
        switch self {
        case .d:
            return "d"
        case .c:
            return "c"
        }
    }
    
    case c, d
}

enum X {
    case e1(E1), e2(E2), a, b, c
    
    var associatedValue: P? {
        switch self {
        case let .e1(x):
            return x
        case let .e2(x):
            return x
        default: return nil
        }
    }
}
let x1 = X.e1(.a)
x1.associatedValue
let x2 = X.e2(.d)
x2.associatedValue
let x3 = X.a
x3.associatedValue
