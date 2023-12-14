//
//  AddNoteView.swift
//  MyDummyNotes
//
//  Created by Alessandro Esposito Vulgo Gigante on 14/11/23.
//
import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteView: View {
    @Environment(\.modelContext) private var context
    @State var note: DataNote?
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
                        if let note = note {
                            additionalText = note.additionalText ?? ""
                        }
                    }

                VStack {
                    TabView {
                        if note == nil {
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
                        }

                        ForEach(note?.storedImages ?? [], id: \.self) { image in
                            if let uiImage = UIImage(data: image) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .accessibilityRemoveTraits(.isImage)
                                    .contextMenu() {
                                        Button(role: .destructive) {
                                            if let idx = note?.storedImages.firstIndex(of: image) {
                                                note?.storedImages.remove(at: idx)
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

                if let selectedDate = selectedDate {
                    Text("Selected Date: \(selectedDate)")
                        .padding()
                }
            }
            .navigationTitle(selectedDate ?? "Note") // Show selectedDate in navigationTitle
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem() {
                    Button("Done") {
                        if let note = note {
                            updateText(note)
                        } else {
                            self.note = saveText()
                        }
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

                ToolbarItem(placement: .bottomBar) {
                    Button("Add Note", systemImage: "square.and.pencil") {
                    }
                    .disabled(true)
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("New note")
                    .accessibilityHint("Double tap to compose a new note")
                }
            }
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    if let note = note {
                        note.storedImages.append(data)
                        selectedPhoto = nil
                    } else {
                        newPhotoData = data
                        selectedPhoto = nil
                    }
                }
            }
        }
    }

    func saveText() -> DataNote {
        if note == nil {
            let newNote = DataNote(additionalText: additionalText)
            newNote.timeStamp = Date.now
            if newPhotoData != nil {
                newNote.storedImages.append(newPhotoData!)
            }
            context.insert(newNote)
            return newNote
        }
        return DataNote(additionalText: "")
    }

    func updateText(_ note: DataNote) {
        note.additionalText = additionalText
        note.timeStamp = Date.now
        try? context.save()
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
