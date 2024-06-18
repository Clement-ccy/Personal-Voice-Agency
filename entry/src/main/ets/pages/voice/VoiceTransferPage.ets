import {CommonConstants as Const} from '../../common/constants/CommonConstants'
import ValueObject from '../../common/model/ValueObject';
import CustomSelect from '../../component/controller/CustomSelect';
import CustomSlider from '../../component/controller/CustomSlider';
import CustomSwitch from '../../component/controller/CustomSwitch';
import Title from '../../component/title/Title';
import AudioData from '../../common/model/AudioDataModel';
import { downloadAudio } from '../../common/utils/Request';

@Entry
@Component
struct VoiceTransferPage {
  //音频
  @State selectedAudio: AudioData = {
    name: '',
    uri: '',
    size: 0,
    time: 0,
    duration: 0,
    height: ''
  }
  @State transferredAudio: AudioData = {
    name: '',
    uri: '',
    size: 0,
    time: 0,
    duration: 0,
    height: ''
  }
  //type Button 样式
  @State model: string = '出音味来-673'
  @State modelArr: string[] = [
    '出音味来-673',
    '纳希哒-179',
    '洛天1-288'
  ]
  @State modelValueArr: Array<ValueObject> = [
    { value: '出音味来-673' },
    { value: '纳希哒-179' },
    { value: '洛天1-288' }
  ]
  @State operationStep: number = 20
  @State noiseDecliner: boolean = true
  build() {
    Column() {
      Title({pageTitle:'声音转化'})
      .width('90%')
      Column() {
        //导入音频
        Stack(){
          Image($r('app.media.btn_empty'))
            .width(200)
          Column(){
            Image($r('app.media.ic_loudspeaker')).width(70)
            Text("音频名称").fontSize(18)
          }
          .width('90%')
        }.width(Const.FULL_PERCENT)

        //转化箭头
        Row(){
          Button('开始转化')
            .onClick(()=>{
              downloadAudio()
            })
          Blank(50)
          Image($r('app.media.ic_vector')).height(90)
          CustomSelect({
            name: '模型选择',
            valuesList: $modelValueArr,
            itemsList: $modelArr,
            selectItem: $model
          })
        }
        .width(Const.FULL_PERCENT)

        //转化后音频
        Stack(){
          Image($r('app.media.btn_empty'))
            .width(200)
          Column(){
            Image($r('app.media.ic_loudspeaker')).width(70)
            Text("音频名称").fontSize(18)
          }
          .width('90%')
        }.width(Const.FULL_PERCENT)
        CustomSlider({name:'迭代步数',value:$operationStep,min:0,max:50})
        CustomSwitch({name:'是否启用降噪',isOn:$noiseDecliner})
      }
      .width('90%')
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .backgroundColor('#011838')
  }
}