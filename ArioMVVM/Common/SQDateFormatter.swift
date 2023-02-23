//
//  SQDateFormatter.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation

public enum SQDateFormatter {
    case yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ssZZZZ
    case dd_MMMM_yyyy
    case MMMM_yyyy
    case yyyy_dash_MM_dash_dd_HH_colon_mm_colon_ss
    case hh_colon_mm_a
    case HH_colon_mm
    case MM_slash_dd_slash_yy
    case MM_slash_dd_slash_yyyy
    case dd_MMMM
    case EEEE_comma_dd_MMMM_yyyy
    case dd_MMM
    case dd
    case MMMM
    case dd_MMM_yyyy_HH_colon_mm_colon_ss
    case dd_MMM_yyyy_comma_HH_colon_mm
    case EEEE_comma_dd_MMM_yyyy_HH_colon_mm
    case dd_dash_MMM
    case yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ss_dot_SSSZ
    case EEEE
    case dd_MMM_comma_hh_colon_mm_a
    case dd_MMM_yyyy_dash_HH_colon_mm_a
    case dd_slash_MM_slash_yyyy
    case HH_colon_mm_colon_ss_dash_HH_colon_mm_colon_ss
    case HH_colon_mm_dash_HH_colon_mm
    case dd_MMM_comma_hh_dot_mm
    case dd_MMM_comma_HH_dot_mm_
    case HH_dot_mm_
    case dd_dash_MM_dash_yyyy
    case EEEE_comma_dd_MMM_yyyy
    case dd_MMM_yyyy_HH_dot_mm
    case yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ssZ
    case HH_colon_mm_colon_ss
    case yyyy_dash_MM_dash_dd_HH_colon_mm
    case dd_MMM_yyyy
    case dd_dash_MMM_dash_yyyy_HH_colon_mm
    case EEEE_comma_dd_MMM_yyyy_comma_Pukul_HH_colon_mm
    case dd_slash_MM_slash_yyyy_HH_colon_mm
    case yyyy_dash_MM_dash_dd
    case dd_MMMM_yyyy_HH_colon_mm_WIB
    case d_MMM
    case EEEE_comma_dd_MMM_yyyy_comma_HH_dot_mm
    case EEEE_comma_dd_MMMM_yyyy_HH_colon_mm_WIB
    case MMM_dd_comma_yyyy
    case dd_MM_yyyy_HH_colon_ss
    
    public func formatter() -> DateFormatter {
        switch self {
        case .yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ssZZZZ: //2023-02-15T03:00:19Z
            return indonesianLocalFormatter(string: "yyyy-MM-dd'T'HH:mm:ssZZZZ") 
        case .yyyy_dash_MM_dash_dd_HH_colon_mm_colon_ss://2019-08-09 10:10:10
            return indonesianLocalFormatter(string: "yyyy-MM-dd HH:mm:ss")
        case .dd_MMMM_yyyy:
            return indonesianLocalFormatter(string: "dd MMMM yyyy")
        case .MMMM_yyyy:
            return indonesianLocalFormatter(string: "MMMM yyyy")
        case .hh_colon_mm_a:
            return indonesianLocalFormatter(string: "hh:mm a")
        case .MM_slash_dd_slash_yy:
            return indonesianLocalFormatter(string: "MM/dd/yy")
        case .MM_slash_dd_slash_yyyy:
            return indonesianLocalFormatter(string: "MM/dd/yyyy")
        case .HH_colon_mm:
            return indonesianLocalFormatter(string: "HH:mm")
        case .dd_MMMM:
            return indonesianLocalFormatter(string: "dd MMMM")
        case .EEEE_comma_dd_MMMM_yyyy:
            return indonesianLocalFormatter(string: "EEEE, dd MMMM yyyy")
        case .dd_MMM:
            return indonesianLocalFormatter(string: "dd MMM")
        case .dd:
            return indonesianLocalFormatter(string: "dd")
        case .MMMM:
            return indonesianLocalFormatter(string: "MMMM")
        case .dd_MMM_yyyy_HH_colon_mm_colon_ss:
            return indonesianLocalFormatter(string: "dd MMM yyyy HH:mm:ss")
        case .dd_MMM_yyyy_comma_HH_colon_mm:
            return indonesianLocalFormatter(string: "dd MMM yyyy, HH:mm")
        case .EEEE_comma_dd_MMM_yyyy_HH_colon_mm:
            return indonesianLocalFormatter(string: "EEEE, dd MMM yyyy HH:mm")
        case .dd_dash_MMM:
            return indonesianLocalFormatter(string: "dd-MMM")
        case .yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ss_dot_SSSZ:
            return indonesianLocalFormatter(string: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        case .EEEE:
            return indonesianLocalFormatter(string: "EEEE")
        case .dd_MMM_comma_hh_colon_mm_a:
            return indonesianLocalFormatter(string: "dd MMM, hh:mm a")
        case .dd_MMM_yyyy_dash_HH_colon_mm_a:
            return indonesianLocalFormatter(string: "dd MMM yyyy - HH:mm a")
        case .dd_slash_MM_slash_yyyy:
            return indonesianLocalFormatter(string: "dd/MM/yyyy")
        case .HH_colon_mm_colon_ss_dash_HH_colon_mm_colon_ss:
            return indonesianLocalFormatter(string: "HH:mm:ss - HH:mm:ss")
        case .HH_colon_mm_dash_HH_colon_mm:
            return indonesianLocalFormatter(string: "HH:mm - HH:mm")
        case .dd_MMM_comma_hh_dot_mm:
            return indonesianLocalFormatter(string: "dd MMM, hh.mm")
        case .dd_MMM_comma_HH_dot_mm_:
            return indonesianLocalFormatter(string: "dd MMM, HH.mm ")
        case .HH_dot_mm_:
            return indonesianLocalFormatter(string: "HH.mm ")
        case .dd_dash_MM_dash_yyyy:
            return indonesianLocalFormatter(string: "dd-MM-yyyy")
        case .EEEE_comma_dd_MMM_yyyy:
            return indonesianLocalFormatter(string: "EEEE, dd MMM yyyy")
        case .dd_MMM_yyyy_HH_dot_mm:
            return indonesianLocalFormatter(string: "dd MMM yyyy HH.mm")
        case .yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ssZ:
            return indonesianLocalFormatter(string: "yyyy-MM-dd'T'HH:mm:ssZ")
        case .HH_colon_mm_colon_ss:
            return indonesianLocalFormatter(string: "HH:mm:ss")
        case .yyyy_dash_MM_dash_dd_HH_colon_mm:
            return indonesianLocalFormatter(string: "yyyy-MM-dd HH:mm")
        case .dd_MMM_yyyy:
            return indonesianLocalFormatter(string: "dd MMM yyyy")
        case .dd_dash_MMM_dash_yyyy_HH_colon_mm:
            return indonesianLocalFormatter(string: "dd-MM-yyyy HH:mm")
        case .EEEE_comma_dd_MMM_yyyy_comma_Pukul_HH_colon_mm:
            return indonesianLocalFormatter(string: "EEEE, dd MMM yyyy, 'Pukul' HH:mm")
        case .dd_slash_MM_slash_yyyy_HH_colon_mm:
            return indonesianLocalFormatter(string: "dd/MM/yyyy HH:mm")
        case .yyyy_dash_MM_dash_dd:
            return indonesianLocalFormatter(string: "yyyy-MM-dd")
        case .dd_MMMM_yyyy_HH_colon_mm_WIB:
            return indonesianLocalFormatter(string: "dd MMMM yyyy HH:mm 'WIB'")
        case .d_MMM:
            return indonesianLocalFormatter(string: "d MMM")
        case .EEEE_comma_dd_MMM_yyyy_comma_HH_dot_mm:
            return indonesianLocalFormatter(string: "EEEE, dd MMM yyyy, HH.mm")
        case .EEEE_comma_dd_MMMM_yyyy_HH_colon_mm_WIB:
            return indonesianLocalFormatter(string: "EEEE, dd MMMM yyyy HH:mm 'WIB'")
        case .MMM_dd_comma_yyyy:
            return indonesianLocalFormatter(string: "MMM dd, yyyy")
        case .dd_MM_yyyy_HH_colon_ss:
            return indonesianLocalFormatter(string: "dd-MM-yyyy HH:ss")
        }
    }
    
    private func indonesianLocalFormatter(string: String) -> DateFormatter {
        let localFormatter = DateFormatter.dataFormatter(string)
        localFormatter.locale = Locale(identifier: "ID")
        return localFormatter
    }
    
    public func stringFromDate(_ date: Date) -> String {
        return self.formatter().string(from: date)
    }
    
    public func dateFromString(_ string: String) -> Date? {
        return self.formatter().date(from: string)
    }
}

extension DateFormatter {
    @nonobjc static var standardDateFormatter: DateFormatter = {
        let dateFormatter = Foundation.DateFormatter()
        return dateFormatter
    }()

    static func dataFormatter(_ format: String) -> DateFormatter {
        let dateFormatter = standardDateFormatter
        dateFormatter.dateFormat = format
        return dateFormatter
    }
}
