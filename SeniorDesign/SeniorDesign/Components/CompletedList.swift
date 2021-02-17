//
//  CompletedList.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI



struct CompletedList: View {
    
    @Binding var completedItems:[TaxForm]
    
    var body: some View {
                
        VStack(alignment: .leading) {
                        
            HStack {
                Text("Forms").foregroundColor(Color(.label))
                Text("Completed").foregroundColor(Color("Primary"))
            }
            .font(Font.custom(Theme.fontName, size: 20, relativeTo: .title).weight(.bold))
            .padding([.leading, .top])
                        
            VStack {
                ForEach(completedItems) { item in
                    HStack(alignment: .center) {
                        Text(item.name)
                            .font(Font.custom(Theme.fontName, size: 16, relativeTo: .body).weight(.medium))
                        Spacer().frame(maxWidth: Theme.maxScreenWidth)
                        Circle()
                            .fill(Color("Primary"))
                            .frame(width: 15, height: 15, alignment: .trailing)
                    }                    
                    .padding()
                }
            }
        }
    }
}

struct CompletedList_Previews: PreviewProvider {
    static var previews: some View {
        CompletedList(completedItems: .constant([TaxForm(name: "1040 NR"), TaxForm(name: "Hello world")]))
    }
}
