import ballerina/http;

type EmpDetails record {
    string ENumber;
    string EName;
    string EGender;
};
service / on new http:Listener(9090) {
resource function get employee(string num) returns EmpDetails|error?{
    // Defines the HTTP client to call the OAuth2 secured APIs.
    http:Client empClient = check new ("https://58b16b35-32bc-4f01-a0ff-34f7b843ba25-dev.e1-us-east-azure.choreoapis.dev/mehb/employee/1.0.0",
        auth = {
            tokenUrl: "https://sts.choreo.dev/oauth2/token",
            clientId: "bJtckXfyTPlE9wDYUjn7imxbmyoa",
            clientSecret: "VlDaRwYxDqUgVHjO4mCbTat5gv4a"
        }
    );
    EmpDetails payload = check empClient->/employee(number = num);
    return payload;
}
}