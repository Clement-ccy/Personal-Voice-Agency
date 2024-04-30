import { CommonConstants as Const } from '../../common/constants/CommonConstants';
@Component
export default struct TitleTab {
  @Link selectTab: number
  @Prop recommend: boolean
  @Prop creativeWorkshop: boolean

  build() {
    Row() {
      if (this.recommend) {
        if (this.selectTab === 0) {
          Stack({ alignContent: Alignment.Bottom }) {
            Text('推荐')
              .fontColor($r('app.color.font_selected'))
              .fontWeight(500)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .align(Alignment.Top)
            Rect({width:'100%',height:'3'})
              .align(Alignment.Bottom)
              .fill($r('app.color.font_selected'))
              .transition({ type: TransitionType.Insert, scale: { x: 0.85, y: 0.85 } })
          }
          .width(Const.HALF_PERCENT)
          .height(Const.FULL_PERCENT)
          .margin({ top: 5 })
        } else {
          Stack({ alignContent: Alignment.Bottom }) {
            Text('推荐')
              .fontColor($r('app.color.font_normal'))
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .align(Alignment.Top)
          }
          .width(Const.HALF_PERCENT)
          .height(Const.FULL_PERCENT)
          .margin({ top: 5 })
          .onClick(() => {
            animateTo({ duration: 200 }, () => {
              this.selectTab = 0
            })
          })
        }
      }

      if (this.creativeWorkshop) {
        if (this.selectTab === 1) {
          Stack({ alignContent: Alignment.Bottom }) {
            Text('创意工坊')
              .fontColor($r('app.color.font_selected'))
              .fontWeight(500)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .align(Alignment.Top)
            Rect({width:'100%',height:'3'})
              .align(Alignment.Bottom)
              .fill($r('app.color.font_selected'))
              .transition({ type: TransitionType.Insert, scale: { x: 0.85, y: 0.85 } })
          }
          .width(Const.HALF_PERCENT)
          .height(Const.FULL_PERCENT)
          .margin({ top: 5 })
        } else {
          Stack({ alignContent: Alignment.Bottom }) {
            Text('创意工坊')
              .fontColor($r('app.color.font_normal'))
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .align(Alignment.Top)
          }
          .width(Const.HALF_PERCENT)
          .height(Const.FULL_PERCENT)
          .margin({ top: 5 })
          .onClick(() => {
            animateTo({ duration: 200 }, () => {
              this.selectTab = 1
            })
          })
        }
      }
    }
    .height(40)
    .width('100%')
    .padding(4)
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.list_item'))
  }
}