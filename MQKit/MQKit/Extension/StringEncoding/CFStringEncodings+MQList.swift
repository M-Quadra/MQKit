//
//  CFStringEncodings+MQList.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/29.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

// order by CFStringEncodings case
extension CFStringEncodings {
    
    static var mq_AllValues: [CFStringEncodings] {
        let mac = mq_mac_AllValues
        let iso = mq_isoLatin_AllValues
        let dos = mq_dos_AllValues
        let win = mq_windows_AllValues
        let jis = mq_JIS_AllValues
        let cns = mq_CNS_11643_92_AllValues
        let iso_2022 = mq_ISO_2022_AllValues
        let euc = mq_EUC_AllValues
        
        return mac + iso + dos + win + [
            .ANSEL,
            ] + jis + [
                .shiftJIS_X0213,
                .shiftJIS_X0213_MenKuTen,
                .GB_2312_80,
                .GBK_95,
                .GB_18030_2000,
                .KSC_5601_87,
                .ksc_5601_92_Johab,
            ] + cns + iso_2022 + euc + [
                .shiftJIS,
                .KOI8_R,
                .big5,
                .macRomanLatin1,
                .HZ_GB_2312,
                .big5_HKSCS_1999,
                .VISCII,
                .KOI8_U,
                .big5_E,
                .nextStepJapanese,
                .nextStepJapanese,
                .EBCDIC_US,
                .EBCDIC_CP037,
                .UTF7,
                .UTF7_IMAP,
        ]
    }
    
    static var mq_mac_AllValues: [CFStringEncodings] {
        return [
            .macJapanese,
            .macChineseTrad,
            .macKorean,
            .macArabic,
            .macHebrew,
            .macGreek,
            .macCyrillic,
            .macDevanagari,
            .macGurmukhi,
            .macGujarati,
            .macOriya,
            .macBengali,
            .macTamil,
            .macTelugu,
            .macKannada,
            .macMalayalam,
            .macSinhalese,
            .macBurmese,
            .macKhmer,
            .macThai,
            .macLaotian,
            .macGeorgian,
            .macArmenian,
            .macChineseSimp,
            .macTibetan,
            .macMongolian,
            .macEthiopic,
            .macCentralEurRoman,
            .macVietnamese,
            .macExtArabic,
            .macSymbol,
            .macDingbats,
            .macTurkish,
            .macCroatian,
            .macIcelandic,
            .macRomanian,
            .macCeltic,
            .macGaelic,
            .macFarsi,
            .macUkrainian,
            .macInuit,
            .macVT100,
            .macHFS,
        ]
    }
    
    /// ISO 8-bit and 7-bit encodings begin at 0x200
    static var mq_isoLatin_AllValues: [CFStringEncodings] {
        return [
            .isoLatin2,
            .isoLatin3,
            .isoLatin4,
            .isoLatinCyrillic,
            .isoLatinArabic,
            .isoLatinGreek,
            .isoLatinHebrew,
            .isoLatin5,
            .isoLatin6,
            .isoLatinThai,
            .isoLatin7,
            .isoLatin8,
            .isoLatin9,
            .isoLatin10,
        ]
    }
    
    static var mq_dos_AllValues: [CFStringEncodings] {
        return [
            .dosLatinUS,
            .dosGreek,
            .dosBalticRim,
            .dosLatin1,
            .dosGreek1,
            .dosLatin2,
            .dosCyrillic,
            .dosTurkish,
            .dosPortuguese,
            .dosIcelandic,
            .dosHebrew,
            .dosCanadianFrench,
            .dosArabic,
            .dosNordic,
            .dosRussian,
            .dosGreek2,
            .dosThai,
            .dosJapanese,
            .dosChineseSimplif,
            .dosKorean,
            .dosChineseTrad,
        ]
    }
    
    static var mq_windows_AllValues: [CFStringEncodings] {
        return [
            .windowsLatin2,
            .windowsCyrillic,
            .windowsGreek,
            .windowsLatin5,
            .windowsHebrew,
            .windowsArabic,
            .windowsBalticRim,
            .windowsVietnamese,
            .windowsKoreanJohab,
        ]
    }
    
    static var mq_JIS_AllValues: [CFStringEncodings] {
        return [
            .JIS_X0201_76,
            .JIS_X0208_83,
            .JIS_X0208_90,
            .JIS_X0212_90,
            .JIS_C6226_78,
        ]
    }
    
    static var mq_CNS_11643_92_AllValues: [CFStringEncodings] {
        return [
            .CNS_11643_92_P1,
            .CNS_11643_92_P2,
            .CNS_11643_92_P3,
        ]
    }
    
    static var mq_ISO_2022_AllValues: [CFStringEncodings] {
        return [
            .ISO_2022_JP,
            .ISO_2022_JP_2,
            .ISO_2022_JP_1,
            .ISO_2022_JP_3,
            .ISO_2022_CN,
            .ISO_2022_CN_EXT,
            .ISO_2022_KR,
        ]
    }
    
    static var mq_EUC_AllValues: [CFStringEncodings] {
        return [
            .EUC_JP,
            .EUC_CN,
            .EUC_TW,
            .EUC_KR,
        ]
    }
}
