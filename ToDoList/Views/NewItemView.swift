import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var NewItemPresented: Bool

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .tint(.brown)
                
                
                // Button
                TLButtonView(title: "Save", backkground: .brown, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        NewItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                })
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all the fields and select a due date that is in the future."))
            
            }
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    @State static var isPresented = true

    static var previews: some View {
        NewItemView(NewItemPresented: $isPresented)
    }
}
