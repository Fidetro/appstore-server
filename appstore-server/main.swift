//
//  main.swift
//  appstore-server
//
//  Created by karimzhang on 4/23/24.
//

import AppStoreServerLibrary





func fromUser() async {

    let issuerId = "xxx-xxx-xxx-xxx-xxx"
    let keyId = "xxx"
    let bundleId = "com.karim.xxx"

    let encodedKey = try! String(contentsOfFile: "/appstore-server/appstore-server/XXXX.p8")
    let environment = Environment.production
    let client = try! AppStoreServerAPIClient(signingKey: encodedKey, keyId: keyId, issuerId: issuerId, bundleId: bundleId, environment: environment)

    let response = await client.lookUpOrderId(orderId: "XXXXXX")
    switch response {
    case .success(let response):
        print(response)
    case .failure(let errorCode, let rawApiError, let apiError, let errorMessage, let causedBy):
        print(errorCode)
        print(rawApiError)
        print(apiError)
        print(errorMessage)
        print(causedBy)
    }
}



await fromUser()
