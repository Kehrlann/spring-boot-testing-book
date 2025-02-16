# Table of contents

## Part I: Getting started

### 1. Testing Spring Boot applications

This chapter introduces the specific challenges that arise when testing a Spring application, and how Spring has dedicated tooling to overcome such challenges. We will explore what Spring Boot has to offer in terms of testing: the Spring TestContex Framework and other Spring tools, the bundled testing libraries such as Mockito and assertJ, and the optional testing integrations such as Testcontainers or HtmlUnit. We will discuss how a traditional approach would handle testing Boot applications, either through very narrow unit tests, or very broad black-box testing. We will discuss how the testing affordances of Spring offer a path in between these approaches, and how Spring Boot makes it easy to test with the @SpringBootTest annotation. We will draw a broad picture of how the different libraries and components interact in a typical test. Lastly, I will list out what readers will learn in this book.

1. The challenges of testing Spring Boot applications
2. The need for Spring-specific tooling
3. What’s included in spring-boot-starter-test
4. A typical Spring Boot test
5. What you will learn in this book

### 2. Testing a Spring “Hello world”

In this chapter, we will work through a simple example, and showcase some of the testing features bundled in your Spring application when you create it on the Spring Initializr website at [https://start.spring.io](https://start.spring.io)

1. Getting up and running with code from start.spring.io
2. Creating a sample application and adding our first tests
3. Decoupling from external dependencies with mocks
4. Factoring common setup with JUnit
5. Deciding when (not) to use @SpringBootTest

## Part II: Writing tests for Spring Boot applications

### 3. Getting familiar with the Spring testing framework

Both the Spring Framework and Spring Boot provide tools to simplify setting up, configuring and interacting with a test version of your application. It all starts with the @SpringBootTest annotation that every Spring developer knows: just like Spring Boot, it hides a lot of the underlying complexity and seems to “just work”. But, like many abstractions, when used incorrectly, it may lead to slow or brittle test suites. In this chapter, we will explain how @SpringBootTest binds your production code and JUnit tests together. We will take a closer look at the underlying infrastructure that the Spring testing framework provides, and the multiple capabilities it exposes, beyond  the default usage of @SpringBootTest. We will examine tradeoffs when using these tools, and discuss best practices for keeping your test suite fast and efficient.

1. Setting up a Spring Boot application for testing with @SpringBootTest
2. Accessing Spring infrastructure in JUnit tests through the SpringExtension
3. Configuring the application under test
4. Stubbing out dependencies by using mocks
5. Speeding up tests by reusing the ApplicationContext between tests

### 4. Testing web applications

The vast majority of Spring Boot applications are web-applications, either browser-based applications with HTML and Javascript, or server-side components exposing HTTP endpoints in Rest or GraphQL. Having some level of testing from the API down is an important part of testing, often called “integration” or “component” testing. It is often implemented as “black box” testing: the application is deployed to a dedicated environment, and tests are executed against the running application. This introduces overhead, for example provisioning test environments. In this chapter, we will cover the tools and infrastructure that Spring offers to test HTTP applications locally, using simple unit tests. We will see how to test servlet and reactive applications, how to automate user interaction tests, and how to test client applications.

1. Testing Servlet applications with MockMvc and MockMvcTester
2. Testing Reactive web applications: WebTestClient
3. Using a lightweight web browser to simulate human interaction, with HtmlUnit
4. Running the full web server in tests
5. Driving a complete web browser in tests with Selenium
6. Testing client applications with MockRestServiceServer

### 5. Testing Subsets of an Application

Starting up a Spring Boot application is a time-intensive operation, ranging from a few hundred milliseconds to tens of seconds. This is orders of magnitude more than the few milliseconds it typically takes to run unit tests. While Spring allows reusing the same instance of a running application across tests, sometimes multiple configurations must be tested independently. To avoid paying the full startup price every time a new test context is created, Spring Boot offers test slices, which allow you to focus on a single layer of your application, for example the data layer. In this chapter, we will discuss a few examples of pre-configured test slices, how to find out what capabilities each slice exposes, and how to create custom test slices tailored to your use-case.

1. Spring Boot test slices
2. Testing the web layer only with WebMvcTests
3. Testing the data layer only with DataJpaTests
4. Discovering the capabilities of pre-configured Spring Boot test slices
5. Standardizing test configuration with custom test slices

### 6. Testing Configuration and Properties

Some applications support multiple configuration options, usually through properties files. This allows end-users to configure the application for their own use-cases, for example an app that could be configured to authenticate users either using an internal database or an external Single-Sign-On system. In this chapter, we will discuss the different levels at which to test configuration for your applications, and we will explore how to implement tests at each of these levels.

1. Deciding when to test Configuration and Property classes
2. Testing Property validation
3. Injecting property values in test classes
4. Testing failure cases



### 7. Testing Security configurations

Security cannot be overlooked, and is a hard requirement for most applications. Spring Security is the de-facto standard in the Spring world, used by over three quarters of Spring deployments. While security is non-negotiable, it does make applications harder to test. In this chapter, we will cover the toolkit available to Spring developers to write tests with minimal overhead. We will discuss how to leverage test users, how to modify HTTP requests and add security attributes to pass security checks such as CSRF or mTLS. We will also discuss how to test methods annotated with security checks, such as @PreAuthorize.

1. Using a custom user in tests
2. Enhancing mock HTTP request with security attributes
3. Using a custom authentication without username-password in tests
4. Testing method-level security
5. Testing security in reactive applications

## Part III: Improving your tests with tooling

### 8. Creating reusable test abstractions with JUnit

JUnit is, by far, the most commonly used testing framework in Java. The premise is simple, organizing and running automated tests. Beyond that, it offers a powerful extension framework that Spring leverages to offer its own testing capabilities. In this chapter, we will review the basics of JUnit, discuss how to organize tests and factor common behavior using JUnit concepts such as setup methods. We will explore how to create simple, reusable abstractions that can be shared across modules through JUnit extensions.

1. Setting up and running tests with JUnit
2. Factoring common behavior, with setup, teardown, and parameterized tests
3. Adding testing features with existing JUnit extensions
4. Creating and distributing reusable testing capabilities through custom JUnit extensions

### 9. Testing against real service dependencies with Testcontainers

The Spring testing framework provides tooling for integration testing, for everything within a Spring application. More often than not, these applications connect to external services, such as data stores, message queues or third-party REST APIs. Traditionally, those integrations are mocked in tests, to avoid running complicated setups before a test can be executed. The Testcontainers project enables creating, managing, and connecting to docker containers running real instances of the systems an app connects to in production, for example a full-blown PostgreSQL database. In this chapter, we will discuss how Spring Boot tests can easily integrate with Testcontainers, what the tradeoffs are when running containers in tests, and the different patterns that can be applied to navigate those tradeoffs.

1. Instantiating test dependencies with Testcontainers
2. Integrating Testcontainers with Spring Boot testing
3. Minimizing the overhead of running containers: Testcontainers usage patterns

### 10. Writing elegant tests with Spring Boot’s bundled testing libraries

Spring Boot testing comes with a few testing libraries as managed dependencies other than JUnit. In this chapter, we will explore the most important features of the testing libraries bundled with Spring Boot: AssertJ, Mockito, and Awaitility. We will dive deeper into the capabilities of HtmlUnit, which was first introduced in “Fundamentals \> Testing Spring web applications”

1. Writing readable assertions with AssertJ
2. Creating powerful test doubles with Mockito
3. Testing asynchronous code with Awaitility
4. Simulating a web browser with HtmlUnit

### 11. Efficiently running tests in different contexts

Tests are designed to give feedback when changes are made to the application, and increase confidence. As such they are run in local development environments, but also when integrating work in shared Continuous Integration environments. And  different kinds of changes, as well as different contexts may require specific types of tests to run. In this chapter we will discover how to split tests into categories, run only subsets of our tests, and how to automatically run them in continuous integration.

1. Grouping tests with JUnit’s @Tag and test suites
2. Running integration tests as a separate unit with Maven and Gradle
3. Crafting reliable tests and avoiding flakes
4. Continuously integrating changes with Github Actions
