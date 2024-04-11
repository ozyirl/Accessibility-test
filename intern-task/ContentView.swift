//
//  ContentView.swift
//  intern-task
//
//  Created by ozy  on 11/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isButtonPressed = false
    @State private var text = ""
    @State private var sliderValue = 50.0

      @State private var voiceOverEnabled = false
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    var body: some View {
        
        
        
       

        
            
        ZStack {
            Color(.blue).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text("Hi There!").bold().font(.system(size: 50)).accessibilityLabel("this is a text label which says Hi There!").foregroundColor(.white)
                
                
                Button(action: {
                    isButtonPressed.toggle()
                }) {
                    Text("Tap Me!")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10).padding(15)
                        .accessibilityAction {
                                    print("Custom accessibility action triggered!")
                                }
                }
                .accessibilityLabel("this is a button")
                .accessibilityHint("this button prints a text below")
                if isButtonPressed{
                    Text("button pressed")
                        .accessibilityLabel("button is pressed")
                }
               
                
                
                
                
               
                    
                Image(systemName:"accessibility").resizable() .aspectRatio(contentMode: .fit).frame(maxWidth: 120,maxHeight: 120).foregroundColor(.white).padding(15).accessibility(label: Text("accessiblity icon ")).accessibilityHint("this image does nothing")
                
                
                VStack {
                    Text("Slider Value: \(Int(sliderValue))").font(.system(size: 20)).bold().foregroundColor(.white).accessibilityLabel("this displays the current value of slider")
                    Slider(value: $sliderValue, in: 0...100, step: 1)
                        .padding()
                        .accentColor(.red)
                        .foregroundColor(.white)
                        
                        .accessibility(value: Text("the current value of slider is \(Int(sliderValue))"))
                        .accessibilityLabel("this is a slider with value from 0 to 100")
                    
                    
                    TextField("Enter text", text: $text)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .accessibilityLabel("Text Field")
                                .accessibilityValue(text)
                                .accessibilityHint("Type your text here")
                                .accessibilityAction {
                                                print("TextField tapped")
                                            }
                                .onSubmit {
                                                
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                }.padding(30)
                    
               
                

               
            }
            
            
            
        }
    }
}
    


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
