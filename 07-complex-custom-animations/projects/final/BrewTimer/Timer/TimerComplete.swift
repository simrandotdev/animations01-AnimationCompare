/// Copyright (c) 2022 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct TimerComplete: View {
  @Binding var brewResult: BrewResult?
  @State var rating: Int = 0
  @Environment(\.presentationMode) var presentationMode

  let backGroundGradient = LinearGradient(
    colors: [Color("BlackRussian"), Color("DarkOliveGreen"), Color("OliveGreen")],
    startPoint: .init(x: 0.75, y: 0),
    endPoint: .init(x: 0.25, y: 1)
  )

  var body: some View {
    ZStack {
      backGroundGradient
        .ignoresSafeArea()
    VStack(spacing: 10) {
      Text("Brew Timer Complete")
        .font(.largeTitle)
      Text("Your \((brewResult?.name ?? "")) tea should be ready. Enjoy.")
      Text("Rate Your Brew")
      RatingView(rating: $rating)
        .tint(.yellow)
      Button("Save Rating") {
        guard let brew = brewResult else { return }
        brewResult = BrewResult(
          name: brew.name,
          time: brew.time,
          temperature: brew.temperature,
          amountWater: brew.amountWater,
          amountTea: brew.amountTea,
          rating: rating
        )
        presentationMode.wrappedValue.dismiss()
      }
    }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color("QuarterSpanishWhite"))
      )
    }
    .foregroundColor(
      Color("BlackRussian")
    )
  }
}

struct TimerComplete_Previews: PreviewProvider {
  static var previews: some View {
    TimerComplete(
      brewResult: .constant(BrewResult.sampleResult)
    )
  }
}
