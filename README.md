# Karate API Automation Framework

This project demonstrates a comprehensive API automation framework using Karate DSL with the following features:

- Data-driven testing using CSV files
- Scenario Outline for multiple test data execution
- JSON request body handling
- Comprehensive assertions
- Cucumber reporting
- Environment configuration using .env file
- Common headers management



## Project Structure

```
src/test/java/
├── features/
│   └── users.feature
├── data/
│   └── users.csv
├── common/
│   └── headers.json
└── TestRunner.java
```

## Prerequisites

- Java 11 or higher
- Maven 3.6 or higher

## Setup

1. Clone the repository
2. Configure the `.env` file with your environment variables:
   ```
   baseUrl=your-api-base-url
   apiKey=your-api-key
   ```

## Running Tests

To run all tests:
```bash
mvn clean test
```

To run specific feature:
```bash
mvn test -Dkarate.options="classpath:features/users.feature"
```

## Reports

After test execution, Cucumber reports will be available in:
```
target/cucumber-reports/
```

## Features

- REST API testing
- Data-driven testing
- Environment configuration
- Request/Response validation
- Comprehensive assertions
- Beautiful HTML reports

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author
**Vanish Kota**
- GitHub: [https://github.com/vanishkota19](https://github.com/vanishkota19)
