//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView: View {
    enum Sorted {
        case name, mostRecent
    }

    @EnvironmentObject var prospects: Prospects

    @State private var sorted: Sorted = .name

    @State private var isShowingScanner = false
    @State private var isShowingActionSheet = false

    let filter: FilterType

    var filteredProspects: [Prospect] {
        switch (filter, sorted) {
            case (.contacted, .name):
                return prospects.people.filter { $0.isContacted }.sorted { $0.name < $1.name }
            case (.uncontacted, .name):
                return prospects.people.filter { !$0.isContacted }.sorted { $0.name < $1.name }
            case (.contacted, .mostRecent):
                return prospects.people.filter { $0.isContacted }.sorted { $0.createdAt < $1.createdAt }
            case (.uncontacted, .mostRecent):
                return prospects.people.filter { !$0.isContacted }.sorted { $0.createdAt < $1.createdAt }
            case (.none, .name):
                return prospects.people.sorted { $0.name < $1.name }
            case (.none, .mostRecent):
                return prospects.people.sorted { $0.createdAt < $1.createdAt }
        }
    }

    var title: String {
        switch filter {
            case .none:
                return "Everyone"
            case .contacted:
                return "Contacted people"
            case .uncontacted:
                return "Uncontacted people"
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(prospect.name)
                                    .font(.headline)
                            }
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        if self.filter == .none {
                            if prospect.isContacted {
                                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                    .font(.title)
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "person.crop.circle.fill.badge.xmark")
                                    .font(.title)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .contextMenu {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
                            self.prospects.toggle(prospect)
                        }
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(title)
            .navigationBarItems(
                leading: Button(action: {
                    self.isShowingActionSheet = true
                }) {
                    Image(systemName: "arrow.up.arrow.down")
                    Text("Sort")
                },
                trailing: Button(action: {
                    self.isShowingScanner = true
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
        }
        .actionSheet(isPresented: $isShowingActionSheet) {
            ActionSheet(title: Text("Sorted by"),
                        message: nil,
                        buttons: [
                            .default(Text("Name")) {
                                self.sorted = .name
                            },
                            .default(Text("Most Recent")) {
                                self.sorted = .mostRecent
                            },
                            .cancel()]
            )
        }
    }

    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        switch result {
            case .success(let code):
                let details = code.components(separatedBy: "\n")
                guard details.count == 2 else { return }

                let person = Prospect()
                person.name = details[0]
                person.emailAddress = details[1]

                self.prospects.add(person)
            case .failure:
                print("Scanning failed")
        }
    }

    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
