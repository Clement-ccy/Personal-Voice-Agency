import Title from '../component/title/Title'
import CustomSelect from '../component/controller/CustomSelect'
import CustomSwitch from '../component/controller/CustomSwitch'
import CustomSlider from '../component/controller/CustomSlider'
import ValueObject from '../common/model/ValueObject'

@Entry
@Component
struct ButtonPage {
  @State selectTab: number = 1

  //type Button 样式
  @State type: ButtonType = ButtonType.Capsule
  @State typeArr: ButtonType[] = [
  ButtonType.Capsule, // 胶囊型按钮（圆角默认为高度的一半）
  ButtonType.Circle, // 圆形按钮
  ButtonType.Normal // 普通按钮（默认不带圆角的矩形）
  ]
  @State typeValueArr: Array<ValueObject> = [
    { value: 'Capsule' },
    { value: 'Circle' },
    { value: 'Normal' }
  ]

  //stateEffect 按钮按下是否开启按压态效果
  @State stateEffect: boolean = true

  //width 通用宽度属性
  @State widthValue: number = 80
  //height 通用高度属性
  @State heightValue: number = 50
  //fontSize 字体大小
  @State sizeValue: number = 14

  build() {
    Column() {
      // 导航栏---------------------------------------------------------------------
      Column() {
        Title({ pageTitle: 'Button 按钮' })
      }

      // 组件预览区 ---------------------------------------------------------------------
      Blank()
      Column() {
        Button('Button')
          .type(this.type)
          .stateEffect(this.stateEffect)
          .backgroundColor($r('app.color.list_item'))
          .width(this.widthValue)
          .height(this.heightValue)
          .fontSize(this.sizeValue)
      }

      Blank()

      // 组件配置区---------------------------------------------------------------------
      Column() {
        //组件属性 tab
        Column() {
          CustomSelect({ name: 'type', valuesList: $typeValueArr, itemsList: $typeArr, selectItem: $type })
          Divider().color($r('app.color.line_grey_light'))
          CustomSwitch({ name: 'stateEffect', isOn: $stateEffect })
        }
        .visibility(this.selectTab === 1 ? Visibility.Visible : Visibility.None)

        //通用通用 tab
        Column() {
          CustomSlider({ name: 'width', value: $widthValue, min: 50, max: 180 })
          Divider().color($r('app.color.line_grey_light'))
          CustomSlider({ name: 'height', value: $heightValue, min: 20, max: 120 })
          Divider().color($r('app.color.line_grey_light'))
          CustomSlider({ name: 'fontSize', value: $sizeValue, min: 10, max: 40 })
        }
        .visibility(this.selectTab === 2 ? Visibility.Visible : Visibility.None)
      }
      .padding({ left: 12, right: 12 })
      .backgroundColor($r('app.color.start_window_background'))
      .margin({ left: 20, right: 20, top: 16, bottom: 16 })
      .borderRadius(16)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.start_window_background'))

  }
}