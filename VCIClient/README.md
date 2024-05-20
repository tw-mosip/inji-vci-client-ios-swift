
# VCI Client
- Request credential to Credential issuer

## Installation
- Clone the repo
- In your swift application go to file > add package depenedecy > add the  https://github.com/tw-mosip/inji-vci-client-ios-swift.git in git search bar> add package
- Import the library and use

## APIs

##### Request Credential

Request for credential from the issuer, and receive the credential reponse back in string.

```
    let requestCredential = try await VCIClient().getCredential(issuerMeta: issuer, signer: signer, accessToken: accessToken, publicKey: publicKeyPEM)
```

###### Parameters

| Name         | Type                               | Description                                                                                                  | Sample                                                                                                  |
|--------------|------------------------------------|--------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| issuerMeta   | IssuerMeta                         | struct of the issuer details like audienece, endpoint, timeout, type and format                                                                           | `IssuerMeta(credentialAudience, credentialEndpoint, downloadTimeout, credentialType, credentialFormat)` |
| signer       | func  (JWTPayload, JWTHeader) -> String | Function which is called to get the signature passing the JWTPayload and JWTHeader | `fun signer(paylod: JWTPayload, header: JWTHeader): String {//Signing logic of vapor/jwt-kit library }`                                           |
| accessToken  | String                             | token issued by providers based on auth code                                                                 | "" |
| publicKeyPem | String                             | Public key in PEM format is passed from the keypair generated | 

###### Exceptions

1. InvalidAccessTokenException is thrown when token passed by user is invalid
2. InvalidPublicKeyError is thrown when the public key passed is not valid or generation of key primitives fails
3. DownloadFailedError is thrown when the credential issuer did not respond with credential response


## More details

An example app is added under /SwiftExample folder which can be referenced for more details. extract the swift example app out of the library and then follow the installation steps 
