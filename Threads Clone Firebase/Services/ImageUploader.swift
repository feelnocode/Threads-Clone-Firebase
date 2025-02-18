//
//  ImageUploader.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 16/01/2025.
//

import Foundation
import Firebase
import FirebaseStorage

struct imageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
