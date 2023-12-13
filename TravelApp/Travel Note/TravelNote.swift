import SwiftUI
import SwiftData


struct Second_Interface_Of_Notes: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items : [Nota]
    @State private var newNoteName: String = ""
    @State private var navigateBackToNotes: Bool = false
    
    var body: some View {
        
        // NavigationView { // Avvolgi il contenuto in NavigationView
        VStack {
            TextField("Type here", text: $newNoteName)
                .padding(.horizontal)
                .frame(maxHeight: .infinity)
                .position(x: 200, y: 0)
            
        }.toolbar() {
            ToolbarItemGroup(placement: .topBarTrailing) {Button("Done") {
                addNotes(noteName: newNoteName)
                newNoteName = "" // Pulisce il campo di testo dopo l'aggiunta della nota
                navigateBackToNotes = true // Imposta la variabile di stato per tornare alla vista precedente
            }.tint(.yellow)
                
                
            }
        }
    }
    
    
    
    func addNotes(noteName: String) {
        let tizio = Nota(name: noteName)
        context.insert(tizio)
        try? context.save()
    }
    
    func deleteNotes(_ item: Nota) {
        context.delete(item)
        try? context.save()
    }
    
    
    
}


#Preview {
    NavigationStack{
        Second_Interface_Of_Notes()
    }
}

