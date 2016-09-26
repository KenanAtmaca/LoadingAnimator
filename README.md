# LoadingAnimator
İOS 10 LoadingAnimator Class (Swift 3)

```Swift
enum style {
    
    case Box
    case Triangle
    case Oval
    
}
```
- You select three diffrent style animation in class.

# Oval
![alt tag](https://cloud.githubusercontent.com/assets/16580898/18854173/57ac0236-8452-11e6-869f-f9d013d0f759.png)

# Box
![alt tag](https://cloud.githubusercontent.com/assets/16580898/18854191/75187f2a-8452-11e6-82e0-6dd7d171cff2.png)

# Triangle
![alt tag](https://cloud.githubusercontent.com/assets/16580898/18854208/89e3228e-8452-11e6-8b10-b94edde2a371.png)

- Soft,Beautiful,Easy animation styles.

```Swift
var animator:LoadingAnimator!
animator = LoadingAnimator(duration: 1.5, animateStyle: .Oval, view: self.view)
```
- Start animation

```Swift
animator.startAnimation()
```
- Stop animation

```Swift
animator.stopAnimation()
```
