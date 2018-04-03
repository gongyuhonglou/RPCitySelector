# RPCitySelector

*	几行代码即可将集三级城市选择、定位、搜索和字母索引于一身的城市选择器集成到你的项目中，极其简单轻便！


### RPCitySelector使用方法：

*  将Demo中的**RPCityViewController**文件夹拖到你的项目中。

*  引入头文件

```
#import "RPCityViewController.h"
```

*  实例化**RPCityViewController**
*  遵循**RPCityViewControllerDelegate**
*  实现代理方法

```
- (void)cityName:(NSString *)name;
```

*  修改Info.plist文件

	1、获取定位权限：
	
	```
	Privacy - Location Always Usage Description        类型为	String

	Privacy - Location When In Use Usage Description   类型为	String
	```

	2、本地化（搜索按钮的英文变成中文）：
	
	```
	将Localization native development region   value值改成China
	```

