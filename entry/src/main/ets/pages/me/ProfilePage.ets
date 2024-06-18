import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import { SettingSwitchItem } from '../../component/controller/SettingSwitchItem';
import { SettingSelectItem } from '../../component/controller/SettingSelectItem';
import Title from '../../component/title/Title'

@Entry
@Component
struct ProfilePage {
  @StorageLink('avatar') avatar: string = '1';
  @StorageLink('userName') userName: string = 'PalpitatingForever';
  @StorageLink('gender') gender: string = '1';
  @StorageLink('birthday') birthday: string = '2003.02.13';
  @StorageLink('tickle') tickle: string = '这个人很懒，没有留下什么';
  @StorageLink('school') school: string = 'xjtu';

  private userNameArr: string[] = ['aaa', 'PalpitatingForever']
  private birthdayArr: string[] = ['2003.02.13', '2003.05.18']
  private tickleArr: string[] = ['这个人很懒，没有留下什么', '这个人很勤劳，留下了一些东西']
  private schoolArr: string[] = ['xjtu', 'zju', 'bju', 'thu']

  build() {
    Column() {
      Title({pageTitle:'个人信息'})
      Scroll() {
        Column() {
          this.BaseSettingComponent()
        }.width('100%').height('100%')
        .padding({ left: 15, right: 15 })
      }
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .layoutWeight(1)
    }.width('100%').height('100%')
    .backgroundColor('#011838')
  }

  @Builder BaseSettingComponent() {
    Column() {
      Text("基本设置")
        .fontSize(18)
        .fontColor('#fff')
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 24, bottom: 8 })
      SettingSwitchItem({ title: "头像", value: $avatar })
      this.ItemDivider()
      SettingSelectItem({ title: "昵称", value: $userName, arr: this.userNameArr })
      this.ItemDivider()
      SettingSwitchItem({ title: "性别", value: $gender })
      this.ItemDivider()
      SettingSelectItem({ title: "出生年月", value: $birthday, arr: this.birthdayArr })
      this.ItemDivider()
      SettingSelectItem({ title: "个性签名", value: $tickle, arr: this.tickleArr })
      this.ItemDivider()
      SettingSelectItem({ title: "学校", value: $school, arr: this.schoolArr })
    }
    .padding({ left: 16, right: 16 })
    .margin({ top: 24 })
  }

  @Builder
  ItemDivider() {
    Flex().width(Const.FULL_PERCENT).height(0.5).backgroundColor("#d6d6d6")
  }
}