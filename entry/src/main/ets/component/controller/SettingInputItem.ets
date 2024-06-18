
@Component
export struct SettingInputItem {
  private title: string;
  @Link value: string;
  private arr: string[] = [];
  private callback: () => void = () => {
    if (this.arr.length > 0) {
      TextPickerDialog.show({
        range: this.arr,
        selected: this.arr.indexOf(this.value),
        onAccept: (value: TextPickerResult) => {
          this.value = this.arr[value.index]
        } })
    }
  }

  build() {
    Row() {
      Text(this.title).fontSize(14).fontColor('#333333')
      Blank()
      Text(this.value).fontSize(14).fontColor('#888888').onClick(this.callback)
    }.width('100%').height(50)
  }
}