/*
 * @author 鼓捣JIA
 * @date 2023/12/03 23:35
 */

@Component
export default struct CustomSlider {
  @Prop name: string
  @Link value: number
  @Prop min: number
  @Prop max: number
  private step? : number

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor('#333333')
        Blank()

        Slider({ value: this.value, min: this.min, max: this.max, step: this.step ? this.step : 1 })
          .blockColor($r('app.color.start_window_background'))
          .selectedColor('#0055FF')
          .onChange((value: number, _) => {
            this.value = value
          })
          .width('55%')

        Text(`${Math.floor(this.value)}`)
          .textAlign(TextAlign.End)
          .width(32)
          .fontColor('#999999')
          .fontSize(14)
      }
      .width('100%')
      .height(50)

    }
    .width('100%')
  }
}