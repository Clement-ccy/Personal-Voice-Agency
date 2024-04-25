import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import { PagesPathModel } from '../../common/model/PagesPathModel'
import {onJumpClick} from '../../common/utils/RooterUtil'


@Component
export struct IconListItem {
  @Consume abc:PagesPathModel

  build() {
    Column() {
      Row() {
        Image(this.abc.icon)
          .width(30)
          .height(30)
        Text(this.abc.name)
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
      .width(Const.FULL_PERCENT)
    }
    .onClick(() => {
      onJumpClick(this.abc.address)
    })
    .alignItems(HorizontalAlign.Start)
    .padding(8)
    .width('100%')
    .height(40)
    .justifyContent(FlexAlign.Center)
  }
}