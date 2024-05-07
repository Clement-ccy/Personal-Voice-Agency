import router from '@ohos.router';
import { CommonConstants as Const } from '../../common/constants/CommonConstants';

@Component
export struct SubscriptionItemView {

  build() {
    Row() {
      Image($r('app.media.bg_default_show'))
        .width(80)
        .borderRadius(50)

      Column() {
        Text('账户名字')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Regular)
          .width('100%')
          .textAlign(TextAlign.Start)
          .maxLines(2)
          .align(Alignment.Top)
          .padding({ left: 12 })
        Blank()

        Row() {
          //作者头像
          Text('作者简介')
            .maxLines(1)
            .fontSize(12)
            .fontColor('#aaaaaa')
            .width('100%')
            .margin({ left: 4, right: 8 })
        }.padding({ left: 12 })
      }
      .padding({ top: 24, bottom: 24 })
      .width(150)
      .height(Const.FULL_PERCENT)

      Button('已关注').width(100)
    }
    .onClick(() => {
      router.pushUrl({ url: 'pages/detailPage', params: {} });
    })
    .width(Const.FULL_PERCENT)
    .height(100)
    .borderRadius(4)
  }
}