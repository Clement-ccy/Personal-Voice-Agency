import { CommonConstants as Const } from '../common/constants/CommonConstants';
import { Voice } from '../component/view/VoiceComponent';
import { Discover } from '../component/view/DiscoverComponent';
import { Me } from '../component/view/MeComponent';

interface BottomTabsItem {
  icon: Resource;
  text: Resource;
}

const BottomTabsList: Array<BottomTabsItem> = [
  {
    icon: $r('app.media.ic_voice'),
    text: $r('app.string.bottom_text_voice')
  },
  {
    icon: $r('app.media.ic_discover'),
    text: $r('app.string.bottom_text_discover')
  },
  {
    icon: $r('app.media.ic_me'),
    text: $r('app.string.bottom_text_me')
  }
]

@Entry
@Component
struct MainPage {
  @State @Watch('onIndexChange') bottomTabIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder TabBuilder(index: number, _name: string) {
    Column() {
      Image(BottomTabsList[index].icon)
        .width(Const.ICON_SIZE)
        .height(Const.ICON_SIZE)
        .fillColor(this.bottomTabIndex === index ?
        $r('app.color.bottom_tabs_font_color_selected') : $r('app.color.bottom_tabs_font_color'))

      Text(BottomTabsList[index].text)
        .fontSize($r('app.float.bottom_font_size'))
        .fontColor(this.bottomTabIndex === index ?
        $r('app.color.bottom_tabs_font_color_selected') : $r('app.color.bottom_tabs_font_color'))
    }
    .width(Const.FULL_PERCENT)
    .height(Const.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .border({ width: { top: Const.BORDER_WIDTH }, color: $r('app.color.color_border') })
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }

  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }

  pageTransition() {
    // 定义页面进入时的效果，从右侧滑入，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Push, duration: 50 })
      .slide(SlideEffect.Right)
    // 定义页面进入时的效果，从左侧滑入，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Pop, duration: 50 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionExit({ type: RouteType.Push, duration: 50 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向右侧滑出，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionExit({ type: RouteType.Pop, duration: 50 })
      .slide(SlideEffect.Right)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.End, justifyContent: FlexAlign.End }) {
      Tabs({ barPosition: BarPosition.End, index: 0, controller: this.controller }) {
        TabContent() {
          Voice()
        }.tabBar(this.TabBuilder(0, 'Voice'))

        TabContent() {
          Discover()
        }.tabBar(this.TabBuilder(1, 'Discover'))

        TabContent() {
          Me()
        }.tabBar(this.TabBuilder(2, 'Me'))
      }
      .width(Const.FULL_PERCENT)
      .height(Const.FULL_PERCENT)
      .vertical(false)
      .scrollable(false)
      .barHeight(Const.BAR_HEIGHT)
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width(Const.FULL_PERCENT)
  }

}