import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { PagesPathModel } from '../common/model/PagesPathModel'
import {onJumpClick} from '../common/utils/RooterUtil'

const mePage: Array<PagesPathModel> = [
  {
    icon: $r('app.media.ic_post'),
    name: '我的帖子',
    address: 'pages/me/MyPostPage'
  },

  {
    icon: $r('app.media.ic_subscribed'),
    name: '关注',
    address: 'pages/me/SubscribePage'
  },

  {
    icon: $r('app.media.ic_favourite'),
    name: '收藏',
    address: 'pages/basic/FavoritePage'
  },
  {
    icon: $r('app.media.ic_setting'),
    name: '设置',
    address: 'pages/basic/SettingPage'
  },
]

@Component
export struct Me {
  @Builder NavigationTitle() {
    Row() {
      Image($r('app.media.icon'))
        .height(50)
        .margin(16)
      Column(){
        Text('felite').textAlign(TextAlign.Start)
        Text('账号：1375571607')
      }.align(Alignment.Start)
      Blank()
      Image($r('app.media.ic_arrow_left_filled'))
        .height(24)
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
    .padding({ left: 12, right: 12 })
    .backgroundColor($r('app.color.list_item'))
    .margin({ left: 20, right: 20, top: 16, bottom: 16 })
    .borderRadius(16)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
  }

  build() {
    Navigation() {
      Column() {
        List(){
          ForEach(mePage, (item: PagesPathModel) => {
            ListItem() {
              Column() {
                Row() {
                  Image(item.icon)
                    .width(30)
                    .height(30)
                    .fillColor('#FFFFFF')
                  Text(item.name)
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
                onJumpClick(item.address)
              })
              .alignItems(HorizontalAlign.Start)
              .padding(8)
              .width('100%')
              .height(40)
              .justifyContent(FlexAlign.Center)
            }
          })
        }
      }
      .padding({ left: 12, right: 12 })
      .backgroundColor($r('app.color.list_item'))
      .margin({ left: 20, right: 20, top: 16, bottom: 16 })
      .borderRadius(16)
    }
    .title(this.NavigationTitle())
    .backgroundColor('#011838')
  }
}