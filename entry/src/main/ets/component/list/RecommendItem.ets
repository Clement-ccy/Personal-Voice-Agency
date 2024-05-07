import router from '@ohos.router';

@Component
export struct RecommendItemView {
  private ratio: number = 4 / 3

  build() {
    Column() {
      Stack() {
        Image($r('app.media.bg_default_show'))
          .width('100%')
          .height('100%')
          .borderRadius({ topLeft: 4, topRight: 4 })
        Row() {
          Image($r('app.media.ic_play_count_white'))
            .width(16)
            .height(16)
          Text('666.6万') //阅读量
            .fontSize(11)
            .fontColor(Color.White)
            .margin({ left: 4, right: 8 })
          Image($r('app.media.ic_danmakus_white'))
            .width(16)
            .height(16)
          Text('999') //评论数量
            .fontSize(11)
            .fontColor(Color.White)
            .margin({ left: 4, right: 8 })
          Blank()
          Text('2:33') //视频时长/字数统计 StringUtil.stringForTime(<number>this.item.duration * 1000)
            .fontSize(11)
            .fontColor(Color.White)
        }.width('100%').padding(4).linearGradient({
          colors: [["#00000000", 0.0], ["#aa000000", 1.0]]
        })
      }.width('100%')
      .aspectRatio(this.ratio)
      .alignContent(Alignment.BottomStart)

      Text('帖子名字')
        .fontSize(14)
        .fontColor('#333333')
        .fontWeight(FontWeight.Regular)
        .height(48)
        .width('100%')
        .textAlign(TextAlign.Start)
        .maxLines(2)
        .align(Alignment.Top)
        .padding({ left: 12, right: 12, top: 12 })
      Row() {
        //作者头像
        Image($r('app.media.music_icon_playlist_upper'))
          .width(16)
          .height(16)
          .margin({ left: 12, right: 8 })
        Text('作者名字')
          .maxLines(1)
          .fontSize(12)
          .fontColor('#aaaaaa')
          .height(30)
          .width('100%')
      }
    }
    .onClick(() => {
      router.pushUrl({ url: 'pages/detailPage', params: {} });
    })
    .borderRadius(4)
    .backgroundColor('#ffffff')
    .shadow({ radius: 3, color: "#ff6d6d6d" })
  }
}