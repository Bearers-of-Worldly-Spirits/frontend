//
//  TaxFormCarousel.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/15/21.
//

import SwiftUI

struct ComingSoonTaxFormCarousel: View {
    
    var action: (_ formName:String) -> ()
        
    var body: some View {
        VStack(alignment: .leading) {
                        
            HStack(spacing: 5) {
                Text("Coming").foregroundColor(Color(.label))
                Text("Soon").foregroundColor(Color("Primary"))
            }
            .scaledFont(size: 16, name: Theme.font.bold)
            .padding([.leading, .top])            
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    Spacer(minLength: 15)
                    
                    GradientCardButton(title: "Form 1040 2021", gradient: Gradient(colors: [.red, .pink])) {}
                    GradientCardButton(title: "Form W8 2021", gradient: Gradient(colors: [.pink, .purple])) {}
                    GradientCardButton(title: "Form W8 NR 2021", gradient: Gradient(colors: [.purple, .blue])) {}
                    
                    Spacer(minLength: 15)
                 }
                 .frame(maxHeight: .infinity)
            }.frame(height: 160)
        }
    }
}

struct TaxFormCarousel: View {
             
    var action: (_ form:TaxForm) -> ()
        
    var body: some View {
        VStack(alignment: .leading) {
                        
            HStack(spacing: 5) {
                Text("Available").foregroundColor(Color(.label))
                Text("Forms").foregroundColor(Color("Primary"))
            }
            .scaledFont(size: 16, name: Theme.font.bold)
            .padding([.leading, .top])
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    Spacer(minLength: 15)
                    
                    GradientCardButton(title: "Form 8843", gradient: Gradient(colors: [.orange, .red])) {
                        action(TaxForm(name: "Form 8843"))
                    }
                    
                    Spacer(minLength: 15)
                 }
                 .frame(maxHeight: .infinity)
            }.frame(height: 160)
        }
    }
}

struct TaxFormCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonTaxFormCarousel { (formName) in
            
        }
    }
}
