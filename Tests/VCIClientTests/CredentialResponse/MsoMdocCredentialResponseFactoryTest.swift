//
//  File.swift
//  
//
//  Created by Kiruthika Jeyashankar on 22/08/24.
//
import XCTest
@testable import VCIClient

class MsoMdocCredentialResponseFactoryTest: XCTestCase {
    func testParsingMsoMdoc() {
        do{
            
            let data = "omdkb2NUeXBldW9yZy5pc28uMTgwMTMuNS4xLm1ETGxpc3N1ZXJTaWduZWSiamlzc3VlckF1dGiEQ6EBJqEYIYJZAdQwggHQMIIBdqADAgECAhRqkR0NtgV68nIm3GYQiAGRJp91JjAKBggqhkjOPQQDAjBoMQswCQYDVQQGEwJJTjESMBAGA1UECAwJS2FybmF0YWthMQwwCgYDVQQHDANCTFIxDjAMBgNVBAoMBU1PU0lQMQ4wDAYDVQQLDAVNT1NJUDEXMBUGA1UEAwwOTW9jayBWQyBJc3N1ZXIwHhcNMjQwODA2MDczNzUwWhcNMjUwODA2MDczNzUwWjBoMQswCQYDVQQGEwJJTjESMBAGA1UECAwJS2FybmF0YWthMQwwCgYDVQQHDANCTFIxDjAMBgNVBAoMBU1PU0lQMQ4wDAYDVQQLDAVNT1NJUDEXMBUGA1UEAwwOTW9jayBWQyBJc3N1ZXIwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQkmoXLryUfu7LUtXvpr-50dr8uhb-S88liOldHUKmYjaGEWHslZGx1B8Pqur9bJ4FzRqAGhD6FWb1-4jAxEmcSMAoGCCqGSM49BAMCA0gAMEUCIQCKKUWZI1y_KWCn5z_ZPK-0TNm56YmGHDSEonlaaWb29AIgVIOyWpeMFQJBpX2QXHG5K1Rh8NuSOIqijrrnqRqf7vpZAdQwggHQMIIBdqADAgECAhRhqedxVOvMC83xXMbHaAGRJpzOHzAKBggqhkjOPQQDAjBoMQswCQYDVQQGEwJJTjESMBAGA1UECAwJS2FybmF0YWthMQwwCgYDVQQHDANCTFIxDjAMBgNVBAoMBU1PU0lQMQ4wDAYDVQQLDAVNT1NJUDEXMBUGA1UEAwwOTW9jayBWQyBJc3N1ZXIwHhcNMjQwODA2MDczNDU2WhcNMjUwODA2MDczNDU2WjBoMQswCQYDVQQGEwJJTjESMBAGA1UECAwJS2FybmF0YWthMQwwCgYDVQQHDANCTFIxDjAMBgNVBAoMBU1PU0lQMQ4wDAYDVQQLDAVNT1NJUDEXMBUGA1UEAwwOTW9jayBWQyBJc3N1ZXIwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAATKytwWiWPdit0OxqIcH3fTqN9HYE8pbgctH4uflMo7au6DcI1lB4nxlqMv-o-bRoNNPz-PYsafARNiqeKz87rGMAoGCCqGSM49BAMCA0gAMEUCIFAVF4bXsUAtKKOuK7BX72vdZKF-VJCKGCeicNXQV7IzAiEA9VD2HyeWGM5SxdiDgJ3JaMfWG9dtKJxPGQndYZU1C4xZAkqmZ3ZlcnNpb25jMS4wb2RpZ2VzdEFsZ29yaXRobWdTSEEtMjU2Z2RvY1R5cGVxb3JnLmlzby4xODAxMy41LjFsdmFsdWVEaWdlc3RzoXFvcmcuaXNvLjE4MDEzLjUuMagCWCDUkQF9Is07a950B-eSTQ0mGieeDxA_q9Ol7oQojt4vfAZYIHOwNxZlf3I3bNaNw7qDtotBvNXrccS-lT_fUnb7pS8wA1ggjh1IybRkQuPDyaXmC9C-974w6uuYgmpqIrdQArLj2-EBWCB4CZYdVPBVXx4GFg8PCic1Y1u8LbIiCAOi3lLbNuTyeQRYICzRdFsDEphcEa8AnnXfnvChEMhkfoM2wB2CM9AVsstIAFggiUMXi5PUPcwsY-wsv6RUE_RIfLEBhwBV_1ItgtQlRSAHWCAW4jRyZXVbBIka_lXEjlrsOybp8iqvYx4gMGZiMiVnSgVYIDzyQ6jwo0a0KmXZcfkJcxyCgToP99qD3GOY-gtRymCkbWRldmljZUtleUluZm-haWRldmljZUtleaQBAiABIVggxjkAob4aqaD-4k0ghUVFJ-RkhAMtKCskDTBjrxFaIZ4iWCANYzYkwMhM-BRZw7WTKtDBrrnezf7JPTovtIbTAEMU0Wx2YWxpZGl0eUluZm-jZnNpZ25lZMB0MjAyNC0wOC0xOVQxMToxMTo1MFppdmFsaWRGcm9twHQyMDI0LTA4LTE5VDExOjExOjUwWmp2YWxpZFVudGlswHYxMDAwMDAtMDEtMDFUMDA6MDA6MDBaWED-Bf44cnPHEgQwrTan0oIpHZkUYCxQG7ePjxgyFFm-OcPIwpd7jrNNDEp5Cbbku9N_pUJwvQ5kuZjBFi3MO5Vwam5hbWVTcGFjZXOhcW9yZy5pc28uMTgwMTMuNS4xiNgYWJ-kaGRpZ2VzdElEAmZyYW5kb21QbYUstb5qYaqaDGEXvWdD53FlbGVtZW50SWRlbnRpZmllcnJkcml2aW5nX3ByaXZpbGVnZXNsZWxlbWVudFZhbHVleEh7aXNzdWVfZGF0ZT0yMDIzLTAxLTAxLCB2ZWhpY2xlX2NhdGVnb3J5X2NvZGU9QSwgZXhwaXJ5X2RhdGU9MjA0My0wMS0wMX3YGFhVpGhkaWdlc3RJRAZmcmFuZG9tUNyXhXOZjmheiFyzYfhsl0ZxZWxlbWVudElkZW50aWZpZXJvZG9jdW1lbnRfbnVtYmVybGVsZW1lbnRWYWx1ZWI0NdgYWFikaGRpZ2VzdElEA2ZyYW5kb21QIL6_sBEAsnZUVxjDD0BsyHFlbGVtZW50SWRlbnRpZmllcmppc3N1ZV9kYXRlbGVsZW1lbnRWYWx1ZWoyMDI0LTAxLTEy2BhYWaRoZGlnZXN0SUQBZnJhbmRvbVDjoYj_8RBZ62-85iZV371vcWVsZW1lbnRJZGVudGlmaWVyb2lzc3VpbmdfY291bnRyeWxlbGVtZW50VmFsdWVmSXNsYW5k2BhYWaRoZGlnZXN0SUQEZnJhbmRvbVCDuJZw1tn5v1LYPe7cC_ZicWVsZW1lbnRJZGVudGlmaWVya2V4cGlyeV9kYXRlbGVsZW1lbnRWYWx1ZWoyMDI1LTAxLTEy2BhYWKRoZGlnZXN0SUQAZnJhbmRvbVAFg1zMFq1oLYxHiib0UCeYcWVsZW1lbnRJZGVudGlmaWVyamJpcnRoX2RhdGVsZWxlbWVudFZhbHVlajE5OTQtMTEtMDbYGFhUpGhkaWdlc3RJRAdmcmFuZG9tUElZm1bdU7M1GlcrQPJ_ctNxZWxlbWVudElkZW50aWZpZXJqZ2l2ZW5fbmFtZWxlbGVtZW50VmFsdWVmSm9zZXBo2BhYVaRoZGlnZXN0SUQFZnJhbmRvbVB_NHtdmXkWLPqVnSgypGGWcWVsZW1lbnRJZGVudGlmaWVya2ZhbWlseV9uYW1lbGVsZW1lbnRWYWx1ZWZBZ2F0aGE=".data(using: .utf8)!
            print("inside do block")
            let mdocCredentialResponse = try MsoMdocCredentialResponseFactory().constructResponse(response: data)
            XCTAssertEqual(try mdocCredentialResponse?.toJSONString(),"response")
            print(mdocCredentialResponse!)
        } catch let error {
            print("Error occurred ",error)
        }
        
    }
}
