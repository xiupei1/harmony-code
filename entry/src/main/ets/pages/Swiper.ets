import {hilog} from '@kit.PerformanceAnalysisKit'




@Component
export struct swiperExample {

  private swiper:SwiperController = new SwiperController()

  aboutToAppear(): void {
    hilog.info(0x0000,'111','aboutToAppear...')
  }
  build() {
    Swiper(this.swiper){
      Text("0")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text("1")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text("2")
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .fontSize(30)
    }
    .loop(true)
    .vertical(true)
    .height(200)
  }
}