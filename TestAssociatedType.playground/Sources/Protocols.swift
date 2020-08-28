import Foundation

public protocol P: CustomStringConvertible {
    init?(rawValue: String)
    var rawValue: String { get }

    static var allEnumCases: [P] { get }
}

public extension P where Self: CaseIterable {
    static var allEnumCases: [P] { allCases as! [P] }

    func assert() {
        assert(0 == 1)
    }
}
