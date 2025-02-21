import {LineDisplayBuild} from './display/LineDisplay';
import { router } from '@kit.ArkUI';
import { ArkUIPage } from './ArkUIPage'

@Preview
@Entry
@Component
struct Index {
  build() {
    Tabs({barPosition: BarPosition.End}) {
        TabContent() {
          ArkUIPage()
        }
        .tabBar('ArkUI')

        TabContent() {
          Text('ArkTS内容').fontSize(30)
        }
        .tabBar('ArkTS')

        TabContent() {
          Text('ArkWeb的内容').fontSize(30)
        }
        .tabBar('ArkWeb')

        TabContent() {
          Text('我的内容').fontSize(30)
        }
        .tabBar("系统")
      }
  }
}