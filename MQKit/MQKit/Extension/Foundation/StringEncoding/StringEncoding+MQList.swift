//
//  StringEncoding+MQList.swift
//  MQKit
//
//  Created by M_Quadra on 2019/7/30.
//  Copyright © 2019 M_noAria. All rights reserved.
//

import Foundation

extension String.Encoding {
    
    public static var mq_allValues: [String.Encoding] {
        return [
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
        ]
    }
    
    public struct mq_CF {
        public static var allValues = CFStringEncodings.mq_AllValues
        
        public static let macJapanese = CFStringEncodings.macJapanese.mq_StringEncoding
        public static let macChineseTrad = CFStringEncodings.macChineseTrad.mq_StringEncoding
        public static let macKorean = CFStringEncodings.macKorean.mq_StringEncoding
        public static let macArabic = CFStringEncodings.macArabic.mq_StringEncoding
        public static let macHebrew = CFStringEncodings.macHebrew.mq_StringEncoding
        public static let macGreek = CFStringEncodings.macGreek.mq_StringEncoding
        public static let macCyrillic = CFStringEncodings.macCyrillic.mq_StringEncoding
        public static let macDevanagari = CFStringEncodings.macDevanagari.mq_StringEncoding
        public static let macGurmukhi = CFStringEncodings.macGurmukhi.mq_StringEncoding
        public static let macGujarati = CFStringEncodings.macGujarati.mq_StringEncoding
        public static let macOriya = CFStringEncodings.macOriya.mq_StringEncoding
        public static let macBengali = CFStringEncodings.macBengali.mq_StringEncoding
        public static let macTamil = CFStringEncodings.macTamil.mq_StringEncoding
        public static let macTelugu = CFStringEncodings.macTelugu.mq_StringEncoding
        public static let macKannada = CFStringEncodings.macKannada.mq_StringEncoding
        public static let macMalayalam = CFStringEncodings.macMalayalam.mq_StringEncoding
        public static let macSinhalese = CFStringEncodings.macSinhalese.mq_StringEncoding
        public static let macBurmese = CFStringEncodings.macBurmese.mq_StringEncoding
        public static let macKhmer = CFStringEncodings.macKhmer.mq_StringEncoding
        public static let macThai = CFStringEncodings.macThai.mq_StringEncoding
        public static let macLaotian = CFStringEncodings.macLaotian.mq_StringEncoding
        public static let macGeorgian = CFStringEncodings.macGeorgian.mq_StringEncoding
        public static let macArmenian = CFStringEncodings.macArmenian.mq_StringEncoding
        public static let macChineseSimp = CFStringEncodings.macChineseSimp.mq_StringEncoding
        public static let macTibetan = CFStringEncodings.macTibetan.mq_StringEncoding
        public static let macMongolian = CFStringEncodings.macMongolian.mq_StringEncoding
        public static let macEthiopic = CFStringEncodings.macEthiopic.mq_StringEncoding
        public static let macCentralEurRoman = CFStringEncodings.macCentralEurRoman.mq_StringEncoding
        public static let macVietnamese = CFStringEncodings.macVietnamese.mq_StringEncoding
        public static let macExtArabic = CFStringEncodings.macExtArabic.mq_StringEncoding
        public static let macSymbol = CFStringEncodings.macSymbol.mq_StringEncoding
        public static let macDingbats = CFStringEncodings.macDingbats.mq_StringEncoding
        public static let macTurkish = CFStringEncodings.macTurkish.mq_StringEncoding
        public static let macCroatian = CFStringEncodings.macCroatian.mq_StringEncoding
        public static let macIcelandic = CFStringEncodings.macIcelandic.mq_StringEncoding
        public static let macRomanian = CFStringEncodings.macRomanian.mq_StringEncoding
        public static let macCeltic = CFStringEncodings.macCeltic.mq_StringEncoding
        public static let macGaelic = CFStringEncodings.macGaelic.mq_StringEncoding
        public static let macFarsi = CFStringEncodings.macFarsi.mq_StringEncoding
        public static let macUkrainian = CFStringEncodings.macUkrainian.mq_StringEncoding
        public static let macInuit = CFStringEncodings.macInuit.mq_StringEncoding
        public static let macVT100 = CFStringEncodings.macVT100.mq_StringEncoding
        public static let macHFS = CFStringEncodings.macHFS.mq_StringEncoding

        public static let isoLatin2 = CFStringEncodings.isoLatin2.mq_StringEncoding
        public static let isoLatin3 = CFStringEncodings.isoLatin3.mq_StringEncoding
        public static let isoLatin4 = CFStringEncodings.isoLatin4.mq_StringEncoding
        public static let isoLatinCyrillic = CFStringEncodings.isoLatinCyrillic.mq_StringEncoding
        public static let isoLatinArabic = CFStringEncodings.isoLatinArabic.mq_StringEncoding
        public static let isoLatinGreek = CFStringEncodings.isoLatinGreek.mq_StringEncoding
        public static let isoLatinHebrew = CFStringEncodings.isoLatinHebrew.mq_StringEncoding
        public static let isoLatin5 = CFStringEncodings.isoLatin5.mq_StringEncoding
        public static let isoLatin6 = CFStringEncodings.isoLatin6.mq_StringEncoding
        public static let isoLatinThai = CFStringEncodings.isoLatinThai.mq_StringEncoding
        public static let isoLatin7 = CFStringEncodings.isoLatin7.mq_StringEncoding
        public static let isoLatin8 = CFStringEncodings.isoLatin8.mq_StringEncoding
        public static let isoLatin9 = CFStringEncodings.isoLatin9.mq_StringEncoding
        public static let isoLatin10 = CFStringEncodings.isoLatin10.mq_StringEncoding
        
        public static let dosLatinUS = CFStringEncodings.dosLatinUS.mq_StringEncoding
        public static let dosGreek = CFStringEncodings.dosGreek.mq_StringEncoding
        public static let dosBalticRim = CFStringEncodings.dosBalticRim.mq_StringEncoding
        public static let dosLatin1 = CFStringEncodings.dosLatin1.mq_StringEncoding
        public static let dosGreek1 = CFStringEncodings.dosGreek1.mq_StringEncoding
        public static let dosLatin2 = CFStringEncodings.dosLatin2.mq_StringEncoding
        public static let dosCyrillic = CFStringEncodings.dosCyrillic.mq_StringEncoding
        
        public static let dosTurkish = CFStringEncodings.dosTurkish.mq_StringEncoding
        public static let dosPortuguese = CFStringEncodings.dosPortuguese.mq_StringEncoding
        public static let dosIcelandic = CFStringEncodings.dosIcelandic.mq_StringEncoding
        public static let dosHebrew = CFStringEncodings.dosHebrew.mq_StringEncoding
        public static let dosCanadianFrench = CFStringEncodings.dosCanadianFrench.mq_StringEncoding
        public static let dosArabic = CFStringEncodings.dosArabic.mq_StringEncoding
        public static let dosNordic = CFStringEncodings.dosNordic.mq_StringEncoding
        public static let dosRussian = CFStringEncodings.dosRussian.mq_StringEncoding
        public static let dosGreek2 = CFStringEncodings.dosGreek2.mq_StringEncoding
        public static let dosThai = CFStringEncodings.dosThai.mq_StringEncoding
        public static let dosJapanese = CFStringEncodings.dosJapanese.mq_StringEncoding
        public static let dosChineseSimplif = CFStringEncodings.dosChineseSimplif.mq_StringEncoding
        public static let dosKorean = CFStringEncodings.dosKorean.mq_StringEncoding
        public static let dosChineseTrad = CFStringEncodings.dosChineseTrad.mq_StringEncoding
        
        public static let windowsLatin2 = CFStringEncodings.windowsLatin2.mq_StringEncoding
        public static let windowsCyrillic = CFStringEncodings.windowsCyrillic.mq_StringEncoding
        public static let windowsGreek = CFStringEncodings.windowsGreek.mq_StringEncoding
        public static let windowsLatin5 = CFStringEncodings.windowsLatin5.mq_StringEncoding
        public static let windowsHebrew = CFStringEncodings.windowsHebrew.mq_StringEncoding
        public static let windowsArabic = CFStringEncodings.windowsArabic.mq_StringEncoding
        public static let windowsBalticRim = CFStringEncodings.windowsBalticRim.mq_StringEncoding
        public static let windowsVietnamese = CFStringEncodings.windowsVietnamese.mq_StringEncoding
        public static let windowsKoreanJohab = CFStringEncodings.windowsKoreanJohab.mq_StringEncoding

        public static let ANSEL = CFStringEncodings.ANSEL.mq_StringEncoding
        
        public static let JIS_X0201_76 = CFStringEncodings.JIS_X0201_76.mq_StringEncoding
        public static let JIS_X0208_83 = CFStringEncodings.JIS_X0208_83.mq_StringEncoding
        public static let JIS_X0208_90 = CFStringEncodings.JIS_X0208_90.mq_StringEncoding
        public static let JIS_X0212_90 = CFStringEncodings.JIS_X0212_90.mq_StringEncoding
        public static let JIS_C6226_78 = CFStringEncodings.JIS_C6226_78.mq_StringEncoding
        
        public static let shiftJIS_X0213 = CFStringEncodings.shiftJIS_X0213.mq_StringEncoding
        public static let shiftJIS_X0213_MenKuTen = CFStringEncodings.shiftJIS_X0213_MenKuTen.mq_StringEncoding
        
        public static let GB_2312_80 = CFStringEncodings.GB_2312_80.mq_StringEncoding
        public static let GBK_95 = CFStringEncodings.GBK_95.mq_StringEncoding
        public static let GB_18030_2000 = CFStringEncodings.GB_18030_2000.mq_StringEncoding
        
        public static let KSC_5601_87 = CFStringEncodings.KSC_5601_87.mq_StringEncoding
        public static let ksc_5601_92_Johab = CFStringEncodings.ksc_5601_92_Johab.mq_StringEncoding
        public static let CNS_11643_92_P1 = CFStringEncodings.CNS_11643_92_P1.mq_StringEncoding
        public static let CNS_11643_92_P2 = CFStringEncodings.CNS_11643_92_P2.mq_StringEncoding
        public static let CNS_11643_92_P3 = CFStringEncodings.CNS_11643_92_P3.mq_StringEncoding

        public static let ISO_2022_JP = CFStringEncodings.ISO_2022_JP.mq_StringEncoding
        public static let ISO_2022_JP_2 = CFStringEncodings.ISO_2022_JP_2.mq_StringEncoding
        public static let ISO_2022_JP_1 = CFStringEncodings.ISO_2022_JP_1.mq_StringEncoding
        public static let ISO_2022_JP_3 = CFStringEncodings.ISO_2022_JP_3.mq_StringEncoding
        public static let ISO_2022_CN = CFStringEncodings.ISO_2022_CN.mq_StringEncoding
        public static let ISO_2022_CN_EXT = CFStringEncodings.ISO_2022_CN_EXT.mq_StringEncoding
        public static let ISO_2022_KR = CFStringEncodings.ISO_2022_KR.mq_StringEncoding
        
        public static let EUC_JP = CFStringEncodings.EUC_JP.mq_StringEncoding
        public static let EUC_CN = CFStringEncodings.EUC_CN.mq_StringEncoding
        public static let EUC_TW = CFStringEncodings.EUC_TW.mq_StringEncoding
        public static let EUC_KR = CFStringEncodings.EUC_KR.mq_StringEncoding
        
        public static let shiftJIS = CFStringEncodings.shiftJIS.mq_StringEncoding
        public static let KOI8_R = CFStringEncodings.KOI8_R.mq_StringEncoding
        public static let big5 = CFStringEncodings.big5.mq_StringEncoding
        public static let HZ_GB_2312 = CFStringEncodings.HZ_GB_2312.mq_StringEncoding
        public static let macRomanLatin1 = CFStringEncodings.macRomanLatin1.mq_StringEncoding
        public static let big5_HKSCS_1999 = CFStringEncodings.big5_HKSCS_1999.mq_StringEncoding
        public static let VISCII = CFStringEncodings.VISCII.mq_StringEncoding
        public static let KOI8_U = CFStringEncodings.KOI8_U.mq_StringEncoding
        public static let big5_E = CFStringEncodings.big5_E.mq_StringEncoding

        public static let nextStepJapanese = CFStringEncodings.nextStepJapanese.mq_StringEncoding
        
        public static let EBCDIC_US = CFStringEncodings.EBCDIC_US.mq_StringEncoding
        public static let EBCDIC_CP037 = CFStringEncodings.EBCDIC_CP037.mq_StringEncoding
        
        public static let UTF7 = CFStringEncodings.UTF7.mq_StringEncoding
        public static let UTF7_IMAP = CFStringEncodings.UTF7_IMAP.mq_StringEncoding
        
        public static let shiftJIS_X0213_00 = CFStringEncodings.shiftJIS_X0213_00.mq_StringEncoding
    }
}
