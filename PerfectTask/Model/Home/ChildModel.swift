
import Foundation

struct ChildModel : Codable {
	let _id : String?
	let updatedAt : String?
	let createdAt : String?
	let firstname : String?
	let surname : String?
	let childAgeID : String?
	let gender : Int?
	let imgPath : String?
	let userID : String?
	let __v : Int?
	let historyType : Int?
	let rate : Int?
	let status : Int?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case updatedAt = "updatedAt"
		case createdAt = "createdAt"
		case firstname = "firstname"
		case surname = "surname"
		case childAgeID = "childAgeID"
		case gender = "gender"
		case imgPath = "imgPath"
		case userID = "userID"
		case __v = "__v"
		case historyType = "historyType"
		case rate = "rate"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
		surname = try values.decodeIfPresent(String.self, forKey: .surname)
		childAgeID = try values.decodeIfPresent(String.self, forKey: .childAgeID)
		gender = try values.decodeIfPresent(Int.self, forKey: .gender)
		imgPath = try values.decodeIfPresent(String.self, forKey: .imgPath)
		userID = try values.decodeIfPresent(String.self, forKey: .userID)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		historyType = try values.decodeIfPresent(Int.self, forKey: .historyType)
		rate = try values.decodeIfPresent(Int.self, forKey: .rate)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
	}

}
