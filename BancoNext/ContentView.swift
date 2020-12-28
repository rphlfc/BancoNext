//
//  ContentView.swift
//  BancoNext
//
//  Created by Raphael Cerqueira on 28/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var isVisible = true
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.8852636218, blue: 0.3979144096, alpha: 1))
                .ignoresSafeArea(.all, edges: .all)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {}, label: {
                                Image(systemName: "bell")
                            })
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("AJUDA")
                                    .font(.system(size: 12, weight: .bold))
                            })
                        }
                        
                        Text("next")
                            .font(.system(size: 17, weight: .heavy))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    Divider()
                    
                    HStack(spacing: 15) {
                        Text("RC")
                            .font(.system(size: 19))
                            .padding(12)
                            .background(Color(#colorLiteral(red: 0.9169195294, green: 0.9216179252, blue: 0.9301531911, alpha: 1)))
                            .clipShape(Circle())
                        
                        Text("Raphael Cerqueira")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17, weight: .bold))
                        })
                    }
                    .padding(.horizontal)
                    .foregroundColor(Color.black)
                    .padding(.top, 8)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SALDO CONTA-CORRENTE")
                            .font(.system(size: 12))
                        
                        HStack {
                            Text("R$")
                                .font(.system(size: 21, weight: .bold))
                            
                            Text(isVisible ? "2.600,00" : "••••••••")
                                .font(.system(size: 21, weight: .bold))
                            
                            Spacer()
                            
                            Button(action: {
                                isVisible.toggle()
                            }, label: {
                                Image(systemName: isVisible ? "eye.slash" : "eye")
                            })
                        }
                    }
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    Divider()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image("pix-full")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 180)
                            
                            Spacer(minLength: 0)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 11, weight: .bold))
                                    
                                    Text("Cadastre")
                                }
                                
                                Text("aqui a sua")
                                
                                Text("Chave Pix")
                                    .foregroundColor(.green)
                                    .fontWeight(.bold)
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    })
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    Divider()
                    
                    MenuView()
                        .padding(.top, 8)
                    
                    ExtraOptionsView()
                        .padding(.top, 25)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                }
            })
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    var image: String
    var title: String
    var isSystem: Bool = true
    var isNew: Bool = false
    var isTemplate: Bool = false
}

struct MenuView: View {
    let items = [
        MenuItem(image: "star", title: "NEXTJOY"),
        MenuItem(image: "disney", title: "DISNEY+", isSystem: false, isNew: true),
        MenuItem(image: "pix", title: "PIX", isSystem: false, isNew: true, isTemplate: true),
        MenuItem(image: "dollarsign.circle", title: "SALDO E EXTRATO"),
        MenuItem(image: "arrow.left.arrow.right", title: "Transferências"),
        MenuItem(image: "barcode.viewfinder", title: "Pagar conta"),
        MenuItem(image: "iphone", title: "Recarga Celular"),
        MenuItem(image: "creditcard", title: "Cartão", isNew: true),
        MenuItem(image: "crown", title: "Mimos"),
        MenuItem(image: "heart", title: "Objetivos"),
        MenuItem(image: "chevron.up.square", title: "Agora Investimentos", isNew: true),
        MenuItem(image: "diamond", title: "Flow"),
        MenuItem(image: "dollarsign.circle", title: "Investimentos"),
        MenuItem(image: "dollarsign.square", title: "Crédito"),
        MenuItem(image: "dollarsign.circle", title: "Vaquinha"),
        MenuItem(image: "shield", title: "Proteção"),
        MenuItem(image: "wallet.pass", title: "Comprovantes"),
        MenuItem(image: "wallet", title: "Trazer salário"),
        MenuItem(image: "dollarsign.square", title: "Depósitos e saques")
    ]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100, maximum: (UIScreen.main.bounds.width / 2))), count: 2), spacing: 10, content: {
            ForEach(items) { item in
                Button(action: {}, label: {
                    ZStack(alignment: .topLeading) {
                        if item.isNew {
                            Text("Novo")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 4)
                                .background(Capsule().fill(Color.black))
                                .padding(.leading, 8)
                        }
                        
                        VStack {
                            if item.isSystem {
                                Image(systemName: item.image)
                                    .font(.system(size: 29))
                                    .foregroundColor(.black)
                                    .padding(13)
                            } else {
                                Image(item.image)
                                    .resizable()
                                    .renderingMode(item.isTemplate ? .template : .none)
                                    .foregroundColor(item.isTemplate ? .black : .none)
                                    .frame(width: 50, height: 50)
                            }
                            
                            Text(item.title)
                                .font(.system(size: 13))
                                .textCase(.uppercase)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            Divider()
                                .padding(.horizontal)
                        }
                        .frame(height: 120)
                    }
                })
            }
        })
        .padding(.horizontal)
    }
}

struct ExtraOptionsView: View {
    let options = ["REORGANIZAR MENU", "CONFIGURAÇÕES DO APP", "TERMOS E CONDIÇÕES", "SAIR"]
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(options, id: \.self) { option in
                Button(action: {}, label: {
                    Text(option)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.black)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
