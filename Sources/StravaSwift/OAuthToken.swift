//
//  OAuthToken.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
OAuthToken which is required for requesting Strava resources
 **/
public struct OAuthToken: Strava {

    /** The access token **/
    public let accessToken: String?

    /** The refresh token **/
    public let refreshToken: String?

    /** Expiry for the token in seconds since the epoch **/
    public let expiresAt : Int?

    /** The athlete **/
    public let athlete: Athlete?

    /**
     Initializers

     - Parameter json: A SwiftyJSON object
     **/
    public init(_ json: JSON) {
        accessToken = json["access_token"].string
        refreshToken = json["refresh_token"].string
        expiresAt = json["expires_at"].int
        athlete = Athlete(json["athlete"])
    }

    public init(access: String?, refresh: String?, expiry: Int?) {
        self.accessToken = access
        self.refreshToken = refresh
        self.expiresAt = expiry
        self.athlete = nil
    }

}

// this is INCOMPLETE (athlete not persisted because of Codable conformance
extension OAuthToken : Codable {
    /*  accessToken: String?
        refreshToken: String?
        expiresAt : Int?
        athlete: Athlete?
     */

    enum CodeKeys: CodingKey
    {
        case accessToken
        case refreshToken
        case expiresAt
        case athlete
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(accessToken, forKey: .accessToken)
        try container.encode(refreshToken, forKey: .refreshToken)
        try container.encode(expiresAt, forKey: .expiresAt)
        //try container.encode(athlete, forKey: .athlete)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodeKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        self.expiresAt = try container.decode(Int.self, forKey: .expiresAt)
        //self.athlete = try container.decode(Athlete.self, forKey: .athlete)
        self.athlete = nil
    }
    
}
