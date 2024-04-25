import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct ProfilePage {
  build() {
    Column() {
      Title({pageTitle:'个人信息'})
      Column() {
        Text("这是个人信息页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}