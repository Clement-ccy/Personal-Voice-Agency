import ValueObject from '../../common/model/ValueObject'

@Component
export default struct CustomSelect {
  @Prop name: string
  @Link valuesList: Array<ValueObject>
  @Link itemsList: Array<Object>
  @Link selectItem: Object

  build() {
    Column() {
      Row() {
        Text(this.name)
          .fontColor('#333333')
        Blank()
        Select(this.valuesList)
          .fontColor('#666666')
          .value(this.valuesList[0].value)
          .onSelect((index: number, _) => {
            this.selectItem = this.itemsList[index]
          })
      }
      .width('100%')
      .height(50)
    }
    .width('100%')
  }
}

