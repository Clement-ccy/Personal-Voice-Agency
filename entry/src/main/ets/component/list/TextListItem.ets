import {onJumpClick} from '../../common/utils/RooterUtil'


@Component
export default struct TextListItem {
  @Prop name: string
  @Prop address: string

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontSize(16)
          .margin({ left: 8 })
          .fontColor($r('app.color.font_normal'))
        Blank()
        Image($r('app.media.ic_arrow_left_filled'))
          .height(16)
          .rotate({
            x: 0,
            y: 1,
            z: 0,
            centerX: '50%',
            centerY: '50%',
            angle: 180
          })
          .fillColor($r('app.color.line_grey_light'))
      }
      .width('100%')

    }
    .onClick(() => {
      onJumpClick(this.address)
    })
    .alignItems(HorizontalAlign.Start)
    .padding(8)
    .width('100%')
    .height(40)
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.list_item'))
    .borderRadius(8)
  }
}