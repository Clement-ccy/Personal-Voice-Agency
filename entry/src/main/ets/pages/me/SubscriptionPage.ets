import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct SubscriptionPage {
  build() {
    Column() {
      Title({pageTitle:'关注'})
      Column() {
        Text("这是关注页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}