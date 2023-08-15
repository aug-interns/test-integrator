import ballerina/http;
import ballerina/log;

configurable string messagingService = ?;

http:Client messagingServiceClient = check new(messagingService);

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(6060) {

    resource function post setStatus() returns string|error {
        string response = check messagingServiceClient->/message.post({
            recipient: "+94775756100",
            message: "This is a mesage from the CertificateService"
        });
        log:printInfo(response.toJsonString());
        return "Success";
    }
}