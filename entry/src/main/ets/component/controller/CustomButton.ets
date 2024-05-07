@Component
export default struct CustomButton {
  @Prop name: string

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor('#333333')
        Blank()
        Button(this.name)
          .backgroundColor('#0055FF')
      }
      .width('100%')
      .height(50)
    }
    .width('100%')
  }
}