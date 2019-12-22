
//MARK: FACTORY PATTERN

protocol JobPortal {
    func sendJobEmail() -> String
}

struct JobPortalFactory {
    func getJobPortal(for contact: Contact) -> JobPortal {
        switch contact.job {
        case .iOS:
            return iOSJobPortal(contact)
        case .Andriod:
            return AndriodJobPortal(contact)
        }
    }
}

struct Contact {
    let name: String
    let email: String
    let job: Job
    enum Job {
        case Andriod, iOS
    }
}

struct iOSJobPortal: JobPortal {
    private let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Hi \(contact.name) iOS Developer"
    }
}

struct AndriodJobPortal: JobPortal {
    private let contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Hi \(contact.name) Andriod Developer"
    }
}

let iOSContact = Contact(name: "Steve", email: "ABC", job: .iOS)
let andriodContact = Contact(name: "Mark", email: "XYZ", job: .Andriod)
let factory = JobPortalFactory()
factory.getJobPortal(for: andriodContact).sendJobEmail()
factory.getJobPortal(for: iOSContact).sendJobEmail()
