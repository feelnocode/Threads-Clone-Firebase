//
//  EditProfileViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 16/01/2025.
//

import Foundation
import PhotosUI
import SwiftUI

@Observable
class EditProfileViewModel {
    
    var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }
    var profileImage: Image?
    private var uiImage: UIImage?
    var bio = ""
    
    func updateUserData() async throws {
        try await updateProfileImage()
        try await updateProfileBio()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await imageUploader.uploadImage(image: image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
    private func updateProfileBio() async throws {
        guard !bio.isEmpty else { return }
        try await UserService.shared.updateUserProfileBio(withBio: bio)
    }
}
