import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import router from '@ohos.router';

@Entry
@Component
struct VoiceTransfer {
  @Builder NavigationTitle() {
    Stack(){
      Row() {
        Text('声音转化')
          .fontColor('#FFFFFF')
          .fontSize(18)
          .fontWeight(700)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .height(60)
      Row(){
        Row(){
          Image($r('app.media.ic_arrow_left_filled'))
            .height(32)
        }
        .width(48)
        .justifyContent(FlexAlign.Center)
        .onClick(()=>{router.back()})

        Blank()
      }
      .width('100%')
    }
  }


  build() {
    Column() {
      Navigation() {
        Column() {
          Text("这是声音转化页面")
        }
      }
      .title(this.NavigationTitle())
    }
    .backgroundColor('#011838')
  }
}