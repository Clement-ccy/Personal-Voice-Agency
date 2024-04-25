import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title'

@Entry
@Component
struct MyPostPage {
  build() {
    Column() {
      Title({pageTitle:'我的帖子'})
      Column() {
        Text("这是我的帖子页面")
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}