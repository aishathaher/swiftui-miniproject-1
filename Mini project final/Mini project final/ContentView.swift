//
//  ContentView.swift
//  Mini project final
//
//  Created by عايشة on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    private let emojiList: [EmojiItem] = [
        EmojiItem(
            emoji: "➊",
            name: "🚲", price: 10
            ),
        EmojiItem(
            emoji: "➋",
            name: "🚲", price: 20
        ),
        EmojiItem(
            emoji: "➌",
            name: "🚲", price: 30
           ),
        EmojiItem(
            emoji: "➍",
            name: "🚲", price: 40
            ),
        EmojiItem(
            emoji: "➎",
            name: "🚲", price: 40
            ),
        EmojiItem(
            emoji: "➏",
            name: "🚲", price: 50
            )
        
        
    ]
    var body: some View {
        NavigationView {
            List(emojiList) { emojiItem in
                NavigationLink(destination: SecondView( price: emojiItem.price)){
                        EmojiCircleView(emojiItem: emojiItem)
                       
                        
                    .padding(10)
                    
                    
                }
            }
            .navigationBarTitle("تأجير الدراجات")
        }
    }
}

struct EmojiCircleView: View {
    let emojiItem: EmojiItem
    
    var body: some View {
        HStack{
            Text(emojiItem.emoji)
                .font(.largeTitle)
                .frame(width: 70, height: 70)
            Text(emojiItem.name)
                .font(.headline)
        }
    }
}


struct EmojiItem: Identifiable {
    let id = UUID ()
    let emoji: String
    let name: String
    let price: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct SecondView: View {
    @State var name = ""
    @State var phone = ""
    @State var hours = 0
    @State var bicycle = 0
    var price: Double

    
    var body: some View {
        VStack {
            Image("123")
                .resizable()
                .scaledToFit()
                .frame(height: 100)

        
        TextField("Type your name here", text: $name)
            
       TextField("Type your phone number", text: $phone)
            
            
            Stepper("hours: \(hours)",  value: $hours, in: 0...122)
                .padding()
            Stepper("bicycle: \(bicycle)",  value: $bicycle, in: 0...122)
                .padding()
            
            let hour = (Double(bicycle) ?? 0) * (Double(hours) ?? 0) * price
            Text("\(hour)")
            
            if hour > 0 {
                NavigationLink(destination:ThirdView(name: name, phone: phone, hours: hours, bicycle: bicycle)){
//                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                    Text("اضغط للمتابعة")
//                        .font(.largeTitle)
//            }
                    Text("اضغط للمتابعة")
                        .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                .padding()}
                
            
        }

    }
}
}

struct ThirdView: View {
    @State var tapped = false
    var name: String
    var phone: String
    var hours: Int
    var bicycle: Int
//    @binding var name: String

    var body: some View {
        HStack{
            Spacer()
            Text("الفاتورة")
              .font(.largeTitle)
            .multilineTextAlignment(.trailing)
        }.padding()
        VStack{
            HStack(alignment: .lastTextBaseline){
                Text(name)
                    .font(.title)
                Spacer()

                Text("الاسم")
            }.padding()
            VStack{
                HStack(alignment: .lastTextBaseline){
                    Text(phone)
                        .font(.title)
                    Spacer()

                    Text("رقم الهاتف")
                }.padding()
                VStack{
                    HStack(alignment: .lastTextBaseline){
                        Text("\(hours)")
                            .font(.title)
                        Spacer()

                        Text( "عدد الساعات")
                    }.padding()
                VStack{
                    HStack(alignment: .lastTextBaseline){
                        Text("\(bicycle)")
                            .font(.title)
                        Spacer()
                        Text( "عدد الدراجات")
                    }.padding()
                    
                    Spacer()
                    Spacer()
                    

                    Text(tapped ? "تم الدفع" : "ادفع الان")
                        .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(tapped ? Color.green : Color.blue)
                        .cornerRadius(5)
                        .onTapGesture {
                            self.tapped.toggle()
                            
                        }
                .padding()}
                    
                    
               
//                VStack{
//                   HStack{
//                       Spacer()
//                       Text("3.44 AM")
//                       Spacer()
//                       Spacer()
//                       Text("الفجر")
//                       Spacer()
//                }
//                .padding()
//
                
            
    
//            Button(action: {
//                self.name = String(Int(self.name)!+1)
//               .onTapGesture{

            
//        }.onTapGesture{

    }
}
    }
}
}

