import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
  
  let urlString: String
  let resizingMode: ContentMode
  
  init(urlString: String = Constants.randomImage, resizingMode: ContentMode = .fill) {
    self.urlString = urlString
    self.resizingMode = resizingMode
  }
  
  var body: some View {
    Rectangle()
      .opacity(0.001)
      .overlay {
        WebImage(url: URL(string: urlString))
          .resizable()
          .indicator(.activity)
          .aspectRatio(contentMode: resizingMode)
          .allowsHitTesting(false)
      }
      .clipped()
  }
}

#Preview {
  ImageLoaderView()
    .cornerRadius(30)
    .padding(40)
    .padding(.vertical, 60)
}
