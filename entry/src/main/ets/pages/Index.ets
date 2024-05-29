


import { TableShow } from './TableShow'
import {scrollExample} from './scrollDemo'
import {swiperExample} from './Swiper'
import router from '@ohos.router';
import {hilog} from '@kit.PerformanceAnalysisKit'
import {MyUtils,AVPlayerDemo} from './common/utils'
import audio from '@ohos.multimedia.audio';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State num:number = 1
  @State arr:number[]=[1,2,3]
  scroll:Scroller = new Scroller()

  @State audioManager:audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager()

  private swiperContr:SwiperController = new SwiperController()

  aboutToAppear(): void {
    this.audioManager.on('volumeChange',(e)=>{
      console.log('volumeChange:',e)
    })
  }

  build() {
    Scroll(this.scroll){
      Column() {
          // scrollExample().height(200)
          // swiperExample()
        ChildImg()
          // Text(this.message)
          //   .fontSize(50)
          //   .fontWeight(FontWeight.Bold)
          Button(`数字 ${this.num}`).width(100).onClick(()=>{
            console.log('点击按钮1')
            hilog.info(0x000,'testTsg','点击按钮')
            this.num++
            // router.replaceUrl({url:'pages/enter/Index'}).then((res)=>{
            //   console.log('跳转成功')
            // })
            // MyUtils.routerChange('pages/enter/Index','pushUrl')
            AVPlayerDemo.initPlayer()
          }).backgroundColor('#333').margin(20)

        Button('调节音量').onClick(()=>{})
          // TableShow({count:this.num})
          // TableShow({count:this.arr[0]})
          // TableShow({count:this.arr[1]})
          // TableShow({count:this.arr[2]})

          // ForEach(this.arr,(item:number) => TableShow({count:item}),(item:number)=>item.toString())

          // Button('加1').onClick(()=>{
          //   this.arr = [3,4,5]
          // })
        ChildImg()
      }.width('100%')
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Black)
    .scrollBarWidth(10)



  }


}
@Builder function ChildImg(){
  Row(){
    Image($rawfile('myWorld.png')).width(100).onClick(()=>{
      console.log('点击图片')

    })
  }
}