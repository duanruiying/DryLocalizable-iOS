# DryLocalizable-iOS
iOS: 国际化动态切换

## Prerequisites
* iOS 10.0+
* Swift 5.0+

## Installation
* pod 'DryLocalizable-iOS'

## Features
1. 在xcode配置语言对应的lproj文件(请配置 Base.lproj)
```
英语(en.lproj)
简体中文(zh-Hans.lproj)
繁体中文(zh-Hant.lproj)
繁体中文(香港)(zh-HK.lproj)
繁体中文(台湾)(zh-Hant-TW.lproj)
法语(fr.lproj)
德语(de.lproj)
意大利语(it.lproj)
日语(ja.lproj)
韩语(ko.lproj)
葡萄牙语(葡萄牙)(pt-PT.lproj)
俄语(ru.lproj)
西班牙语(西班牙)(es.lproj)
荷兰语(nl.lproj)
泰语(th.lproj)
阿拉伯语(ar-001.lproj)
```
2. 设置(切换)本地化语言类型
```
DryLocalizable.setLanguage(.follow)
```
3. 根据语言key获取语言value
```
let value: String = DryLocalizable.localizedString(withKey: "key")
```
