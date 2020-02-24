//
//  SearchConstants.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

enum SchemaNodeConstants {
    static let baseUrl = "https://itunes.apple.com/"
    static let endPoint = "search"
    enum params {
        static let term = "term"
    }
    static let sampleData = """
{
  "title": "Auto Claim - Vehicle Accident",
  "type": "object",
  "properties": {
    "vehicle": {
      "type": "number",
      "title": "Select Vehicle",
      "_data": {
        "href": "/vehicles",
        "enum": "id",
        "enumNames": [
          "vehicle_make",
          "vehicle_model"
        ]
      }
    },
    "driver_information": {
      "type": "object",
      "properties": {
        "description": {
          "type": "string"
        },
        "date_time_of_accident": {
          "title": "Date and Time of Accident",
          "type": "object",
          "properties": {
            "date": {
              "title": "Date of Accident",
              "type": "string",
              "format": "date"
            },
            "time": {
              "title": "Time of Accident",
              "type": "string",
              "format": "time"
            }
          },
          "required": [
            "date",
            "time"
          ]
        },
        "location_of_accident": {
          "type": "string",
          "format": "map_lat_long"
        },
        "description_of_accident": {
          "type": "string",
          "format": "textarea"
        },
        "were_you_driving": {
          "type": "string",
          "enum": [
            "Yes",
            "No"
          ]
        },
        "who_was_driving": {
          "type": "string"
        },
        "your_damage_photos": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "photo": {
                "type": "string",
                "format": "photo"
              }
            }
          }
        }
      },
      "required": [
        "description_of_accident",
        "were_you_driving",
        "date_time_of_accident"
      ],
      "oneOf": [
        {
          "properties": {
            "were_you_driving": {
              "enum": [
                "Yes"
              ]
            }
          }
        },
        {
          "properties": {
            "were_you_driving": {
              "enum": [
                "No"
              ]
            }
          },
          "required": [
            "who_was_driving"
          ]
        }
      ]
    },
    "other_driver_information": {
      "type": "object",
      "properties": {
        "other_driver_information": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "document_photos": {
                "description": "Photos of other driver's documentation",
                "type": "object",
                "properties": {
                  "pink_card": {
                    "type": "string",
                    "format": "photo"
                  },
                  "drivers_license": {
                    "type": "string",
                    "format": "photo"
                  },
                  "license_plate": {
                    "type": "string",
                    "format": "photo"
                  },
                  "registration": {
                    "type": "string",
                    "format": "photo"
                  }
                }
              },
              "document_details": {
                "description": "Other driver's information if no photos taken",
                "type": "object",
                "properties": {
                  "first_name": {
                    "type": "string"
                  },
                  "last_name": {
                    "type": "string"
                  },
                  "address": {
                    "type": "string"
                  },
                  "city": {
                    "type": "string"
                  },
                  "province": {
                    "type": "string"
                  },
                  "postal_code": {
                    "type": "string"
                  },
                  "home_phone_number": {
                    "type": "string",
                    "format": "tel"
                  },
                  "cell_phone_number": {
                    "type": "string",
                    "format": "tel"
                  },
                  "email": {
                    "type": "string",
                    "format": "email"
                  },
                  "drivers_license_number": {
                    "type": "string"
                  },
                  "license_plate": {
                    "type": "string"
                  },
                  "other_drivers_car": {
                    "title": "Other Drivers Car",
                    "type": "object",
                    "properties": {
                      "year": {
                        "type": "string"
                      },
                      "make": {
                        "type": "string"
                      },
                      "model": {
                        "type": "string"
                      }
                    }
                  },
                  "policy_number": {
                    "type": "string"
                  },
                  "insurance_company": {
                    "type": "string"
                  }
                }
              }
            }
          }
        }
      }
    },
    "witness_information": {
      "type": "object",
      "properties": {
        "witnesses": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "name": {
                "type": "string"
              },
              "email": {
                "type": "string",
                "format": "email"
              },
              "home_phone_number": {
                "type": "string",
                "format": "tel"
              },
              "cell_phone_number": {
                "type": "string",
                "format": "tel"
              }
            }
          }
        }
      }
    }
  },
  "required": [
    "vehicle"
  ]
}
"""
    enum SchemaKeywords {
        static let TYPE = "type"
        static let ENUM = "enum"
        static let FORMAT = "format"
        static let CONST = "const"
        static let PROPERTIES = "properties"
    }
    
    enum SchemaType {
        static let NUMBER = "number"
        static let STRING = "string"
        static let BOOLEAN = "boolean"
        static let OBJECT = "object"
        static let ARRAY = "array"
    }
    
    enum StringFormats {
        static let DATETIME = "datetime"
        static let PHOTO = "photo"
        static let MAPLOCATION = "map_lat_long"
        static let DATE = "date"
        static let TIME = "time"
        static let EMAIL = "email"
        static let PHONE = "tel"
    }
}

