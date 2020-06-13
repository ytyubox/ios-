#  ios核心動畫高級技巧

## 1. 圖層樹

```swift
let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200)) 
```
這邊初始化一個圖層 layerView, 並設定其座標是(x: 0, y: 0, width: 200, height: 200)
x, y座標將會是對應其superView

```swift 
layerView.center = view.center 
```

```swift 
view.addSubview(layerView)
```
這邊做layerView的layout更新。把layerView放在整個View的中間,以兩方的centerPoint為參考點。最後把layerView放入View的subView中


```swift 
blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
```

```swift 
blueLayer.backgroundColor = UIColor.blue.cgColor
```
這邊初始化另一個圖層 blueLayer，設定其座標是(x: 50, y: 50, width: 100, height: 100)
x, y座標將會是對應其superView

```swift 
layerView.layer.addSublayer(blueLayer)
```
最後把blueLayer放入layerView的subView中

小總結：
在View和Layer的使用上面，主要的決定因素是使用者是否要與其做互動。View適合做動態方法，例如：點選、上下拖拉、左右滑動...
Layer適合做靜態方法和進行單純的畫面呈現，例如：圓角設定、陰影等等。

## 2.寄宿圖

```swift 
private func setIndexTo1() {
       layerView = Self.makeNewlayer()
       layerView.layer.contents = image.cgImage
   }
```
在imageView.layer.contents的屬性是id, 所以即使把 ``` image.cgImage```寫成image也不會報錯。因為contents可以接受任何的賦值，但是若不是```.cgImage```屬性的話，在實例上，將會是空白畫面。

```swift
       layerView.contentMode = .scaleAspectFit
```
```swift
layerView.layer.contentsGravity = .resizeAspect
```

這邊的```layerView.contentMode```是調整layerView圖片的延展方式。```.scaleAspectFit```是讓圖片在“維持等比例”的情形下，延展至其極限。
```layerView.layer.contentsGravity``` 的default value是 ```.resizeAspect```，根據Apple官方文件，其效果就如同```layerView.contentMode```的```.scaleAspectFit```。

```swift
layerView.layer.contentsGravity = .center
```

這邊```layerView.layer.contentsGravity = .center```的center不是我們想的center，而是設定圖層比例的一種方式，實際上就是調整圖層的```CGRect```，default value是```(x: 0, y: 0) , (width: 1.0, height: 1.0)```，其x與 y和寬與高代表應該是圖層和其superView的相對比例，而非實際位置。

 參照Apple 官方文件：https://developer.apple.com/documentation/quartzcore/calayer/1410740-contentscenter

```swift
layerView.layer.masksToBounds = true
```
```masksToBounds``` 的default value為false
(即為UIView還是會顯示超過邊界的任何子圖層)，但是當設定為true的時候，UIView會選擇不顯示其邊界外的任何圖層。

``` swift
layer.contentsRect = rect
```

layer.contentsRect不是按照點來計算，而是按照相對值來計算(整張圖片圖片是1，然後用比例0.3、0.5去決定顯示的區域)。 舉例來說： ```layer.contentsRect = CGRect(x: 0.3, y: 0.7, width: 0.5, height: 0.5)``` ，而假設layer實際大小是```400 x 400 的圖層```。 實際的呈現起來會像是Corp原圖層```CGRect(x: 120, y: 280, width: 200, height: 200```的樣子。 

