//
//  ContentView.swift
//  Shopping List
//
//  Created by Luca Salmi on 2022-03-04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    
    @State var filterText = ""
    @State var itemToAdd = ""
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                TextField("Search", text: $filterText)
                    .padding(.leading)
                ShoppingListView(filter: filterText)
                
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        TextField("Add an Item", text: $itemToAdd)
                    }
                    ToolbarItem {
                        Button(action: checkNewItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
            
        }
    
    func checkNewItem(){
        
        if itemToAdd != ""{
            addItem()
        }else{
            return
        }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name = itemToAdd
            newItem.done = false
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
