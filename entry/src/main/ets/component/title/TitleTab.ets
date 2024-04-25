/*
 * @author 鼓捣JIA
 * @date 2024/02/25 09:35
 */

@Component
export default struct TitleTab {
  @Link selectTab: number
  @Prop interface: boolean
  @Prop property: boolean
  @Prop common: boolean

  build() {
    Row({ space: 32 }) {
      if (this.interface) {
        if (this.selectTab === 0) {
          Column() {
            Text('接口')
              .fontColor($r('app.color.brand'))
              .textAlign(TextAlign.Center)
              .fontWeight(500)
          }
          .width(60)
          .height(24)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .backgroundColor($r('app.color.brand_light'))
          .transition({ type: TransitionType.Insert, opacity: 0.5, scale: { x: 0.85, y: 0.85 } })
        } else {
          Text('接口')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              animateTo({ duration: 200 }, () => {
                this.selectTab = 0
              })
            })
        }
      }

      if (this.property) {
        if (this.selectTab === 1) {
          Column() {
            Text('属性')
              .fontColor($r('app.color.brand'))
              .textAlign(TextAlign.Center)
              .fontWeight(500)
          }
          .width(60)
          .height(24)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .backgroundColor($r('app.color.brand_light'))
          .transition({ type: TransitionType.Insert, opacity: 0.5, scale: { x: 0.85, y: 0.85 } })

        } else {
          Text('属性')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              animateTo({ duration: 200 }, () => {
                this.selectTab = 1
              })
            })
        }
      }

      if (this.common) {
        if (this.selectTab === 2) {
          Column() {
            Text('通用')
              .fontColor($r('app.color.brand'))
              .textAlign(TextAlign.Center)
              .fontWeight(500)
          }
          .width(60)
          .height(24)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .backgroundColor($r('app.color.brand_light'))
          .transition({ type: TransitionType.Insert, opacity: 0.5, scale: { x: 0.85, y: 0.85 } })
        } else {
          Text('通用')
            .fontColor($r('app.color.font_normal'))
            .textAlign(TextAlign.Center)
            .width(60)
            .onClick(() => {
              animateTo({ duration: 200 }, () => {
                this.selectTab = 2
              })
            })
        }
      }
    }
    .height(40)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .padding({ bottom: 4 })
    .backgroundColor($r('app.color.background_white'))
  }
}