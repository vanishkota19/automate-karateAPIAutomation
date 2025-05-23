function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);

    var config = {
        baseUrl: 'https://jsonplaceholder.typicode.com',
        apiKey: 'test-api-key'
    }

    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
} 