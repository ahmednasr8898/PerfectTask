
import Foundation

struct LoginSuccessModel : Codable {
	
    let _id : String?
	let updatedAt : String?
	let createdAt : String?
	let fullname : String?
	let email : String?
	let mobile : String?
	let password : String?
	let countryID : String?
	let language : String?
	let createBy : String?
	let __v : Int?
	let userKey : String?
	let codeVerfiy : Int?
	let historyType : Int?
	let status : Int?
	let userBalance : Int?
	let gender : Int?
	let subscripeType : Int?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case updatedAt = "updatedAt"
		case createdAt = "createdAt"
		case fullname = "fullname"
		case email = "email"
		case mobile = "mobile"
		case password = "password"
		case countryID = "countryID"
		case language = "language"
		case createBy = "createBy"
		case __v = "__v"
		case userKey = "userKey"
		case codeVerfiy = "codeVerfiy"
		case historyType = "historyType"
		case status = "status"
		case userBalance = "userBalance"
		case gender = "gender"
		case subscripeType = "subscripeType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		fullname = try values.decodeIfPresent(String.self, forKey: .fullname)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		countryID = try values.decodeIfPresent(String.self, forKey: .countryID)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		createBy = try values.decodeIfPresent(String.self, forKey: .createBy)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		userKey = try values.decodeIfPresent(String.self, forKey: .userKey)
		codeVerfiy = try values.decodeIfPresent(Int.self, forKey: .codeVerfiy)
		historyType = try values.decodeIfPresent(Int.self, forKey: .historyType)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		userBalance = try values.decodeIfPresent(Int.self, forKey: .userBalance)
		gender = try values.decodeIfPresent(Int.self, forKey: .gender)
		subscripeType = try values.decodeIfPresent(Int.self, forKey: .subscripeType)
	}

}
