import XCTest
@testable import RxStepper

class Tests: XCTestCase {

    func testItCapsToMinimumValue() {
        
        // given
        let stepper = RxStepper()
        stepper.startValue = 1
        stepper.endValue   = 10
        
        // when
        stepper.currentValue = -1 // less than startValue
        
        // then
        XCTAssertEqual(stepper.value(), 1)
    }
    
    func testItCapsToMaximumValue() {
        
        // given
        let stepper = RxStepper()
        stepper.startValue = 1
        stepper.endValue   = 10
        
        // when
        stepper.currentValue = 11
        
        // then
        XCTAssertEqual(stepper.value(), 10)
    }
    
    func testItReflectFromViewModel() {
        
        // given
        let stepper = RxStepper()
        stepper.startValue = 1
        stepper.endValue   = 10
        
        // when
        stepper.viewModel.value.accept(value: 5)
        
        // then
        XCTAssertEqual(stepper.value(), 5)
    }
    
}
