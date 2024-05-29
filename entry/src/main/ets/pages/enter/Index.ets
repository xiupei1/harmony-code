import {MyUtils} from '../common/utils'
import router from '@ohos.router';
@Entry
@Component
struct second {
  build() {
    Column(){
      Text('enter页面').onClick(()=>{
        router.pushUrl({url:'pages/Index'}).then((res)=>{
          console.log('跳转成功')
        })
        // MyUtils.routerChange('pages/Index','pushUrl')
      })
    }
  }
}