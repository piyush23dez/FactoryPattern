//: Playground - noun: a place where people can play

import UIKit

protocol JobSeekerProtocol {
    func sendJobEmail() -> String
}

struct Contact {
    
    var name: String
    var email: String
    var salary: Double
    var job: Job
    
    enum Job {
        case iOS
        case android
        case java
        case windows
    }
}

struct iOSJobSeeker: JobSeekerProtocol {
    
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Dear \(contact.name), Send me your resume today! I have a job opportunity that can pay you \(contact.salary)."
    }
}


struct AndroidJobSeeker: JobSeekerProtocol {
    
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Dear \(contact.name), Send me your resume today! I have a job opportunity that can pay you \(contact.salary)."
    }
}


struct JavaJobSeeker: JobSeekerProtocol {
    
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Dear \(contact.name), Send me your resume today! I have a job opportunity that can pay you \(contact.salary)."
    }
}

struct WindowsJobSeeker: JobSeekerProtocol {
    
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendJobEmail() -> String {
        return "Dear \(contact.name), Send me your resume today! I have a job opportunity that can pay you \(contact.salary)."
    }
}



struct JobSeekerFactory {
    
    static func getJobSeeker(contact: Contact) -> JobSeekerProtocol {
       
        switch contact.job {
        case .iOS:
            return iOSJobSeeker(contact: contact)
        case .android:
            return AndroidJobSeeker(contact: contact)
        case .java:
            return JavaJobSeeker(contact: contact)
        case .windows:
            return WindowsJobSeeker(contact: contact)
        }
    }
}


var contacts = [Contact]()

contacts.append(Contact(name: "Jack", email: "jack@example.com", salary: 110000, job: .iOS))

contacts.append(Contact(name: "Rock", email: "rock@example.com", salary: 120000, job: .android))

contacts.append(Contact(name: "mark", email: "mark@example.com", salary: 130000, job: .java))


for contact in contacts {
    let client = JobSeekerFactory.getJobSeeker(contact: contact)
    print (client.sendJobEmail())
}









