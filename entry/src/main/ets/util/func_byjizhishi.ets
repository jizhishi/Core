import { window } from '@kit.ArkUI';

//————————————————————————
// 函数名：hengping()
// 参数：judge:boolean
// 功能：是否允许播放页自动旋转
//——————————————————————————
const TAG = '横屏状态'
const ORIENTATION: Array<string> = ['垂直', '水平', '反向垂直', '反向水平']
export function  hengping(judge:boolean){
  try {
    if(judge===true){
      window.getLastWindow(getContext(), (err, data) => { // 获取window实例
        if (err.code) {
          console.error(TAG, 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          return;
        }
        let windowClass = data;
        console.info(TAG, 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        let names: Array<'status' | 'navigation'> = ['status', 'navigation'];
        windowClass.setWindowSystemBarEnable(names)
        windowClass.setWindowKeepScreenOn(true)
        let orientation = window.Orientation.AUTO_ROTATION; // 设置窗口方向为传感器自动旋转模式。
        try {
          windowClass.setPreferredOrientation(orientation, (err) => {
            if (err.code) {
              console.error(TAG, 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info(TAG, 'Succeeded in setting window orientation.');
          });
        } catch (exception) {
          console.error(TAG, 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
        }
        ;
      });
    }else if(judge==false){
      window.getLastWindow(getContext(), (err, data) => { // 获取window实例
        if (err.code) {
          console.error(TAG, 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          return;
        }
        let windowClass = data;
        console.info(TAG, 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        let names: Array<'status' | 'navigation'> = ['status', 'navigation'];
        windowClass.setWindowSystemBarEnable(names)
        windowClass.setWindowKeepScreenOn(false)
        let orientation = window.Orientation.UNSPECIFIED; // 设置窗口方向为传感器自动旋转模式。
        try {
          windowClass.setPreferredOrientation(orientation, (err) => {
            if (err.code) {
              console.error(TAG, 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info(TAG, 'Succeeded in setting window orientation.');
          });
        } catch (exception) {
          console.error(TAG, 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
        }
        ;
      });
    }
  } catch (exception) {
    console.error(TAG, 'judge' + JSON.stringify(exception));
  }//设置横屏显示
}