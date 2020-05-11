//
//  SearchConstants.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

enum SchemaNodeConstants {
    static let baseUrl = "https://tm-api-2.trufla.dev"
    static let endPoint = "search"
    //"https://trumobile.trufla.dev/"
    
    enum params {
        static let term = "term"
    }
    static let sampleData = """
{
    "title": "Auto Claim - Vehicle Accident",
    "type": "object",
    "display_order": 1,
    "properties": {
        "vehicle": {
            "type": "number",
            "display_order": 1,
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
            "display_order": 2,
            "properties": {
                "description": {
                    "type": "string",
                    "display_order": 1
                },
                "date_time_of_accident": {
                    "title": "Date and Time of Accident",
                    "type": "object",
                    "display_order": 2,
                    "properties": {
                        "date": {
                            "title": "Date of Accident",
                            "type": "string",
                            "display_order": 1,
                            "format": "date"
                        },
                        "time": {
                            "title": "Time of Accident",
                            "type": "string",
                            "display_order": 2,
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
                    "display_order": 3,
                    "format": "map_lat_long"
                },
                "description_of_accident": {
                    "type": "string",
                    "display_order": 4,
                    "format": "textarea"
                },
                "were_you_driving": {
                    "type": "string",
                    "display_order": 5,
                    "enum": [
                        "Yes",
                        "No"
                    ]
                },
                "who_was_driving": {
                    "type": "string",
                    "display_order": 6
                },
                "your_damage_photos": {
                    "type": "array",
                    "display_order": 7,
                    "items": {
                        "type": "object",
                        "display_order": 1,
                        "properties": {
                            "photo": {
                                "type": "string",
                                "display_order": 1,
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
            "oneOf": [{
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
            "display_order": 3,
            "properties": {
                "other_driver_information": {
                    "type": "array",
                    "display_order": 1,
                    "items": {
                        "type": "object",
                        "display_order": 1,
                        "properties": {
                            "document_photos": {
                                "description": "Photos of other driver's documentation",
                                "type": "object",
                                "display_order": 1,
                                "properties": {
                                    "pink_card": {
                                        "type": "string",
                                        "display_order": 1,
                                        "format": "photo"
                                    },
                                    "drivers_license": {
                                        "type": "string",
                                        "display_order": 2,
                                        "format": "photo"
                                    },
                                    "license_plate": {
                                        "type": "string",
                                        "display_order": 3,
                                        "format": "photo"
                                    },
                                    "registration": {
                                        "type": "string",
                                        "display_order": 4,
                                        "format": "photo"
                                    }
                                }
                            },
                            "document_details": {
                                "description": "Other driver's information if no photos taken",
                                "type": "object",
                                "display_order": 2,
                                "properties": {
                                    "first_name": {
                                        "type": "string",
                                        "display_order": 1
                                    },
                                    "last_name": {
                                        "type": "string",
                                        "display_order": 2
                                    },
                                    "address": {
                                        "type": "string",
                                        "display_order": 3
                                    },
                                    "city": {
                                        "type": "string",
                                        "display_order": 4
                                    },
                                    "province": {
                                        "type": "string",
                                        "display_order": 5
                                    },
                                    "postal_code": {
                                        "type": "string",
                                        "display_order": 6
                                    },
                                    "home_phone_number": {
                                        "type": "string",
                                        "display_order": 7,
                                        "format": "tel"
                                    },
                                    "cell_phone_number": {
                                        "type": "string",
                                        "display_order": 8,
                                        "format": "tel"
                                    },
                                    "email": {
                                        "type": "string",
                                        "display_order": 9,
                                        "format": "email"
                                    },
                                    "drivers_license_number": {
                                        "type": "string",
                                        "display_order": 10
                                    },
                                    "license_plate": {
                                        "type": "string",
                                        "display_order": 11
                                    },
                                    "other_drivers_car": {
                                        "title": "Other Drivers Car",
                                        "type": "object",
                                        "display_order": 12,
                                        "properties": {
                                            "year": {
                                                "type": "string",
                                                "display_order": 1
                                            },
                                            "make": {
                                                "type": "string",
                                                "display_order": 2
                                            },
                                            "model": {
                                                "type": "string",
                                                "display_order": 3
                                            }
                                        }
                                    },
                                    "policy_number": {
                                        "type": "string",
                                        "display_order": 13
                                    },
                                    "insurance_company": {
                                        "type": "string",
                                        "display_order": 14
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
            "display_order": 4,
            "properties": {
                "witnesses": {
                    "type": "array",
                    "display_order": 1,
                    "items": {
                        "type": "object",
                        "properties": {
                            "name": {
                                "type": "string",
                                "display_order": 1
                            },
                            "email": {
                                "type": "string",
                                "format": "email",
                                "display_order": 2
                            },
                            "home_phone_number": {
                                "type": "string",
                                "display_order": 3,
                                "format": "tel"
                            },
                            "cell_phone_number": {
                                "type": "string",
                                "display_order": 4,
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
    
        static let EnumsampleData = """
          { "name":"John", "age":30, "car":50 }
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

