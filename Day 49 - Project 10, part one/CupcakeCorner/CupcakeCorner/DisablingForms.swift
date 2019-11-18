//
//  DisablingForms.swift
//  CupcakeCorner
//
//  Created by Sebastian Vidrea on 18/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct DisablingForms: View {
    @State var username = ""
    @State var email = ""

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct DisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        DisablingForms()
    }
}
