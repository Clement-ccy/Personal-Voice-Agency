import { CommonConstants as Const } from '../../common/constants/CommonConstants';
import { RecommendView } from '../list/RecommendView';
import { WorkshopView } from '../list/WorkshopView';
import TitleTab from '../title/TitleTab';

@Component
export struct Discover {

  @StorageLink("netIsAvailable") netIsAvailable: boolean = true;
  @State selectTab: number = 0
  @State changeValue: string = ''
  @State submitValue: string = ''

  build() {
    Column() {
      Column() {
        // Text('onSubmit:' + this.submitValue).fontSize(18).margin(15)
        // Text('onChange:' + this.changeValue).fontSize(18).margin(15)
        Search({ value: this.changeValue, placeholder: '谁是山里灵活的狗' })
          .searchButton('SEARCH')
          .width(Const.SEARCHBAR_WIDTH)
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.submitValue = value
          })
          .onChange((value: string) => {
            this.changeValue = value
          })
          .margin(20)

        TitleTab({ selectTab: $selectTab, recommend:true, creativeWorkshop:true })
          .width(Const.FULL_PERCENT)
      }
      .width(Const.FULL_PERCENT)
      .backgroundColor($r('app.color.list_item'))

      //内容
      if (!this.netIsAvailable) {
        Text('网络不给力，请检查网络设置。')
          .width('100%')
          .fontSize(14).textAlign(TextAlign.Center)
          .padding({ top: 16, bottom: 16 })
          .backgroundColor("#ffe1df")
      }
      else {
        if (this.selectTab === 0) {
          RecommendView()
        }
        else {
          WorkshopView()
        }
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}