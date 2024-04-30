import { CommonConstants as Const } from '../../common/constants/CommonConstants';
import { PagesPathModel } from '../../common/model/PagesPathModel'
import { onJumpClick } from '../../common/utils/RooterUtil'

const mePage: Array<PagesPathModel> = [
  {
    icon: $r('app.media.ic_post'),
    name: '我的帖子',
    address: 'pages/me/MyPostPage'
  },

  {
    icon: $r('app.media.ic_subscribed'),
    name: '关注',
    address: 'pages/me/SubscriptionPage'
  },

  {
    icon: $r('app.media.ic_favourite'),
    name: '收藏',
    address: 'pages/me/FavouritePage'
  },
  {
    icon: $r('app.media.ic_setting'),
    name: '设置',
    address: 'pages/me/SettingPage'
  },
]

@Component
export struct Me {
  build() {
    Column() {

      //个人资料--------------------------------------------------------------
      Column(){
        Column(){
          Row() {
            Image($r('app.media.icon'))
              .height(40)
              .margin(8)
            Text('felite\n账号：1375571607')
              .fontColor($r('app.color.font_normal'))
              .textAlign(TextAlign.Start)
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
          .onClick(()=>{
            onJumpClick('pages/me/ProfilePage')
          })
          .width(Const.FULL_PERCENT)
          Divider().color($r('app.color.line_grey_light'))
          Text('声音模型发布者').fontColor($r('app.color.font_normal'))
            .margin({left:16,top:16})
            .width(Const.FULL_PERCENT)
        }
        .padding(12)
        .backgroundColor($r('app.color.list_item'))
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width(Const.FULL_PERCENT)
      //选项列表--------------------------------------------------------------
      List(){
        ForEach(mePage, (item: PagesPathModel) => {
          ListItem() {
            Column() {
              Row() {
                Image(item.icon)
                  .width(Const.LIST_ICON_SIZE)
                  .height(Const.LIST_ICON_SIZE)
                  .fillColor('#99ffffff')
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
            .margin(8)
            .width('100%')
            .height(40)
            .justifyContent(FlexAlign.Center)
          }
        })
      }
      .width(Const.FULL_PERCENT)
      .padding({ left: 12, right: 12 })
      .backgroundColor($r('app.color.list_item'))
      .margin({ left: 20, right: 20, top: 16, bottom: 16 })
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}