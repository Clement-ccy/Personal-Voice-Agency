
@Component
export struct SettingSwitchItem {
  private title: string;
  @Link value: string;
  private callback: (isOn) => void = (isOn) => {
    this.value = isOn ? '1' : '0';
  }

  build() {
    Row() {
      Text(this.title).fontSize(14).fontColor('#333333')
      Blank()
      Toggle({ type: ToggleType.Switch, isOn: this.value == '1' }).onChange(this.callback)
    }.width('100%').height(50)
  }
}