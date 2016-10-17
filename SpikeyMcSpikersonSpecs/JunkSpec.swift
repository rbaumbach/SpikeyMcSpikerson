import Quick
import Nimble

struct Junk {
    var trash: Int
    var 💩: String
}

class JunkSpec: QuickSpec {
    override func spec() {
        describe("Junk") {
            var junk: Junk!
            
            beforeEach {
                junk = Junk(trash: 2, 💩: "poopie")
            }
            
            it("has trash") {
                expect(junk.trash).to(equal(2))
            }
            
            it("has 💩") {
                expect(junk.💩).to(equal("poopie"))
            }
        }
    }
}

// Note: I don't plan on doing testing for the main application, but this is more of a exercise
// in Swift testing setup using Quick and Nimble, but can serve as a scratch pad for a testing
// spike as well in the future.
