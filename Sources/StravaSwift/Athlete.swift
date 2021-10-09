//
//  Athelete.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
  Athletes are Strava users, Strava users are athletes. The object is returned in detailed, summary or meta representations.
 **/
public final class Athlete: Strava {
    public let id: Int?
    public let resourceState: ResourceState?
    public let firstname: String?
    public let lastname: String?
    public let profileMedium: URL?
    public let profile: URL?
    public let city: String?
    public let state: String?
    public let country: String?
    public let sex: Sex?
    public let friend: FollowingStatus?
    public let follower: FollowingStatus?
    public let premium:Bool?
    public let createdAt: Date?
    public let updatedAt: Date?
    public let friendCount: Int?
    public let followerCount: Int?
    public let mutualFriendCount: Int?
    public let datePreference: String?
    public let measurementPreference: Units?
    public let email: String?
    public let FTP: Int?
    public let weight: Double?
    public let clubs: [Club]?
    public let bikes: [Bike]?
    public let shoes: [Shoe]?

    /**
     Initializer

     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        resourceState = json["resource_state"].strava(ResourceState.self)
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        profileMedium = URL(optionalString: json["profile_medium"].string)
        profile = URL(optionalString: json["profile"].string)
        firstname = json["firstname"].string
        lastname = json["lastname"].string
        sex = json["sex"].strava(Sex.self)
        friend = json["friend"].strava(FollowingStatus.self)
        follower = json["follower"].strava(FollowingStatus.self)
        premium = json["premium"].bool
        createdAt = json["created_at"].string?.toDate()
        updatedAt = json["updated_at"].string?.toDate()
        followerCount = json["follower_count"].int
        friendCount = json["friend_count"].int
        mutualFriendCount = json["mutual_friend_count"].int
        datePreference = json["date_preference"].string
        measurementPreference = json["measurement_preference"].strava(Units.self)
        email = json["email"].string
        FTP = json["ftp"].int
        weight = json["weight"].double
        clubs = json["clubs"].strava(Club.self)
        bikes = json["bikes"].strava(Bike.self)
        shoes = json["shoes"].strava(Shoe.self)
    }
}

/* work in progress
extension Athlete : Codable {
    enum CodeKeys: CodingKey
    {
        case id
        case resourceState
        case firstname
        case lastname
        case profileMedium
        case profile
        case city
        case state
        case country
        case sex
        case friend
        case follower
        case premium
        case createdAt
        case updatedAt
        case friendCount
        case followerCount
        case mutualFriendCount
        case datePreference
        case measurementPreference
        case email
        case FTP
        case weight
        case clubs
        case bikes
        case shoes
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodeKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(resourceState?.rawValue ?? 1, forKey: .resourceState)
        try container.encode(firstname, forKey: .firstname)
        try container.encode(lastname, forKey: .lastname)
        try container.encode(profileMedium, forKey: .profileMedium)
        try container.encode(profile, forKey: .profile)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
        try container.encode(sex?.rawValue ?? "M", forKey: .sex)
        try container.encode(friend?.rawValue ?? "Pending", forKey: .friend)
        
        try container.encode(follower, forKey: .id)
        try container.encode(premium, forKey: .id)
        try container.encode(createdAt, forKey: .id)
        try container.encode(updatedAt, forKey: .id)
        try container.encode(friendCount, forKey: .id)
        try container.encode(followerCount, forKey: .id)
        try container.encode(mutualFriendCount, forKey: .id)
        try container.encode(datePreference, forKey: .id)
        try container.encode(measurementPreference, forKey: .id)
        try container.encode(email, forKey: .id)
        try container.encode(FTP, forKey: .id)
        try container.encode(weight, forKey: .id)
        try container.encode(clubs, forKey: .id)
        try container.encode(bikes, forKey: .id)
        try container.encode(shoes, forKey: .id)
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodeKeys.self)
        //self.accessToken = try container.decode(String.self, forKey: .accessToken)
        
        
    }
    
}
*/
