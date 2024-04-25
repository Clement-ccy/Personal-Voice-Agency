import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct VoiceCombinationPage {
  build() {
    Column() {
      Title({pageTitle:'声音融合'})
      Column() {
        Text("这是声音融合页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}