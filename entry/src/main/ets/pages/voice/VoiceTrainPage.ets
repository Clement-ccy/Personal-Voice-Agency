import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct VoiceTrainPage {
  build() {
    Column() {
      Title({pageTitle:'声音训练'})
      Column() {
        Text("这是声音训练页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}