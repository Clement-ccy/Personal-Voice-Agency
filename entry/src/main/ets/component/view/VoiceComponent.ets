import { CommonConstants as Const } from '../../common/constants/CommonConstants';
import { PagesPathModel } from '../../common/model/PagesPathModel'
import { onJumpClick } from '../../common/utils/RooterUtil'

const voicePage: Array<PagesPathModel> = [
  {
    name: '转化',
    address: 'pages/voice/VoiceTransferPage'
  },

  {
    name: '声音融合',
    address: 'pages/voice/VoiceCombinationPage'
  },

  {
    name: '声音训练',
    address: 'pages/voice/VoiceTrainPage'
  }
]

@Component
export struct Voice {
  private arr: String[] = ["声音转化", "声音融合", "声音训练"]
  @Builder NavigationTitle() {
    Row() {
      Image($r('app.media.icon'))
        .width(30)
        .height(30)
        .objectFit(ImageFit.Contain)
      Text('Personal Voice Agency')
        .fontColor('#FFFFFF')
        .fontSize(24)
        .lineHeight(40)
        .fontWeight(700)
    }.alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
  }

  build() {
    Navigation() {
      Image($r('app.media.ads'))
        .width('90%')
      Image($r('app.media.btn_transfer'))
        .width('90%')
        .onClick(() =>{
          onJumpClick(voicePage[0].address)
        })
      Row() {
        Button(voicePage[1].name, { type: ButtonType.Normal, stateEffect: true })
          .width('40%')
          .height(48)
          .backgroundColor('#00FFFFFF')
          .borderColor('#2268FE')
          .borderWidth(2)
          .borderRadius(12)
          .fontSize(16)
          .fontWeight(500)
          .fontColor('#FFFFFF')
          .margin({left:10,right:10})
          .onClick(() =>{
            onJumpClick(voicePage[1].address)
          })
        Button(voicePage[2].name, { type: ButtonType.Normal, stateEffect: true })
          .width('40%')
          .height(48)
          .backgroundColor('#00FFFFFF')
          .borderColor('#2268FE')
          .borderWidth(2)
          .borderRadius(12)
          .fontSize(16)
          .fontWeight(500)
          .fontColor('#FFFFFF')
          .margin({left:10,right:10})
          .onClick(() =>{
            onJumpClick(voicePage[2].address)
          })
      }
    }
    .title(this.NavigationTitle())
    .backgroundColor('#011838')
  }

}