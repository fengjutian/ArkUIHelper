import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';

@Preview
@Entry
@Component
struct ListDisplay {
  @State message: string = 'Hello World';
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {

      Web({
        src: 'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-layout-development-create-list-V5',
        controller: this.controller
      }).height('90%')

      // Button('返回首页').onClick(() => {
      //   router.back()
      // })

    }
  }
}