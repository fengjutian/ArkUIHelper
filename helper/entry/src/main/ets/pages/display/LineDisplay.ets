import { router } from '@kit.ArkUI';

@Builder
export function LineDisplayBuild(name: string, param: string) {
  LineDisplay({name: name})
}

@Preview
@Entry
@Component
export struct LineDisplay {
  @State message: string = 'Hello World';
  name: String = '';
  private scrollerForScroll: Scroller = new Scroller()

  build() {
    Scroll(this.scrollerForScroll) {
      Column({space: 20}){
        Row(){
          Text('线性布局 (Row/Column)').fontSize($r(`app.string.title2`)).fontWeight(FontWeight.Bold)
        }.width('100%').justifyContent(FlexAlign.Center)

        Row(){
          Text('概述').fontSize($r(`app.string.title2`)).fontWeight(FontWeight.Bold)
        }.width('100%')

        Text(`线性布局（LinearLayout）是开发中最常用的布局，通过线性容器Row和Column构建。线性布局是其他布局的基础。线性布局的排列方向由所选容器组件决定，Column容器内子元素按照垂直方向排列，Row容器内子元素按照水平方向排列。`)

        Text('Column容器意图:')
        Image($rawfile(`LineDisplay/display1.png`)).width(200).height(200)

        Text('Row容器意图:')
        Image($rawfile(`LineDisplay/display2.png`)).width(200).height(200)

        Row(){
          Text('space属性').fontSize($r(`app.string.title2`)).fontWeight(FontWeight.Bold)
        }.width('100%')
        Text('在布局容器内，可以通过space属性设置排列方向上子元素的间距，使各子元素在排列方向上有等间距效果。')

        Row(){
          Text('Column容器内排列方向的间距图:')
        }.width('100%')
        Image($rawfile(`LineDisplay/column_space.png`)).width(200).height(200)

        Text(`Column({ space: 20 }) {}.width('100%')`)
        Image($rawfile(`LineDisplay/column_space_1.png`)).width(200).height(200)

        Row(){
          Text('Row容器内排列方向的间距图:')
        }.width('100%')
        Image($rawfile(`LineDisplay/row_space.png`)).height(200)
        Text(`Row({ space: 35 }) {}.width('90%')`)

        Row(){
          Text('主轴上的排列方式: justifyContent').fontSize($r(`app.string.title2`)).fontWeight(FontWeight.Bold)
        }.width('100%')
        Text('在布局容器内，可以通过justifyContent属性设置子元素在容器主轴上的排列方式。')
        Row(){
          Text('Column垂直方向上的排列').fontSize($r(`app.string.title3`)).fontWeight(FontWeight.Bold)
        }.width('100%')
        Image($rawfile(`LineDisplay/column_direction.png`)).height(300).width('100%')
        Text(`
          Column({}) {}
          .width('100%')
          .height(300)
          .justifyContent(FlexAlign.Start)
        `)

        Button('返回首页').onClick(() => {
          router.back()
        })
      }.padding(10).width('100%').alignItems(HorizontalAlign.Start)

    }.height('100%')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(5) // 滚动条宽度
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)

  }
}