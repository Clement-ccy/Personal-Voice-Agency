import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import { SubscriptionView } from '../../component/list/SubscriptionView'
import Title from '../../component/title/Title'

@Entry
@Component
struct SubscriptionPage {
  build() {
    Column() {
      Title({pageTitle:'关注'})
      Column() {
        SubscriptionView()
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}