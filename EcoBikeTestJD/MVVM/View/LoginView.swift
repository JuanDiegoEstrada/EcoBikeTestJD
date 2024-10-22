//
//  LoginView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    @State var userName: String = String()
    @State var password: String = String()
    @State private var showAlert: Bool = Bool()
    @State private var showAlertLogin: Bool = Bool()
    
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                Text("Inicio de sesión")
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
                    Button("Authenticar"){
                        if !userName.isEmpty && !password.isEmpty {
                            loginFirebase()
                        } else {
                            showAlert = true
                        }
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundStyle(.blue)
                    .cornerRadius(15)
                    
                    
                    Button("Registrarse"){
                        navigationRouter.navigate(to: .register)
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
        .alert("Datos Invalidos", isPresented: $showAlert) {
            Button("Ok", role: .cancel){showAlert = Bool()}
        } message: {
            Text("Los datos ingresados no son validos")
        }
        
        .alert("Error", isPresented: $showAlertLogin) {
            Button("Ok", role: .cancel){showAlertLogin = Bool()}
        } message: {
            Text("Los datos ingresados no existen o no son correctos")
        }
    }
    
    private func loginFirebase(){
        Auth.auth().signIn(withEmail: userName, password: password) { (result, error) in
            if let _ = result, error == nil {
                SessionUserDefaults.isSession = true
                navigationRouter.navigate(to: .homelist)
            } else {
                showAlertLogin = true
            }
        }
    }
}

#Preview {
    LoginView()
}
