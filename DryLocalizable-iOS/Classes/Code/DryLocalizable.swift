//
//  DryLocalizable.swift
//  DryLocalizable
//
//  Created by Ruiying Duan on 2019/4/23.
//

import UIKit

//MARK: - 本地化配置
public class DryLocalizable: NSObject {

    /// 当前选择的语言(DryLocalizableLanguage)
    private var currentLanguage: DryLocalizableLanguage = .en
    /// lproj 所在的 Bundle
    private var bundle: Bundle = Bundle.main
    /// 本地化文件名称(默认: Localizable)
    private var tableName: String = "Localizable"
    
    /// 单例
    private static let instance: DryLocalizable = DryLocalizable()
    @discardableResult
    static func shared() -> DryLocalizable {
        return instance
    }
    
    /// 构造
    private override init() {}
    
    /// 析构
    deinit {}
}

//MARK: - 语言设置
extension DryLocalizable {
    
    /// @说明 设置本地化语言类型
    /// @参数 language:   本地化语言类型
    /// @参数 tableName:  本地化语言文件名称(默认: Localizable)
    /// @返回 void
    public static func setLanguage(_ language: DryLocalizableLanguage, tableName: String = "Localizable") {
        
        /// 保存当前语言
        DryLocalizable.shared().currentLanguage = language
        
        /// 初始化 lproj
        var lproj: String = "Base"
        
        /// 语言跟随系统，获取 lproj 名称
        if language == .follow {
            
            /// 获取系统语言名称("en", "zh-Hans", ...)中的第一个
            var systemLanguage: String = ""
            let appleLanguages: Any? = UserDefaults.standard.value(forKey: "AppleLanguages")
            if appleLanguages != nil && appleLanguages is [String] {
                
                let languages: [String] = appleLanguages as! [String]
                if !languages.isEmpty {
                    systemLanguage = languages[0]
                }
            }
            
            /// 根据系统语言配置 lproj 名称
            if systemLanguage.contains("en") {
                lproj = DryLocalizableLanguage.en.lproj
            }else if systemLanguage.contains("Hans-CN") {
                lproj = DryLocalizableLanguage.zh_Hans.lproj
            }else if systemLanguage.contains("Hant-CN") {
                lproj = DryLocalizableLanguage.zh_Hans.lproj
            }else if systemLanguage.contains("HK") {
                lproj = DryLocalizableLanguage.zh_Hant_KH.lproj
            }else if systemLanguage.contains("TW") {
                lproj = DryLocalizableLanguage.zh_Hant_TW.lproj
            }else if systemLanguage.contains("fr") {
                lproj = DryLocalizableLanguage.fr.lproj
            }else if systemLanguage.contains("de") {
                lproj = DryLocalizableLanguage.de.lproj
            }else if systemLanguage.contains("it") {
                lproj = DryLocalizableLanguage.it.lproj
            }else if systemLanguage.contains("ja") {
                lproj = DryLocalizableLanguage.ja.lproj
            }else if systemLanguage.contains("ko") {
                lproj = DryLocalizableLanguage.ko.lproj
            }else if systemLanguage.contains("pt") {
                lproj = DryLocalizableLanguage.pt_PT.lproj
            }else if systemLanguage.contains("ru") {
                lproj = DryLocalizableLanguage.ru.lproj
            }else if systemLanguage.contains("es") {
                lproj = DryLocalizableLanguage.es.lproj
            }else if systemLanguage.contains("nl") {
                lproj = DryLocalizableLanguage.nl.lproj
            }else if systemLanguage.contains("th") {
                lproj = DryLocalizableLanguage.th.lproj
            }else if systemLanguage.contains("ar") {
                lproj = DryLocalizableLanguage.ar.lproj
            }
            
        }else {
         
            /// 语言非跟随系统，获取 lproj 名称
            lproj = language.lproj
        }
        
        /// 获取 lproj 所在的 Bundle
        if let path = Bundle.main.path(forResource: lproj, ofType: nil) {
            DryLocalizable.shared().bundle = Bundle.init(path: path)!
        }
        
        /// 本地化语言文件名称(如默认系统的: Localizable.strings 文件的名称 Localizable)
        DryLocalizable.shared().tableName = tableName
    }
    
    /// @说明 获取本地化语言类型
    /// @返回 DryLocalizableLanguage
    @discardableResult
    public static func currentLanguage() -> DryLocalizableLanguage {
        return DryLocalizable.shared().currentLanguage
    }
    
    /// @说明 获取对应的本地化语言，如果没有对应本地化文件则直接返回Key
    /// @参数 key:    本地化语言对应的Key值
    /// @返回 String
    @discardableResult
    public static func localizedString(withKey key: String) -> String {
        
        /// 检查数据
        if key.isEmpty {
            return key
        }
        
        /// 获取并返回对应的本地化语言
        let bundle: Bundle = DryLocalizable.shared().bundle
        let tableName: String = DryLocalizable.shared().tableName
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value:"", comment: "")
    }
}
