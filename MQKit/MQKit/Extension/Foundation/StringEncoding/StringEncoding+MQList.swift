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
    
    public static let mq_macJapanese = CFStringEncodings.macJapanese.mq_StringEncoding
    public static let mq_macChineseTrad = CFStringEncodings.macChineseTrad.mq_StringEncoding
    public static let mq_macKorean = CFStringEncodings.macKorean.mq_StringEncoding
    public static let mq_macArabic = CFStringEncodings.macArabic.mq_StringEncoding
    public static let mq_macHebrew = CFStringEncodings.macHebrew.mq_StringEncoding
    public static let mq_macGreek = CFStringEncodings.macGreek.mq_StringEncoding
    public static let mq_macCyrillic = CFStringEncodings.macCyrillic.mq_StringEncoding
    public static let mq_macDevanagari = CFStringEncodings.macDevanagari.mq_StringEncoding
    public static let mq_macGurmukhi = CFStringEncodings.macGurmukhi.mq_StringEncoding
    public static let mq_macGujarati = CFStringEncodings.macGujarati.mq_StringEncoding
    public static let mq_macOriya = CFStringEncodings.macOriya.mq_StringEncoding
    public static let mq_macBengali = CFStringEncodings.macBengali.mq_StringEncoding
    public static let mq_macTamil = CFStringEncodings.macTamil.mq_StringEncoding
    public static let mq_macTelugu = CFStringEncodings.macTelugu.mq_StringEncoding
    public static let mq_macKannada = CFStringEncodings.macKannada.mq_StringEncoding
    public static let mq_macMalayalam = CFStringEncodings.macMalayalam.mq_StringEncoding
    public static let mq_macSinhalese = CFStringEncodings.macSinhalese.mq_StringEncoding
    public static let mq_macBurmese = CFStringEncodings.macBurmese.mq_StringEncoding
    public static let mq_macKhmer = CFStringEncodings.macKhmer.mq_StringEncoding
    public static let mq_macThai = CFStringEncodings.macThai.mq_StringEncoding
    public static let mq_macLaotian = CFStringEncodings.macLaotian.mq_StringEncoding
    public static let mq_macGeorgian = CFStringEncodings.macGeorgian.mq_StringEncoding
    public static let mq_macArmenian = CFStringEncodings.macArmenian.mq_StringEncoding
    public static let mq_macChineseSimp = CFStringEncodings.macChineseSimp.mq_StringEncoding
    public static let mq_macTibetan = CFStringEncodings.macTibetan.mq_StringEncoding
    public static let mq_macMongolian = CFStringEncodings.macMongolian.mq_StringEncoding
    public static let mq_macEthiopic = CFStringEncodings.macEthiopic.mq_StringEncoding
    public static let mq_macCentralEurRoman = CFStringEncodings.macCentralEurRoman.mq_StringEncoding
    public static let mq_macVietnamese = CFStringEncodings.macVietnamese.mq_StringEncoding
    public static let mq_macExtArabic = CFStringEncodings.macExtArabic.mq_StringEncoding
    public static let mq_macSymbol = CFStringEncodings.macSymbol.mq_StringEncoding
    public static let mq_macDingbats = CFStringEncodings.macDingbats.mq_StringEncoding
    public static let mq_macTurkish = CFStringEncodings.macTurkish.mq_StringEncoding
    public static let mq_macCroatian = CFStringEncodings.macCroatian.mq_StringEncoding
    public static let mq_macIcelandic = CFStringEncodings.macIcelandic.mq_StringEncoding
    public static let mq_macRomanian = CFStringEncodings.macRomanian.mq_StringEncoding
    public static let mq_macCeltic = CFStringEncodings.macCeltic.mq_StringEncoding
    public static let mq_macGaelic = CFStringEncodings.macGaelic.mq_StringEncoding
    public static let mq_macFarsi = CFStringEncodings.macFarsi.mq_StringEncoding
    public static let mq_macUkrainian = CFStringEncodings.macUkrainian.mq_StringEncoding
    public static let mq_macInuit = CFStringEncodings.macInuit.mq_StringEncoding
    public static let mq_macVT100 = CFStringEncodings.macVT100.mq_StringEncoding
    public static let mq_macHFS = CFStringEncodings.macHFS.mq_StringEncoding

    public static let mq_isoLatin2 = CFStringEncodings.isoLatin2.mq_StringEncoding
    public static let mq_isoLatin3 = CFStringEncodings.isoLatin3.mq_StringEncoding
    public static let mq_isoLatin4 = CFStringEncodings.isoLatin4.mq_StringEncoding
    public static let mq_isoLatinCyrillic = CFStringEncodings.isoLatinCyrillic.mq_StringEncoding
    public static let mq_isoLatinArabic = CFStringEncodings.isoLatinArabic.mq_StringEncoding
    public static let mq_isoLatinGreek = CFStringEncodings.isoLatinGreek.mq_StringEncoding
    public static let mq_isoLatinHebrew = CFStringEncodings.isoLatinHebrew.mq_StringEncoding
    public static let mq_isoLatin5 = CFStringEncodings.isoLatin5.mq_StringEncoding
    public static let mq_isoLatin6 = CFStringEncodings.isoLatin6.mq_StringEncoding
    public static let mq_isoLatinThai = CFStringEncodings.isoLatinThai.mq_StringEncoding
    public static let mq_isoLatin7 = CFStringEncodings.isoLatin7.mq_StringEncoding
    public static let mq_isoLatin8 = CFStringEncodings.isoLatin8.mq_StringEncoding
    public static let mq_isoLatin9 = CFStringEncodings.isoLatin9.mq_StringEncoding
    public static let mq_isoLatin10 = CFStringEncodings.isoLatin10.mq_StringEncoding
    
    public static let mq_dosLatinUS = CFStringEncodings.dosLatinUS.mq_StringEncoding
    public static let mq_dosGreek = CFStringEncodings.dosGreek.mq_StringEncoding
    public static let mq_dosBalticRim = CFStringEncodings.dosBalticRim.mq_StringEncoding
    public static let mq_dosLatin1 = CFStringEncodings.dosLatin1.mq_StringEncoding
    public static let mq_dosGreek1 = CFStringEncodings.dosGreek1.mq_StringEncoding
    public static let mq_dosLatin2 = CFStringEncodings.dosLatin2.mq_StringEncoding
    public static let mq_dosCyrillic = CFStringEncodings.dosCyrillic.mq_StringEncoding
    
    public static let mq_dosTurkish = CFStringEncodings.dosTurkish.mq_StringEncoding
    public static let mq_dosPortuguese = CFStringEncodings.dosPortuguese.mq_StringEncoding
    public static let mq_dosIcelandic = CFStringEncodings.dosIcelandic.mq_StringEncoding
    public static let mq_dosHebrew = CFStringEncodings.dosHebrew.mq_StringEncoding
    public static let mq_dosCanadianFrench = CFStringEncodings.dosCanadianFrench.mq_StringEncoding
    public static let mq_dosArabic = CFStringEncodings.dosArabic.mq_StringEncoding
    public static let mq_dosNordic = CFStringEncodings.dosNordic.mq_StringEncoding
    public static let mq_dosRussian = CFStringEncodings.dosRussian.mq_StringEncoding
    public static let mq_dosGreek2 = CFStringEncodings.dosGreek2.mq_StringEncoding
    public static let mq_dosThai = CFStringEncodings.dosThai.mq_StringEncoding
    public static let mq_dosJapanese = CFStringEncodings.dosJapanese.mq_StringEncoding
    public static let mq_dosChineseSimplif = CFStringEncodings.dosChineseSimplif.mq_StringEncoding
    public static let mq_dosKorean = CFStringEncodings.dosKorean.mq_StringEncoding
    public static let mq_dosChineseTrad = CFStringEncodings.dosChineseTrad.mq_StringEncoding
    
    public static let mq_windowsLatin2 = CFStringEncodings.windowsLatin2.mq_StringEncoding
    public static let mq_windowsCyrillic = CFStringEncodings.windowsCyrillic.mq_StringEncoding
    public static let mq_windowsGreek = CFStringEncodings.windowsGreek.mq_StringEncoding
    public static let mq_windowsLatin5 = CFStringEncodings.windowsLatin5.mq_StringEncoding
    public static let mq_windowsHebrew = CFStringEncodings.windowsHebrew.mq_StringEncoding
    public static let mq_windowsArabic = CFStringEncodings.windowsArabic.mq_StringEncoding
    public static let mq_windowsBalticRim = CFStringEncodings.windowsBalticRim.mq_StringEncoding
    public static let mq_windowsVietnamese = CFStringEncodings.windowsVietnamese.mq_StringEncoding
    public static let mq_windowsKoreanJohab = CFStringEncodings.windowsKoreanJohab.mq_StringEncoding

    public static let mq_ANSEL = CFStringEncodings.ANSEL.mq_StringEncoding
    
    public static let mq_JIS_X0201_76 = CFStringEncodings.JIS_X0201_76.mq_StringEncoding
    public static let mq_JIS_X0208_83 = CFStringEncodings.JIS_X0208_83.mq_StringEncoding
    public static let mq_JIS_X0208_90 = CFStringEncodings.JIS_X0208_90.mq_StringEncoding
    public static let mq_JIS_X0212_90 = CFStringEncodings.JIS_X0212_90.mq_StringEncoding
    public static let mq_JIS_C6226_78 = CFStringEncodings.JIS_C6226_78.mq_StringEncoding
    
    public static let mq_shiftJIS_X0213 = CFStringEncodings.shiftJIS_X0213.mq_StringEncoding
    public static let mq_shiftJIS_X0213_MenKuTen = CFStringEncodings.shiftJIS_X0213_MenKuTen.mq_StringEncoding
    
    public static let mq_GB_2312_80 = CFStringEncodings.GB_2312_80.mq_StringEncoding
    public static let mq_GBK_95 = CFStringEncodings.GBK_95.mq_StringEncoding
    public static let mq_GB_18030_2000 = CFStringEncodings.GB_18030_2000.mq_StringEncoding
    
    public static let mq_KSC_5601_87 = CFStringEncodings.KSC_5601_87.mq_StringEncoding
    public static let mq_ksc_5601_92_Johab = CFStringEncodings.ksc_5601_92_Johab.mq_StringEncoding
    public static let mq_CNS_11643_92_P1 = CFStringEncodings.CNS_11643_92_P1.mq_StringEncoding
    public static let mq_CNS_11643_92_P2 = CFStringEncodings.CNS_11643_92_P2.mq_StringEncoding
    public static let mq_CNS_11643_92_P3 = CFStringEncodings.CNS_11643_92_P3.mq_StringEncoding

    public static let mq_ISO_2022_JP = CFStringEncodings.ISO_2022_JP.mq_StringEncoding
    public static let mq_ISO_2022_JP_2 = CFStringEncodings.ISO_2022_JP_2.mq_StringEncoding
    public static let mq_ISO_2022_JP_1 = CFStringEncodings.ISO_2022_JP_1.mq_StringEncoding
    public static let mq_ISO_2022_JP_3 = CFStringEncodings.ISO_2022_JP_3.mq_StringEncoding
    public static let mq_ISO_2022_CN = CFStringEncodings.ISO_2022_CN.mq_StringEncoding
    public static let mq_ISO_2022_CN_EXT = CFStringEncodings.ISO_2022_CN_EXT.mq_StringEncoding
    public static let mq_ISO_2022_KR = CFStringEncodings.ISO_2022_KR.mq_StringEncoding
    
    public static let mq_EUC_JP = CFStringEncodings.EUC_JP.mq_StringEncoding
    public static let mq_EUC_CN = CFStringEncodings.EUC_CN.mq_StringEncoding
    public static let mq_EUC_TW = CFStringEncodings.EUC_TW.mq_StringEncoding
    public static let mq_EUC_KR = CFStringEncodings.EUC_KR.mq_StringEncoding
    
    public static let mq_shiftJIS = CFStringEncodings.shiftJIS.mq_StringEncoding
    public static let mq_KOI8_R = CFStringEncodings.KOI8_R.mq_StringEncoding
    public static let mq_big5 = CFStringEncodings.big5.mq_StringEncoding
    public static let mq_HZ_GB_2312 = CFStringEncodings.HZ_GB_2312.mq_StringEncoding
    public static let mq_macRomanLatin1 = CFStringEncodings.macRomanLatin1.mq_StringEncoding
    public static let mq_big5_HKSCS_1999 = CFStringEncodings.big5_HKSCS_1999.mq_StringEncoding
    public static let mq_VISCII = CFStringEncodings.VISCII.mq_StringEncoding
    public static let mq_KOI8_U = CFStringEncodings.KOI8_U.mq_StringEncoding
    public static let mq_big5_E = CFStringEncodings.big5_E.mq_StringEncoding

    public static let mq_nextStepJapanese = CFStringEncodings.nextStepJapanese.mq_StringEncoding
    
    public static let mq_EBCDIC_US = CFStringEncodings.EBCDIC_US.mq_StringEncoding
    public static let mq_EBCDIC_CP037 = CFStringEncodings.EBCDIC_CP037.mq_StringEncoding
    
    public static let mq_UTF7 = CFStringEncodings.UTF7.mq_StringEncoding
    public static let mq_UTF7_IMAP = CFStringEncodings.UTF7_IMAP.mq_StringEncoding
    
    public static let mq_shiftJIS_X0213_00 = CFStringEncodings.shiftJIS_X0213_00.mq_StringEncoding
}
