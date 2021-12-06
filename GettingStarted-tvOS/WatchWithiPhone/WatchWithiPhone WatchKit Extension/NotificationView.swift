//
//  ContentView.swift
//  GettingStarted-tvOS
//
//  Created by Saamer Mansoor on 11/29/21.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var jokeService = JokeService()

    var body: some View {
      ZStack {
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
      }
    }
  }

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
