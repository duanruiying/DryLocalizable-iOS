//
//  DryLocalizableLanguage.swift
//  DryLocalizable
//
//  Created by Ruiying Duan on 2019/4/24.
//

//MARK: - 语言类型
public enum DryLocalizableLanguage {
    
    /// 跟随系统语言
    case follow
    /// 英语
    case en
    /// 简体中文
    case zh_Hans
    /// 繁体中文
    case zh_Hant
    /// 繁体中文(香港特别行政区)
    case zh_Hant_KH
    /// 繁体中文(中国台湾省)
    case zh_Hant_TW
    /// 法语
    case fr
    /// 德语
    case de
    /// 意大利语
    case it
    /// 日语
    case ja
    /// 韩语
    case ko
    /// 葡萄牙语
    case pt_PT
    /// 俄语
    case ru
    /// 西班牙语
    case es
    /// 荷兰语
    case nl
    /// 泰语
    case th
    /// 阿拉伯语
    case ar
    
    /// lproj 名称
    var lproj: String {
        
        get {
            
            switch self {
            case .follow:
                return ""
            case .en:
                return "en.lproj"
            case .zh_Hans:
                return "zh-Hans.lproj"
            case .zh_Hant:
                return "zh-Hant.lproj"
            case .zh_Hant_KH:
                return "zh-HK.lproj"
            case .zh_Hant_TW:
                return "zh-Hant-TW.lproj"
            case .fr:
                return "fr.lproj"
            case .de:
                return "de.lproj"
            case .it:
                return "it.lproj"
            case .ja:
                return "ja.lproj"
            case .ko:
                return "ko.lproj"
            case .pt_PT:
                return "pt-PT.lproj"
            case .ru:
                return "ru.lproj"
            case .es:
                return "es.lproj"
            case .nl:
                return "nl.lproj"
            case .th:
                return "th.lproj"
            case .ar:
                return "ar-001.lproj"
            }
        }
    }
}
