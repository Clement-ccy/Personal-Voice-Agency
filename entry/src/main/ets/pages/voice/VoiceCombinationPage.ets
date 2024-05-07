import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import CustomSlider from '../../component/controller/CustomSlider'
import CustomSwitch from '../../component/controller/CustomSwitch'
import Title from '../../component/title/Title'

@Entry
@Component
struct VoiceCombinationPage {
  @State cywl:number = 50
  @State nxd:number = 50
  @State operationStep: number = 20
  @State noiseDecliner: boolean = true
  build() {
    Column() {
      Title({pageTitle:'声音融合'})
      Column() {
        CustomSlider({name:'出音味来-673',value:$cywl,min:0,max:100})
        CustomSlider({name:'纳希哒-179',value:$nxd,min:0,max:100})
        Row(){
          Button('添加')
          Button('开始融合')
        }
        CustomSlider({name:'迭代步数',value:$operationStep,min:0,max:50})
        CustomSwitch({name:'是否启用降噪',isOn:$noiseDecliner})
      }
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}