
import { RecommendItemView } from './RecommendItem';
@Component
export struct RecommendView {
  private scroller: Scroller = new Scroller();
  @State data: any[] = [];

  build() {
    Column() {
      Row() {
        Flex() {
          RecommendItemView()
        }.layoutWeight(1)
        Flex().width(8).height(8)
        Flex() {
          RecommendItemView()
        }.layoutWeight(1)
      }
      Flex().width('100%').height(8)
    }
    .height('100%')
    .width('100%')
    .padding({ top: 8, left: 16, right: 16 })
  }
}