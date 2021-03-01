
import Foundation

struct LoginFailedModel : Codable {
	
    let message : String?

	enum CodingKeys: String, CodingKey {

		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
