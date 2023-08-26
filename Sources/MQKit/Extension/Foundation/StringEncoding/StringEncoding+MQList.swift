//
//  StringEncoding+MQList.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

public extension String.Encoding {
    
    static var allValues: [String.Encoding] {
        return [
// MARK: - Origin
            .ascii,
            .nextstep,
            .japaneseEUC,
            .utf8,
            .isoLatin1,
            .symbol,
            .nonLossyASCII,
            .shiftJIS,
            .isoLatin2,
            .unicode,
            .windowsCP1251,
            .windowsCP1252,
            .windowsCP1253,
            .windowsCP1254,
            .windowsCP1250,
            .iso2022JP,
            .macOSRoman,
            .utf16,
            .utf16BigEndian,
            .utf16LittleEndian,
            .utf32,
            .utf32BigEndian,
            .utf32LittleEndian,
            
// MARK: - Extension
// skip encoding witch can' t "".data(using: .e)
            .macJapanese,
            .macChineseTrad,
            .macKorean,
            .macArabic,
            .macHebrew,
            .macGreek,
            .macCyrillic,
            .macThai,
            .macChineseSimp,
            .macCentralEurRoman,
            .macSymbol,
            .macDingbats,
            .macTurkish,
            .macCroatian,
            .macIcelandic,
            .macRomanian,
            .macUkrainian,
            
//            .isoLatin2,
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
         
            .windowsLatin2,
            .windowsCyrillic,
            .windowsGreek,
            .windowsLatin5,
            .windowsHebrew,
            .windowsArabic,
            .windowsBalticRim,
            .windowsVietnamese,
            
            .GB_18030_2000,
            
            .ISO_2022_JP,
            .ISO_2022_JP_2,
            .ISO_2022_JP_1,
            .ISO_2022_CN,
            .ISO_2022_CN_EXT,
            .ISO_2022_KR,
         
            .EUC_JP,
            .EUC_CN,
            .EUC_TW,
            .EUC_KR,
            
            .KOI8_R,
            .big5,
            .HZ_GB_2312,
            .macRomanLatin1,
            .big5_HKSCS_1999,
            .KOI8_U,
            
            .EBCDIC_CP037,
            
            .UTF7,
            .UTF7_IMAP,
        ]
    }

//    static let ANSEL = CFStringEncodings.ANSEL.stringEncoding
    
//    static let JIS_X0201_76 = CFStringEncodings.JIS_X0201_76.stringEncoding
//    static let JIS_X0208_83 = CFStringEncodings.JIS_X0208_83.stringEncoding
//    static let JIS_X0208_90 = CFStringEncodings.JIS_X0208_90.stringEncoding
//    static let JIS_X0212_90 = CFStringEncodings.JIS_X0212_90.stringEncoding
//    static let JIS_C6226_78 = CFStringEncodings.JIS_C6226_78.stringEncoding
    
//    static let shiftJIS_X0213 = CFStringEncodings.shiftJIS_X0213.stringEncoding
//    static let shiftJIS_X0213_MenKuTen = CFStringEncodings.shiftJIS_X0213_MenKuTen.stringEncoding
    
//    static let GB_2312_80 = CFStringEncodings.GB_2312_80.stringEncoding
//    static let GBK_95 = CFStringEncodings.GBK_95.stringEncoding
    static let GB_18030_2000 = CFStringEncodings.GB_18030_2000.stringEncoding
    
//    static let KSC_5601_87 = CFStringEncodings.KSC_5601_87.stringEncoding
//    static let ksc_5601_92_Johab = CFStringEncodings.ksc_5601_92_Johab.stringEncoding
//    static let CNS_11643_92_P1 = CFStringEncodings.CNS_11643_92_P1.stringEncoding
//    static let CNS_11643_92_P2 = CFStringEncodings.CNS_11643_92_P2.stringEncoding
//    static let CNS_11643_92_P3 = CFStringEncodings.CNS_11643_92_P3.stringEncoding
    
//    static let shiftJIS = CFStringEncodings.shiftJIS.stringEncoding
    static let KOI8_R = CFStringEncodings.KOI8_R.stringEncoding
    static let big5 = CFStringEncodings.big5.stringEncoding
    static let HZ_GB_2312 = CFStringEncodings.HZ_GB_2312.stringEncoding
    static let macRomanLatin1 = CFStringEncodings.macRomanLatin1.stringEncoding
    static let big5_HKSCS_1999 = CFStringEncodings.big5_HKSCS_1999.stringEncoding
//    static let VISCII = CFStringEncodings.VISCII.stringEncoding
    static let KOI8_U = CFStringEncodings.KOI8_U.stringEncoding
//    static let big5_E = CFStringEncodings.big5_E.stringEncoding

//    static let nextStepJapanese = CFStringEncodings.nextStepJapanese.stringEncoding
    
//    static let EBCDIC_US = CFStringEncodings.EBCDIC_US.stringEncoding
    static let EBCDIC_CP037 = CFStringEncodings.EBCDIC_CP037.stringEncoding
    
    static let UTF7 = CFStringEncodings.UTF7.stringEncoding
    static let UTF7_IMAP = CFStringEncodings.UTF7_IMAP.stringEncoding
    
//    static let shiftJIS_X0213_00 = CFStringEncodings.shiftJIS_X0213_00.stringEncoding
}
