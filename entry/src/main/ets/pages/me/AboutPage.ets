import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import { SettingSwitchItem } from '../../component/controller/SettingSwitchItem';
import { SettingSelectItem } from '../../component/controller/SettingSelectItem';
import { SettingRow } from '../../component/list/SettingRow';
import Title from '../../component/title/Title'

@Entry
@Component
struct SettingPage {
  @StorageLink("appVersionName") appVersionName: string = "";
  @StorageLink("appVendor") appVendor: string = "";

  build() {
    Column() {
      Title({pageTitle:'关于'})
      Scroll() {
        Column() {
          this.LogoAndVersionComponent()
          this.AppInfoComponent()
          this.CopyrightComponent()
          this.DonateComponent()
        }.width('100%').padding({ left: 15, right: 15 })
      }
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .layoutWeight(1)
    }.width('100%').height('100%')
    .backgroundColor('#011838')
  }

  @Builder LogoAndVersionComponent() {
    Column() {
      Image($r("app.media.icon"))
        .height(72)
        .width(72)
        .border({ width: 0.7, radius: 16, color: '#ebebeb' })
      Text('Personal Voice Agency')
        .fontSize(18)
        .fontColor('#333333')
        .fontWeight(500)
        .padding({ top: 8 })
      Text('版本 ' + this.appVersionName)
        .fontSize(14)
        .fontColor('#888888')
        .margin({ top: 4 })
    }
    .alignItems(HorizontalAlign.Center)
    .align(Alignment.Top)
    .padding({
      top: 24,
      bottom: 36
    })
  }

  @Builder AppInfoComponent() {
    // 第一组
    Column() {
      List() {
        ListItem() {
          SettingRow({
            icon: $r('app.media.app_icon'),
            title: '应用简介',
            info: '基于hamonyOS系统ArkUI框架开发的一个变声器第三方框架客户端',
            showRightArrow: false,
            clickHandler: () => {
            }
          })
        }

        ListItem() {
          SettingRow({
            icon: $r('app.media.app_icon'),
            title: '应用作者',
            info: this.appVendor + '',
            showRightArrow: false,
            clickHandler: () => {
            }
          })
        }

        ListItem() {
          SettingRow({
            icon: $r('app.media.app_icon'),
            title: '开源仓库',
            info: 'https://gitee.com/',
            showRightArrow: false,
            clickHandler: () => {
            }
          })
        }

        ListItem() {
          SettingRow({
            icon: $r('app.media.app_icon'),
            title: '开源社区',
            info: 'https://gitee.com/',
            showRightArrow: false,
            clickHandler: () => {
            }
          })
        }
      }.divider({ strokeWidth: 0.5, color: '#d6d6d6', startMargin: 58, endMargin: 14 })
    }.borderRadius(18).backgroundColor('#fff')
  }

  @Builder CopyrightComponent() { //版权
    Column() {
      Text("版权声明").fontSize(16).fontColor('#333333')
        .alignSelf(ItemAlign.Start)
        .margin({ top: 16 })
      Text("【PVA变声器】是一款基于HarmonyOS系统ArkUI框架开发的Sovits-SVC第三方客户端，" +
      "资源版权归属于原作者，请不要用于商业用途，否则一切后果自负。")
        .fontSize(12)
        .fontColor('#888888')
        .alignSelf(ItemAlign.Start)
        .margin({ top: 8, bottom: 16 })
    }.borderRadius(18)
    .padding({ left: 14, right: 14 })
    .margin({ top: 24 })
    .backgroundColor('#fff')
  }

  @Builder DonateComponent() { //捐赠 donate
    Column() {
      Text("捐赠").fontSize(16).fontColor('#333333')
        .alignSelf(ItemAlign.Start)
        .margin({ top: 16 })
      Text("捐赠并不是必须的，不捐赠并不影响该App的正常使用。作为非盈利的开源项目，一杯咖啡就是对我们最好的支持。")
        .fontSize(12)
        .fontColor('#888888')
        .alignSelf(ItemAlign.Start)
        .margin({ top: 8, bottom: 8 })

      Row() {
        Image($r("app.media.ic_weixin_pay"))
          .height(120)
          .width(120)
          .margin({ left: 24, right: 12 })
        Image($r("app.media.ic_zhifubao_pay"))
          .height(120)
          .width(120)
          .margin({ left: 12, right: 24 })
      }.padding({ bottom: 16 })
    }.borderRadius(18)
    .padding({ left: 14, right: 14 })
    .margin({ top: 24, bottom: 24 })
    .backgroundColor('#fff')
  }
}