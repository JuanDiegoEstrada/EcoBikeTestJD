//
//  NewUserView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI
import FirebaseAuth

struct NewUserView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    @State var userName: String = String()
    @State var password: String = String()
    @State private var showAlert: Bool = Bool()
    @State private var showAlertAuth: Bool = Bool()
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("Registrare")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 50)
                TextField("Correo electronico", text: $userName)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 50)
                SecureField("Contraseña", text: $password)
                    .keyboardType(.default)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                HStack{
                    Button("Registrarse"){
                        if !userName.isEmpty && !password.isEmpty {
                            authFirebase()
                        } else {
                            showAlert = true
                        }
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundStyle(.blue)
                    .cornerRadius(15)
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .padding()
        }
        
        .alert("Datos Incompletos", isPresented: $showAlert) {
            Button("Ok", role: .cancel){showAlert = Bool()}
        } message: {
            Text("Los datos ingresados no estan completos")
        }
        
        .alert("Error", isPresented: $showAlertAuth) {
            Button("Ok", role: .cancel){showAlertAuth = Bool()}
        } message: {
            Text("Se ha producido un error al registrar el usuario")
        }
    }
    
    private func authFirebase(){
        Auth.auth().createUser(withEmail: userName, password: password) {(result, error) in
            if let result = result, error == nil {
                navigationRouter.navigate(to: .homelist)
            } else {
                showAlertAuth = true
            }
        }
    }
}

#Preview {
    NewUserView()
}
