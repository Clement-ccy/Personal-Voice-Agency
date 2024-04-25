import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct SettingPage {
  build() {
    Column() {
      Title({pageTitle:'设置'})
      Column() {
        Text("这是设置页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}