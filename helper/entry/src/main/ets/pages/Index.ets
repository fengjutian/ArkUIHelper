interface itemListT {
  name: string;
  path: string;
}

interface APIListT {
  name: string;
  item: itemListT[]
}

const APIList: APIListT[] = [
  {name: '布局', item: [
    { name: '线性布局 (Row/Column)', path: '' },
    { name: '层叠布局 (Stack)', path: '' },
    { name: '弹性布局 (Flex)', path: '' },
    { name: '相对布局 (RelativeContainer)', path: '' },
    { name: '栅格布局 (GridRow/GridCol)', path: '' },
    { name: '媒体查询 (@ohos.mediaquery)', path: '' },
    { name: '创建列表 (List)', path: '' },
    { name: '创建网格 (Grid/GridItem)', path: '' },
    { name: '创建轮播 (Swiper)', path: '' },
    { name: '选项卡 (Tabs)', path: '' }
  ]},
  {name: '常用组件' , item: [
    { name: '按钮 (Button)', path: '' },
    { name: '单选框 (Radio)', path: '' },
    { name: '切换按钮 (Toggle)', path: '' },
    { name: '进度条 (Progress)', path: '' },
    { name: '显示图片 (Image)', path: '' },
    { name: '视频播放 (Video)', path: '' }
  ]},
  {name: '导航' , item: [{ name: '3', path: '' }]},
  {name: '文本' , item: [
    { name: '文本 (Text/Span)', path: '' },
    { name: '文本输入 (TextInput/TextArea)', path: '' },
    { name: '图标小符号 (SymbolGlyph/SymbolSpan)', path: '' },
    { name: '属性字符串（StyledString/MutableStyledString）', path: '' }
  ]},
  {name: '弹窗' , item: [{ name: '3', path: '' }]},
  {name: '图形' , item: [{ name: '3', path: '' }]},
  {name: '动画' , item: [{ name: '3', path: '' }]}
];

@Entry
@Component
struct Index {
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
      Text(itemI.name).margin({top: 20})
    })
  }

  build() {
    List() {
      
      ForEach(APIList, (itemGroup: APIListT) => {
        if(itemGroup.name){
          ListItemGroup({ header: this.itemHead(itemGroup.name) }) {
            this.APIChilds(itemGroup.item)
          }
        }
      })

      // ListItemGroup({ header: this.itemHead('A') }) {
      //   // 循环渲染分组A的ListItem
      // }
      //
      // ListItemGroup({ header: this.itemHead('B') }) {
      //   // 循环渲染分组B的ListItem
      // }
    }
  }
}