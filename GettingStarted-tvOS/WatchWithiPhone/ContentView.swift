//
//  ContentView.swift
//  WatchWithiPhone
//
//  Created by Saamer Mansoor on 11/30/21.
//

import SwiftUI
struct CustomNotification: Equatable {
    var text: String
    var isPriority: Bool
}
struct ContentView: View {
    @StateObject var jokeService = JokeService()
    @Binding var notification: CustomNotification?
    @AccessibilityFocusState var isNotificationFocused: Bool

    var body: some View {
      ZStack {
          if let notification = self.notification {
                          Text(jokeService.joke)
                              .accessibilityFocused($isNotificationFocused)
                      }
        Text(jokeService.joke)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
        VStack {
          Spacer()
          Button {
            async {
              try? await jokeService.fetchJoke()
            }
          } label: {
            Text("Fetch a joke")
              .padding(.bottom)
          }
        }
      }        .onChange(of: notification) { notification in
          if (notification?.isPriority == true)  {
              isNotificationFocused = true
          }
      }

    }
  }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(notification: .constant(CustomNotification(text: "LOL", isPriority: true)))
    }
}
