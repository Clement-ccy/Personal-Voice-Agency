import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import Title from '../../component/title/Title';

@Entry
@Component
struct VoiceTransferPage {
  build() {
    Column() {
      Title({pageTitle:'声音转化'})
      Column() {
        Stack(){
          Image($r('app.media.btn_empty'))
          Column(){
            Image($r('app.media.ic_loudspeaker'))
            Text("这是声音转化页面")
          }
        }
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}