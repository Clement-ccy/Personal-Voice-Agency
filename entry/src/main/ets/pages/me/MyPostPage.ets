import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import { WorkshopView } from '../../component/list/WorkshopView'
import Title from '../../component/title/Title'

@Entry
@Component
struct MyPostPage {
  build() {
    Column() {
      Title({pageTitle:'我的帖子'})
      Column() {
        WorkshopView()
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}