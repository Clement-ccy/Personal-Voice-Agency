/*
 * @author 鼓捣JIA
 * @date 2023/12/03 23:35
 */

import router from '@ohos.router';

@Component
export default struct Title {
  @Prop pageTitle: string

  build() {
    Stack(){
      Row() {
        Text(this.pageTitle)
          .fontColor($r('app.color.font_main'))
          .fontSize(18)
          .fontWeight(700)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .height(60)
      Row(){
        Row(){
          Image($r('app.media.ic_public_arrow_left_filled'))
            .height(32)
            .fillColor($r('app.color.font_main'))
        }
        .width(48)
        .justifyContent(FlexAlign.Center)
        .onClick(()=>{router.back()})

        Blank()
      }
      .width('100%')
    }
    .backgroundColor($r('app.color.background_white'))
  }

}