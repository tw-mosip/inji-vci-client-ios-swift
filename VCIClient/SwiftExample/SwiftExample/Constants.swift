import Foundation


// Authorization constants
let clientID = ""
let redirectURI = URL(string: "")!
let authorizationEndpoint = URL(string: "")!
let tokenEndpoint = URL(string: "")!
let scopes = []
let additionalParameters = [:]


// IssuerMeta constant

let issuerCredentialAudience = ""
let issuerCredentialEndPoint = ""
let issuerDownloadTimeout
let issuerCredentialType = [""]


// keys and access token

let accessToken = """
"""

var privateKey = """
-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDL8W1D9w5zHpmD
JqpTngIRJ+Sm21e42cRnTudhdejzKUiJQWkHSvQV5yC/+0iEXUsUJYEdSyrKhJFD
PT+IFGdjIiwb7IX+rUreWXlD/YYBL3/byMG4kYoO4oiPp2A+WvfeyLpuN549OXhk
7o5kXEZjKfjHTfmnAbCMoYW5BEpiHQC3HAeJZ5EiwAn8HZn5UY6lxJcf7H9hR83x
D0W7IZTNyxUu4aLNuihFIxJKgP/L/y95Y6ddZsyyHQopM43/7JOYBwufa07MWaxi
AdBdq1bR/ZeOt2aZaXhV+J6QUoUO8Z6fG6b2cQmvMgk4ybqoeciLII0DfFsyqavu
ip4hRr59AgMBAAECggEAUIw994XwMw922hG/W98gOd5jtHMVJnD73UGQqTGEm+VG
PM+Ux8iWtr/ec3Svo3elW4OkhwlVET9ikAf0u64zVzf769ty4K9YzpDQEEZlUrqL
6SZVPKxetppKDVKx9G7BT0BAQZ+947h7EIIXwxOeyTOeijkFzSwhqqlwwy4qoqzV
FTQS20QHE62hxzwuS5HBqw8ds183qAg9NbzR0Cp4za9qTiBB6C8KEcLqeatO+q+d
VCDsJcAMZOvW14N6BozKgbQ/WXZQ/3kNUPBndZLzzqaILFNmB1Zf2DVVJ9gU7+EK
xOac60StIfG81NllCTBrmRVq8yitNqwmutHMlxrIkQKBgQDvp39MkEHtNunFGkI5
R8IB5BZjtx5OdRBKkmPasmNU8U0XoQAJUKY/9piIpCtRi87tMXv8WWmlbULi66pu
4BnMIisw78xlIWRZTSizFrkFcEoVgEnbZBtSrOg/J5PAcjLEGCQoAdmMXAekR2/m
htv7FPijHPNUjyIFLaxwjl9izwKBgQDZ2mQeKNRHjIb5ZBzB0ZCvUy2y4+kaLrhZ
+CWMN1flL4dd1KuZKvCEfHY9kWOjqw6XneN4yT0aPmbBft4fihiiNW0Sm8i+fSpy
g0klw2HJl49wnwctBpRgTdMKGo9n14OGeu0xKOAy7I4j1tKrUXiRWnP9R583Ti7c
w7YHgdHM8wKBgEV147SaPzF08A6bzMPzY2zO4hpmsdcFoQIsKdryR04QXkrR9EO+
52C0pYM9Kf0Jq6Ed7ZS3iaJT58YDjjNyqqd648/cQP6yzfYAIiK+HERSRnay5zU6
b5zn1qyvWOi3cLVbVedumdJPvjtEJU/ImKvOaT5FntVMYwzjLw60hTsLAoGAZJnt
UeAY51GFovUQMpDL96q5l7qXknewuhtVe4KzHCrun+3tsDWcDBJNp/DTymjbvDg1
KzoC9XOLkB8+A+KJrZ5uWAGImi7Cw07NIJsxNR7AJonJjolTS4Wkxy2su49SNW/e
yKzPm7SRjwtNDb/5pWXX2kaQx8Fa8qeOD7lrYPECgYAwQ6o0vYmr+L1tOZZgMVv9
Jusa8beVUH5hyduJjmxbYOtFTkggAozdx7rs4BgyRsmDlV48cEmcVf/7IH4gMJLb
O+bbERwCYUChe+piANhnwfwDHzbRd8mmQus54P06X7bWu6Rmi7gbQGVN/Z6VhbIm
D2cOo0w4bk/3yb01xz1MEw==
-----END PRIVATE KEY-----
"""


var publicKey = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy/FtQ/cOcx6ZgyaqU54C
ESfkpttXuNnEZ07nYXXo8ylIiUFpB0r0Fecgv/tIhF1LFCWBHUsqyoSRQz0/iBRn
YyIsG+yF/q1K3ll5Q/2GAS9/28jBuJGKDuKIj6dgPlr33si6bjeePTl4ZO6OZFxG
Yyn4x035pwGwjKGFuQRKYh0AtxwHiWeRIsAJ/B2Z+VGOpcSXH+x/YUfN8Q9FuyGU
zcsVLuGizbooRSMSSoD/y/8veWOnXWbMsh0KKTON/+yTmAcLn2tOzFmsYgHQXatW
0f2XjrdmmWl4VfiekFKFDvGenxum9nEJrzIJOMm6qHnIiyCNA3xbMqmr7oqeIUa+
fQIDAQAB
-----END PUBLIC KEY-----
"""
