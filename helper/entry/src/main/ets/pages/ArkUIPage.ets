
import {LineDisplayBuild} from './display/LineDisplay';
import { router } from '@kit.ArkUI';

interface itemListT {
  name: string;
  path: string;
  des: string;
  status: number  // 0: 未开始  1：进行中  2：完结
}

interface APIListT {
  name: string;
  item: itemListT[]
}

const APIList: APIListT[] = [
  {name: '布局', item: [
    { name: '线性布局 (Row/Column)', path: 'pages/display/LineDisplay', des: '', status: 1 },
    { name: '层叠布局 (Stack)', path: '', des: '', status: 0 },
    { name: '弹性布局 (Flex)', path: '', des: '', status: 0 },
    { name: '相对布局 (RelativeContainer)', path: '', des: '', status: 0 },
    { name: '栅格布局 (GridRow/GridCol)', path: '', des: '', status: 0 },
    { name: '媒体查询 (@ohos.mediaquery)', path: '', des: '', status: 0 },
    { name: '创建列表 (List)', path: 'pages/display/ListDisplay', des: '', status: 1 },
    { name: '创建网格 (Grid/GridItem)', path: '', des: '', status: 0 },
    { name: '创建轮播 (Swiper)', path: '', des: '', status: 0 },
    { name: '选项卡 (Tabs)', path: '', des: '', status: 0 }
  ]},
  {name: '常用组件' , item: [

    { name: '按钮 (Button)', path: '', des: '', status: 0 },
    { name: '单选框 (Radio)', path: '', des: '', status: 0 },
    { name: '切换按钮 (Toggle)', path: '', des: '', status: 0 },
    { name: '进度条 (Progress)', path: '', des: '', status: 0 },
    { name: '显示图片 (Image)', path: '', des: '', status: 0 },
    { name: '视频播放 (Video)', path: '', des: '', status: 0 }
  ]},
  {name: '导航' , item: [{ name: '3', path: '', des: '', status: 0 }]},
  {name: '文本' , item: [
    { name: '文本 (Text/Span)', path: '', des: '', status: 0 },
    { name: '文本输入 (TextInput/TextArea)', path: '', des: '', status: 0 },
    { name: '图标小符号 (SymbolGlyph/SymbolSpan)', path: '', des: '', status: 0 },
    { name: '属性字符串（StyledString/MutableStyledString）', path: '', des: '', status: 0 }
  ]},
  {name: '弹窗' , item: [{ name: '3', path: '', des: '', status: 0 }]},
  {name: '图形' , item: [{ name: '3', path: '', des: '', status: 0 }]},
  {name: '动画' , item: [{ name: '3', path: '', des: '', status: 0 }]}
];

@Preview
@Entry
@Component
export struct ArkUIPage {
  pageStack: NavPathStack = new NavPathStack()

  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#21e18b')
      .width('100%')
      .padding(5)
  }

  @Builder APIChilds(item: itemListT[]) {
    ForEach(item, (itemI: itemListT) => {

      Row() {
        Text(itemI.name).margin({left: 10}).fontColor(Color.Blue)

        if(itemI.status === 0) {
          Text('[未开始]').margin({left: 10})
        }

        if(itemI.status === 1) {
          Text('[进行中]').margin({left: 10}).fontColor(Color.Green)
        }

        if(itemI.status === 2) {
          Text('[完结]').margin({left: 10})
        }
      }.
      margin({top: 0}).
      height('50vp').
      width('100%').
      border({width: 1})
      // .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .onClick(() => {
        if(itemI.path) {
          router.pushUrl({url: itemI.path}).then(() => {
            console.log('页面跳转成功')
          })
        }
      })


      // Navigation(this.pageStack){
      //   Text(itemI.name).margin({top: 20})
      // }
      // .navDestination(LineDisplayBuild())
      // .mode(NavigationMode.Auto).title('跳转')
    })
  }

  build() {
    Column(){
      List() {
        ForEach(APIList, (itemGroup: APIListT) => {
          if(itemGroup.name){
            ListItemGroup({ header: this.itemHead(itemGroup.name) }) {
              this.APIChilds(itemGroup.item)
            }
          }
        })
      }

      // Button('返回首页').onClick(() => {
      //   router.back()
      // })
    }
  }
}