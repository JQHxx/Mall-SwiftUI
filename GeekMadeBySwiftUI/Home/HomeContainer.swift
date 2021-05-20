//
//  Copyright © 2019 xgf. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct HomeContainer: View {
    @EnvironmentObject var vm : HomeVM
    @EnvironmentObject var tabBar : TabBarState
    @State var isRefreshing = false
    
    var body: some View {
        NavigationView {
            List {
                PageView(vm.banners.map {
                    KFImage(URL(string: $0))
                        .resizable()
                        .scaledToFill()
                })
                .frame(height : sw)
                .listRowInsets(EdgeInsets())
                ForEach((0..<vm.data.count), id : \.self) { index in
                    Section(header:
                                VStack(alignment: .leading) {
                                    Text(self.vm.data[index].category)
                                        .font(.headline)
                                        .bold()
                                        .frame(height : 25)
                                        .padding(.leading, 15)
                                        .offset(x: 0, y: 5)
                                    Divider()
                                }
                                .background(Color.white)
                    ) {
                        ForEach(self.vm.data[index].feeds) { feed in
                            NavigationLink(destination: FeedDetail(feed: feed).onAppear(perform: {
                                self.tabBar.hidden = true
                            }).onDisappear(perform: {
                                self.tabBar.hidden = false
                            })) {
                                FeedView(feed: feed)
                            }
                            .padding(.trailing, -16)//hide accosryView(arrow)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .pullToRefresh(isShowing: $isRefreshing, onRefresh: {
                self.vm.loadData {
                    self.isRefreshing = false
                }
            })
            .navigationBarTitle("Today", displayMode: .inline)
        }
    }
}

struct HomeContainer_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainer().environmentObject(HomeVM())
    }
}
