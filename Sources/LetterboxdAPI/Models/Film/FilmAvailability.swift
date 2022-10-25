//
//  File.swift
//
//
//  Created by Gianpiero Spinelli on 01/10/21.
//

import Foundation

public struct FilmAvailability: Decodable {
    public enum Country: String, Decodable {
        case AIA
        case ARE
        case ARG
        case ARM
        case ATG
        case AUS
        case AUT
        case AZE
        case BEL
        case BFA
        case BGR
        case BHR
        case BHS
        case BLR
        case BLZ
        case BMU
        case BOL
        case BRA
        case BRB
        case BRN
        case BWA
        case CAN
        case CHE
        case CHL
        case CHN
        case COL
        case CPV
        case CRI
        case CYM
        case CYP
        case CZE
        case DEU
        case DMA
        case DNK
        case DOM
        case ECU
        case EGY
        case ESP
        case EST
        case FIN
        case FJI
        case FRA
        case FSM
        case GBR
        case GHA
        case GMB
        case GNB
        case GRC
        case GRD
        case GTM
        case HKG
        case HND
        case HUN
        case IDN
        case IND
        case IRL
        case ISR
        case ITA
        case JOR
        case JPN
        case KAZ
        case KEN
        case KGZ
        case KHM
        case KNA
        case KOR
        case LAO
        case LBN
        case LKA
        case LTU
        case LUX
        case LVA
        case MAC
        case MDA
        case MEX
        case MLT
        case MNG
        case MOZ
        case MUS
        case MYS
        case NAM
        case NER
        case NGA
        case NIC
        case NLD
        case NOR
        case NPL
        case NZL
        case OMN
        case PAN
        case PER
        case PHL
        case PNG
        case POL
        case PRT
        case PRY
        case QAT
        case ROU
        case RUS
        case SAU
        case SGP
        case SLV
        case SVK
        case SVN
        case SWE
        case SWZ
        case THA
        case TJK
        case TKM
        case TTO
        case TUR
        case TWN
        case UGA
        case UKR
        case USA
        case UZB
        case VEN
        case VGB
        case VNM
        case ZAF
        case ZWE
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
