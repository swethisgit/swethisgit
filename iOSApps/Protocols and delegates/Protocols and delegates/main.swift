protocol AdvancedLifeSuppport {
    func doCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSuppport?
    
    func assessSituation() {
        print("What happened?")
    }
    
    func medicalEmergency() {
        delegate?.doCPR()
    }
}

struct Paramedical: AdvancedLifeSuppport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func doCPR() {
        print("CPR going on")
    }
}

let doctor = EmergencyCallHandler()
let nurse = Paramedical(handler: doctor)
doctor.assessSituation()
doctor.medicalEmergency()

