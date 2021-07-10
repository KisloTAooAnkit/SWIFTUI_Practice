//
//  UpdateList.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 09/07/21.
//

import SwiftUI

struct UpdateList: View {
    
    
    @ObservedObject var store : UpdateStore = UpdateStore()

    

    
    
    
    
    var body: some View {
        NavigationView {
            ListView(updateData: $store.updates)
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update : Identifiable
{
    var id = UUID()
    var image : String
    var title : String
    var text : String
    var date : String
}


let updateData = [
    Update(
        image: "Card1",
        title: "SwiftUI Advanced",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the  ",
        date: "Jan 1"
    ),
    Update(
        image: "Card2",
        title: "Webflow",
        text: "Lorem Ipsum is simply dummy text of the printing and industry's standard dummy text ever since the 1500s, ",
        date: "OCT 17"
    ),
    Update(
        image: "Card3",
        title: "ProtoPie",
        text: "Lorem een the industry's standard dummy text ever since the 1500s, ",
        date: "Aug 27"
    ),
    Update(
        image: "Card4",
        title: "SwiftUI",
        text: "Lorem Ipsum is simply dummy text of t standard dummy text ever since the 1500s, ",
        date: "JUN 26"
    ),
    Update(
        image: "Card5",
        title: "Framer Playground",
        text: "Lorem Ipsum is simply dummy text of the printing and typ Ipsum has been the industry's standard dummy text ever since the 1500s, ",
        date: "JUN 11"
    )
]

struct ListView: View {
    
    
    @Binding var updateData : [Update]
    
    
    
    func addUpdates()  {
        updateData.append(
            Update(
                image: "Card1",
                title: "New item",
                text: "text",
                date: "Jan 1"
            ))
    }
    
    
    var body: some View {
        List {
            ForEach(updateData) { updateitem in
                NavigationLink(destination: UpdateDetail(update:updateitem)) {
                    HStack {
                        
                        Image(updateitem.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing,4)
                        
                        
                        
                        VStack(alignment: .leading, spacing: 8.0) {
                            
                            Text(updateitem.title)
                                .font(.system(size: 20, weight: .bold))
                           
                            Text(updateitem.text)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            
                            Text(updateitem.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
            
                        }
                    }
                    .padding(.vertical,8)
                    
                    
                }
            }
            .onMove(perform: { indices, newOffset in
                updateData.move(fromOffsets: indices, toOffset: newOffset)
            })
            
            .onDelete(perform: { indexSet in
                updateData.remove(at: indexSet.first!)
            })
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Updates")
        .navigationBarItems(leading:Button(action: addUpdates) {
            Text("Add Update")
        },trailing: EditButton())
        
    }
}
