import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import CustomSlider from '../../component/controller/CustomSlider'
import CustomSwitch from '../../component/controller/CustomSwitch'
import Title from '../../component/title/Title'

@Entry
@Component
struct VoiceTrainPage {
  @State operationStep: number = 20
  @State noiseDecliner: boolean = true
  build() {
    Column() {
      Title({pageTitle:'声音训练'})
      Column() {
        Stack(){
          Image($r('app.media.btn_empty'))
            .width(200)
          Column(){
            Image($r('app.media.ic_loudspeaker')).width(70)
            Text("音频名称").fontSize(18)
          }
          .width('90%')
        }.width(Const.FULL_PERCENT)
        Button('开始训练')
      }
      CustomSlider({name:'迭代步数',value:$operationStep,min:0,max:50})
      CustomSwitch({name:'是否启用降噪',isOn:$noiseDecliner})
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}