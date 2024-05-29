import router from '@ohos.router';
import audio from '@ohos.multimedia.audio';
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

type methodType = 'pushUrl' | 'replaceUrl'

let audioMananger = audio.getAudioManager()
let audioVolumeManager = audioMananger.getVolumeManager()

export class MyUtils {
  static routerChange(routerName: string, method: methodType, params?: object | undefined): void {
    if (method === 'pushUrl') {
      router.pushUrl({
        url: routerName,
        params: params
      }, (error) => {
        if (error) {
          console.log('跳转失败', error);
          return
        }
        console.log('跳转成功')
      })
    } else {
      router.replaceUrl({
        url: routerName
      })
    }

  }
}

export class AVPlayerDemo {
  static avPlayer: media.AVPlayer
  static context = getContext(this) as common.UIAbilityContext

   static  setAVPlayerCallback() {
    AVPlayerDemo.avPlayer.on('seekDone', (seekDoneTime) => {
      console.info(`AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    })
    AVPlayerDemo.avPlayer.on('stateChange', async (state, reason) => {
      switch (state) {
        case 'initialized':
          console.info('AVPlayerstate initialized called.');
          AVPlayerDemo.avPlayer.prepare().then(() => {
            console.info('AVPlayer prepare succeeded.')
          })
          break;

        case 'prepared':
          console.info('AVPlayer state prepared called.');
          AVPlayerDemo.avPlayer.play()
          break;
        default:
          break;
      }
    })
  }

  static async initPlayer() {

    AVPlayerDemo.avPlayer = await media.createAVPlayer()
    AVPlayerDemo.setAVPlayerCallback()
    let fdPath = 'fd://'
    let context = getContext() as common.UIAbilityContext
    let pathDir = context.filesDir
    // let file = await fs.open($r('app.media.musicDemo'))
    AVPlayerDemo.avPlayer.url='http://m802.music.126.net/20240529170448/f17e6df2312e1b9e5ac52c94e5d7564c/jd-musicrep-ts/ed88/50c3/e8df/e373556a62182903430f30275e61e9c4.mp3'
  }
}

