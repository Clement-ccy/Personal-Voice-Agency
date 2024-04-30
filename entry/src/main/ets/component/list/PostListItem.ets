import {onJumpClick} from '../../common/utils/RooterUtil'

@Component
export default struct PostListItem {
  @Prop name: string
  @Prop address: string


  build() {
    Column(){
      Image()
      Text()
      Text()
    }
  }
}