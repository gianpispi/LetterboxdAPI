//
//  File.swift
//  
//
//  Created by Gianpiero Spinelli on 01/10/21.
//

import Foundation

public struct FilmAvailability: Decodable {
    public enum Country: String, Decodable {
        case AIA = "AIA"
        case ARE = "ARE"
        case ARG = "ARG"
        case ARM = "ARM"
        case ATG = "ATG"
        case AUS = "AUS"
        case AUT = "AUT"
        case AZE = "AZE"
        case BEL = "BEL"
        case BFA = "BFA"
        case BGR = "BGR"
        case BHR = "BHR"
        case BHS = "BHS"
        case BLR = "BLR"
        case BLZ = "BLZ"
        case BMU = "BMU"
        case BOL = "BOL"
        case BRA = "BRA"
        case BRB = "BRB"
        case BRN = "BRN"
        case BWA = "BWA"
        case CAN = "CAN"
        case CHE = "CHE"
        case CHL = "CHL"
        case CHN = "CHN"
        case COL = "COL"
        case CPV = "CPV"
        case CRI = "CRI"
        case CYM = "CYM"
        case CYP = "CYP"
        case CZE = "CZE"
        case DEU = "DEU"
        case DMA = "DMA"
        case DNK = "DNK"
        case DOM = "DOM"
        case ECU = "ECU"
        case EGY = "EGY"
        case ESP = "ESP"
        case EST = "EST"
        case FIN = "FIN"
        case FJI = "FJI"
        case FRA = "FRA"
        case FSM = "FSM"
        case GBR = "GBR"
        case GHA = "GHA"
        case GMB = "GMB"
        case GNB = "GNB"
        case GRC = "GRC"
        case GRD = "GRD"
        case GTM = "GTM"
        case HKG = "HKG"
        case HND = "HND"
        case HUN = "HUN"
        case IDN = "IDN"
        case IND = "IND"
        case IRL = "IRL"
        case ISR = "ISR"
        case ITA = "ITA"
        case JOR = "JOR"
        case JPN = "JPN"
        case KAZ = "KAZ"
        case KEN = "KEN"
        case KGZ = "KGZ"
        case KHM = "KHM"
        case KNA = "KNA"
        case KOR = "KOR"
        case LAO = "LAO"
        case LBN = "LBN"
        case LKA = "LKA"
        case LTU = "LTU"
        case LUX = "LUX"
        case LVA = "LVA"
        case MAC = "MAC"
        case MDA = "MDA"
        case MEX = "MEX"
        case MLT = "MLT"
        case MNG = "MNG"
        case MOZ = "MOZ"
        case MUS = "MUS"
        case MYS = "MYS"
        case NAM = "NAM"
        case NER = "NER"
        case NGA = "NGA"
        case NIC = "NIC"
        case NLD = "NLD"
        case NOR = "NOR"
        case NPL = "NPL"
        case NZL = "NZL"
        case OMN = "OMN"
        case PAN = "PAN"
        case PER = "PER"
        case PHL = "PHL"
        case PNG = "PNG"
        case POL = "POL"
        case PRT = "PRT"
        case PRY = "PRY"
        case QAT = "QAT"
        case ROU = "ROU"
        case RUS = "RUS"
        case SAU = "SAU"
        case SGP = "SGP"
        case SLV = "SLV"
        case SVK = "SVK"
        case SVN = "SVN"
        case SWE = "SWE"
        case SWZ = "SWZ"
        case THA = "THA"
        case TJK = "TJK"
        case TKM = "TKM"
        case TTO = "TTO"
        case TUR = "TUR"
        case TWN = "TWN"
        case UGA = "UGA"
        case UKR = "UKR"
        case USA = "USA"
        case UZB = "UZB"
        case VEN = "VEN"
        case VGB = "VGB"
        case VNM = "VNM"
        case ZAF = "ZAF"
        case ZWE = "ZWE"
    }
    
    /// The name of the service.
    public var displayName: String
    
    /// The URL of the thumbnail image for the service.
    public var icon: String
    
    /// The regional store for the service. Not all countries are supported on all services.
    public var country: Country
    
    /// The unique ID (if any) for the film on this service.
    public var id: String?
    
    /// The URL for the film on this service.
    public var url: String
    
    /// The types of the availability, possible options included buy, rent and stream
    public var types: [String]
}
