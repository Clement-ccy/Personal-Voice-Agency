
import { SubscriptionItemView } from './SubscriptionItem';
@Component
export struct SubscriptionView {
  private scroller: Scroller = new Scroller();
  @State data: any[] = [];

  build() {
    Column() {
      SubscriptionItemView()
      Flex().width('100%').height(8)
      SubscriptionItemView()
    }
    .width('100%')
    .padding({ top: 8, left: 16, right: 16 })
  }
}