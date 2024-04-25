import router from '@ohos.router';

@Component
export default struct Title {
  @Prop pageTitle: string
  build() {
    Stack(){
      Row() {
        Text(this.pageTitle)
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
            .fillColor('#666666')
        }
        .width(48)
        .justifyContent(FlexAlign.Center)
        .onClick(()=>{router.back()})

        Blank()
      }
      .width('100%')
    }
  }

}