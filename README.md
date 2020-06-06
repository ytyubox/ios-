#  ios核心動畫高級技巧

## 1. 圖層樹

```     let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200)) ```
這邊初始化一個圖層 layerView, 並設定其座標是(x: 0, y: 0, width: 200, height: 200)
x, y座標將會是對應其superView

``` layerView.center = view.center ```
```view.addSubview(layerView)```
這邊做layerView的layout更新。把layerView放在整個View的中間,以兩方的centerPoint為參考點。最後把layerView放入View的subView中


```blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)```
```blueLayer.backgroundColor = UIColor.blue.cgColor```
這邊初始化另一個圖層 blueLayer，設定其座標是(x: 50, y: 50, width: 100, height: 100)
x, y座標將會是對應其superView

```layerView.layer.addSublayer(blueLayer)```
最後把blueLayer放入layerView的subView中

小總結：
在View和Layer的使用上面，主要的決定因素是使用者是否要與其做互動。View適合做動態方法，例如：點選、上下拖拉、左右滑動...
Layer適合做靜態方法和進行單純的畫面呈現，例如：圓角設定、陰影等等。

```let chapters:[UIViewController]  = [ViewController_ch1()] ```

這邊做ViewController的實例化並放入Array之中，可以讓下面的tableView delegate的 didSelectRowAt好做許多。

如下：
```navigationController?.pushViewController(chapters[indexPath.row], animated: true) ```
這樣若以後有很多cell要傳到不同的ViewController，就只需要把View Controller實例化放入Array就行了
