import router from '@ohos.router';
import { CommonConstants as Const } from '../../common/constants/CommonConstants';

@Component
export struct WorkshopItemView {
  private ratio: number = 1

  build() {
    Row() {
      Stack() {
        Image($r('app.media.bg_default_show'))
          .width('100%')
          .height('100%')
          .borderRadius({ topLeft: 4, topRight: 4 })
        Row()
        .width('100%')
        .height(14)
        .linearGradient({
          colors: [["#00000000", 0.0], ["#aa000000", 1.0]]
        })
      }
      .height(Const.FULL_PERCENT)
      .aspectRatio(this.ratio)
      .alignContent(Alignment.BottomStart)

      Column() {
        Text('帖子名字')
          .fontSize(14)
          .fontColor('#333333')
          .fontWeight(FontWeight.Regular)
          .width('100%')
          .textAlign(TextAlign.Start)
          .maxLines(2)
          .align(Alignment.Top)
          .padding({ left: 12 })
        Blank()

        Row() {
          //作者头像
          Image($r('app.media.music_icon_playlist_upper'))
            .width(16)

          Text('作者名字')
            .maxLines(1)
            .fontSize(12)
            .fontColor('#aaaaaa')
            .width('100%')
            .margin({ left: 4, right: 8 })
        }.padding({ left: 12 })

        Row() {
          Image($r('app.media.ic_play_count'))
            .width(16)
          Text('666.6万') //阅读量
            .fontSize(12)
            .fontColor('#aaaaaa')
            .margin({ left: 4, right: 8 })
          Image($r('app.media.ic_danmakus'))
            .width(16)
          Text('999') //评论数量
            .fontSize(12)
            .fontColor('#aaaaaa')
            .margin({ left: 4, right: 8 })
        }
        .width(Const.FULL_PERCENT)
        .padding({ left: 12 })
      }
      .padding({ top: 12, bottom: 12 })
      .height(Const.FULL_PERCENT)


      Column(){
        Image($r('app.media.ic_danmakus'))
          .width(16)
      }.width(16)
    }
    .onClick(() => {
      router.pushUrl({ url: 'pages/detailPage', params: {} });
    })
    .width(Const.FULL_PERCENT)
    .height(100)
    .borderRadius(4)
    .backgroundColor('#ffffff')
    .shadow({ radius: 3, color: "#ff6d6d6d" })
  }
}