/*
 * @author 鼓捣JIA
 * @date 2023/12/03 23:35
 */

@Component
export default struct CustomSwitch {
  @Prop name: string
  @Link isOn: boolean

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor('#FFFFFF')
        Blank()
        Toggle({ type: ToggleType.Switch, isOn: this.isOn })
          .selectedColor('#0055FF')
          .switchPointColor($r('app.color.start_window_background'))
          .onChange(() => {
            this.isOn = !this.isOn
          })
      }
      .width('100%')
      .height(50)

    }
    .width('100%')
  }
}