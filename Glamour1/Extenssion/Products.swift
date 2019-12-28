// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productss = try Productss(json)

import Foundation

// MARK: - Productss
class Productss: Codable {
    let id: Int?
    let brand, name, price, priceSign: String?
    let currency: String?
    let imageLink: String?
    let productLink, websiteLink: String?
    let productssDescription, category, productType: String?
    let tagList: [String]?
    let createdAt, updatedAt: String?
    let productAPIURL: String?
    let apiFeaturedImage: String?
    let productColors: [ProductColor]?

    enum CodingKeys: String, CodingKey {
        case id, brand, name, price
        case priceSign = "price_sign"
        case currency
        case imageLink = "image_link"
        case productLink = "product_link"
        case websiteLink = "website_link"
        case productssDescription = "description"
        case category
        case productType = "product_type"
        case tagList = "tag_list"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case productAPIURL = "product_api_url"
        case apiFeaturedImage = "api_featured_image"
        case productColors = "product_colors"
    }

    init(id: Int?, brand: String?, name: String?, price: String?, priceSign: String?, currency: String?, imageLink: String?, productLink: String?, websiteLink: String?, productssDescription: String?, category: String?, productType: String?, tagList: [String]?, createdAt: String?, updatedAt: String?, productAPIURL: String?, apiFeaturedImage: String?, productColors: [ProductColor]?) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.priceSign = priceSign
        self.currency = currency
        self.imageLink = imageLink
        self.productLink = productLink
        self.websiteLink = websiteLink
        self.productssDescription = productssDescription
        self.category = category
        self.productType = productType
        self.tagList = tagList
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.productAPIURL = productAPIURL
        self.apiFeaturedImage = apiFeaturedImage
        self.productColors = productColors
    }
}

// MARK: Productss convenience initializers and mutators

extension Productss {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Productss.self, from: data)
        self.init(id: me.id, brand: me.brand, name: me.name, price: me.price, priceSign: me.priceSign, currency: me.currency, imageLink: me.imageLink, productLink: me.productLink, websiteLink: me.websiteLink, productssDescription: me.productssDescription, category: me.category, productType: me.productType, tagList: me.tagList, createdAt: me.createdAt, updatedAt: me.updatedAt, productAPIURL: me.productAPIURL, apiFeaturedImage: me.apiFeaturedImage, productColors: me.productColors)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        brand: String?? = nil,
        name: String?? = nil,
        price: String?? = nil,
        priceSign: String?? = nil,
        currency: String?? = nil,
        imageLink: String?? = nil,
        productLink: String?? = nil,
        websiteLink: String?? = nil,
        productssDescription: String?? = nil,
        category: String?? = nil,
        productType: String?? = nil,
        tagList: [String]?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        productAPIURL: String?? = nil,
        apiFeaturedImage: String?? = nil,
        productColors: [ProductColor]?? = nil
    ) -> Productss {
        return Productss(
            id: id ?? self.id,
            brand: brand ?? self.brand,
            name: name ?? self.name,
            price: price ?? self.price,
            priceSign: priceSign ?? self.priceSign,
            currency: currency ?? self.currency,
            imageLink: imageLink ?? self.imageLink,
            productLink: productLink ?? self.productLink,
            websiteLink: websiteLink ?? self.websiteLink,
            productssDescription: productssDescription ?? self.productssDescription,
            category: category ?? self.category,
            productType: productType ?? self.productType,
            tagList: tagList ?? self.tagList,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            productAPIURL: productAPIURL ?? self.productAPIURL,
            apiFeaturedImage: apiFeaturedImage ?? self.apiFeaturedImage,
            productColors: productColors ?? self.productColors
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ProductColor
class ProductColor: Codable {
    let hexValue, colourName: String?

    enum CodingKeys: String, CodingKey {
        case hexValue = "hex_value"
        case colourName = "colour_name"
    }

    init(hexValue: String?, colourName: String?) {
        self.hexValue = hexValue
        self.colourName = colourName
    }
}

// MARK: ProductColor convenience initializers and mutators

extension ProductColor {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ProductColor.self, from: data)
        self.init(hexValue: me.hexValue, colourName: me.colourName)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        hexValue: String?? = nil,
        colourName: String?? = nil
    ) -> ProductColor {
        return ProductColor(
            hexValue: hexValue ?? self.hexValue,
            colourName: colourName ?? self.colourName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
//
