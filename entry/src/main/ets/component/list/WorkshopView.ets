
import { WorkshopItemView } from './WorkshopItem';
@Component
export struct WorkshopView {
  private scroller: Scroller = new Scroller();
  @State data: any[] = [];

  build() {
    Column() {
      WorkshopItemView()
      Flex().width('100%').height(8)
      WorkshopItemView()
    }
    .width('100%')
    .padding({ top: 8, left: 16, right: 16 })
  }
}