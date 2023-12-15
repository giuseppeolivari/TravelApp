//
//  AddNoteView.swift
//  MyDummyNotes
//
//  Created by 
//


import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteView: View {
    @Environment(\.modelContext) private var modelContext
    
    var note: Travel
    @State private var additionalText: String = ""
    @FocusState private var isFocused: Bool
    @State var selectedPhoto: PhotosPickerItem?
    @State var newPhotoData: Data?
    var selectedDate: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $additionalText)
                    .font(.body)
                    .focused($isFocused)
                    .onAppear() {
                            additionalText = note.additionalText
                    }
                
                VStack {
                    TabView {
                        
                       if let imageData = newPhotoData,
                            let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .cornerRadius(15)
                                    .accessibilityRemoveTraits(.isImage)
                                    .contextMenu() {
                                        Button(role: .destructive) {
                                            newPhotoData = nil
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        
                        
                        ForEach(note.storedImages, id: \.self) { image in
                            if let uiImage = UIImage(data: image) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .accessibilityRemoveTraits(.isImage)
                                    .contextMenu() {
                                        Button(role: .destructive) {
                                            if let idx = note.storedImages.firstIndex(of: image) {
                                                note.storedImages.remove(at: idx)
                                            }
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                                    .accessibilityLabel("Image attachment")
                                    .accessibilityHint("Double tap and hold to scroll")
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    .containerShape(Rectangle())
                    .cornerRadius(15)
                    .padding(10)
                }
            }
        }
        .navigationTitle(selectedDate ?? "Note") // Show selectedDate in navigationTitle
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem() {
                Button("Done") {
                        updateText(note)
                    isFocused = false
                }
                .bold()
            }
            
            ToolbarItem(placement: .bottomBar) {
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Label("Add Image", systemImage: "camera")
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Camera")
                        .accessibilityHint("Double tap to add a photo into the current note")
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    note.storedImages.append(data)
                    selectedPhoto = nil
            }
        }
    }
    func updateText(_ note: Travel) {
        note.additionalText = additionalText
        try? modelContext.save()
    }
}
