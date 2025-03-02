**Spring Boot Testing in Action**  
**Daniel Garnier-Moiroux**

**1\. Tell us about yourself.**

I’m Daniel Garnier-Moiroux. I’m currently employed by Broadcom in the Spring org. I live in Paris. This is my first-ever book proposal.

I’ve been a member of the Spring team since 2021, contributing mostly to Spring Security and related projects. While I do not contribute to the testing code in the framework, I collaborate with core contributors around a variety of topics. For example, in the past 3 months, I worked with Sam Brannen on Spring AOT and native testing. I also collaborate with the broader community on testing-related topics, with companies such as Testcontainers and Jetbrains

Before joining the Spring team, I was already a Spring user, and had gained proficiency with the Framework. I had been a Test-Driven Development (TDD) practitioner for years. I have experience in testing, beyond just Spring apps: I have even taught a class on unit-testing with Python.

I gave a 3-hour Deep-Dive conference talk at Devoxx Belgium in October 2024 on testing with Spring Boot. 1 week after being published on Youtube, it already has 5000 views ([https://www.youtube.com/watch?v=u5foQULTxHM](https://www.youtube.com/watch?v=u5foQULTxHM)). I am known in the Java / Spring community through my many speaking engagements (see example sessions: Devoxx 2022: [https://www.youtube.com/watch?v=iJ2muJniikY](https://www.youtube.com/watch?v=iJ2muJniikY), Spring IO 2024: [https://www.youtube.com/watch?v=HyoLl3VcRFY](https://www.youtube.com/watch?v=HyoLl3VcRFY)). I generally get very positive reviews, e.g. this YouTube comment:

![][image1]

Lastly, I have pedagogical experience teaching introductory CS classes to undergrads as an adjunct at the [Mines Paris](https://www.minesparis.psl.eu/en/home/) engineering school.

**2\. Tell us about the book’s topic.**

The topic of the book is centered around the tools and techniques for effectively testing Spring Boot applications. Spring provides a variety of tools for simplifying the creation of tests. These tools allow developers to easily run tests against their application, or select subsets of their application, with little to no boilerplate or configuration. They grant access to Spring Framework primitives like Configuration classes or dependency Autowiring, and run within JUnit, the most widely used Java unit-testing framework. These tools, through deep integration with the Spring Framework, provide first-class support for testing important scenarios like data access, security, etc.

Without specific tooling, developers would be faced with a choice: either test their code in isolation without the Spring integration but miss an important feature surface of their code, or treat the app as a black box and test the running system from the outside but need to create a lot of boilerplate to represent all business scenarios.

A typical user starts with the basic test generated on [https://start.spring.io](https://start.spring.io) . They use the “magic” @SpringBootTest annotation, have a smooth experience and unlock enough features for their testing needs. They do not understand how or even why it works, and how they can influence how it works. As time goes on, their test suite slows down and eventually takes minutes, they experience test pollution, flaky tests or complicated and unmaintainable setup that pull tens of dependencies. By understanding the key principles underpinning the Spring testing frameworks, they will be able to better understand how to best use the tools and create fast, maintainable tests.

In addition to this testing framework, Spring Boot testing bundles a few other powerful libraries, extensively used to test Spring itself, such as Mockito, AssertJ and Awaitaility. While developers may know the basics, there is a lot of depth to them and they are dramatically underused. Understanding how to effectively make use of their full range of capabilities will make for more maintainable tests.

Why this book?

Testing in software engineering is a timeless topic, and it has grown in importance over the past two and a half decades. While automated testing was relatively new in the early 2000s, it is now an established practice that is a crucial part of continuous integration (CI) and continuous delivery (CD). While it is considered best practice, testing and CI are only used by 56%-66% of teams according to StackOverflow’s 2024 survey ([https://survey.stackoverflow.co/2024/professional-developers\#2-processes-tools-and-programs-within-an-organization](https://survey.stackoverflow.co/2024/professional-developers#2-processes-tools-and-programs-within-an-organization)): there is a large portion of the developer market who needs to learn about these practices.

Test-Driven By Example (Kent Beck) was written in 2003\. In the past few years, Manning has published multiple books on testing, contract testing, testing javascript apps, etc \- the topic is still relevant, more specific content is being produced and consumed.

Additionally, Spring is the dominant Java framework, dwarfing the competition, with over 70% adoption (second is Quarkus with 4%) and tens of millions of downloads per month (source: [https://www.jetbrains.com/lp/devecosystem-2023/java/\#java\_web\_frameworks](https://www.jetbrains.com/lp/devecosystem-2023/java/#java_web_frameworks)). There is demand for Spring-related content. The SpringDeveloper youtube channel has over 200K subscribers. Josh Long’s Coffee+Software channel, which deals exclusively with Spring, has over 128K subscribers.

The Spring team even launched [https://spring.academy](https://spring.academy) in Jan 2023 to meet this demand, with a few free courses and paid path to certification. Note: Broadcom having acquired VMware and the Spring team, investment in this platform has stopped, so there will not be competition on that side, but it is possible that the certification program will be discontinued in the future.

Spring Boot Testing fits right at the intersection of those two topics, and there is currently no definitive resource on getting started with both.

**3\. Tell us about the book you plan to write.**

This book is a comprehensive overview of tools, techniques, and best practices for writing tests for Spring Boot applications.

By the end of this book, the reader will be able to create fast, readable, specific and maintainable tests for their Spring Boot applications.

Specifically, they will learn to:

* Organize their test suites to test Spring Boot applications with reasonable test run durations
* Use the Spring-provided testing tools, such as MockMvc, SpringExtension, WebTestClient, different WebEnvironments, etc, to run tests at the correct level of abstraction
* Split their tests suites along “test slices” to shrink the scope of their tests, find and use Spring Boot-provided test slices such as WebMvcTests and DataJpaTests, and write their own slices
* Test the configurations of their application, as well as the validation and binding logic of configuration properties.
* Use the most important JUnit features to organize their test suites, and write custom JUnit extensions to provide common features used across many tests
* Drive a web-browser to test their web applications using Selenium
* Test the Spring Security configuration in their applications without resorting to using a full web browser
* And use Spring-Boot bundled testing dependencies effectively:
    * Use Awaitility for running tests using polling, making tests deterministic without compromising for speed of execution
    * Use AssertJ in an idiomatic manner, and write custom assertions to match their specific business needs, making tests readable
    * Use the non-trivial features of Mockito to configure their mocks in the simplest and most readable way
    * Use Testcontainers to run component or integration tests against a containerized version of service dependencies, such as a database, a message queue, …

This book is intended to be an “In Action” book, teaching testing with Spring Boot. While it covers a relatively wide array of topics, it aims to teach the tools that Spring Boot provides to write “good” tests for Spring Applications. It will go relatively deep on the core Spring-specific testing tools and classes, and cover ancillary tools that Spring Boot testing bundles in sufficient depth, without replacing the reference documentation for any of them.

**4\. Q\&A**

What are the three or four most commonly-asked questions about this technology? e.g.

* How can I make my Spring Boot tests fast?
* What are all the annotations that Spring Boot testing provides (@Autowired, @MockitoBean, @DataJpaTests, …), what do they do, and when do I use them?
* How do I test a full Spring application without resorting to black-blox testing?

**5\. Tell us about your readers.**

Readers are Java developers who have built applications with Spring Boot. It is not required that they understand all the internals of how Spring and Spring Boot work. They are also familiar with unit testing in general. It’s expected they have:

* Practical knowledge and hands-on experience with Spring Boot
* Basic knowledge of writing unit tests using JUnit (the lib bundled with Spring Boot)

Typical readers will be backend or full-stack engineers, with 2-10 years experience writing Spring Boot apps, growing out of a junior role into a more senior position, and senior developers taking team leadership roles, e.g. lead developer.

More junior readers are starting to use less “copy-paste” for writing their tests and need the tools and practices, tips and dos-and-don'ts, to write good tests from scratch.

More senior readers are taking responsibility for the quality of the tests their team is writing, their maintainability, etc. As such, they need to be able to both provide high-level, strategic guidance on how to architect test suites, and implement low-level, tactical tooling to empower their teams to write better individual tests.

**6\. Tell us about the competition.**

Testing Spring applications is sometimes covered in Spring-related books. This can take the form of a single chapter which focuses on testing the topic of the book, for example see **Part 6 \- Testing Security Configurations** in **Spring Security In Action, 2nd Edition** (Manning, 2024, [https://www.manning.com/books/spring-security-in-action-second-edition](https://www.manning.com/books/spring-security-in-action-second-edition)). There can also be multiple small sections covering how to test the topic of a given chapter, for example see Spring In Action (Manning, 2022, [https://www.manning.com/books/spring-in-action-sixth-edition](https://www.manning.com/books/spring-in-action-sixth-edition)).

As far as I can tell, there are no comprehensive books focused on testing Boot apps \- apart from some self-published books with little reach (see Amazon search: [https://www.amazon.com/s?k=spring+boot+test](https://www.amazon.com/s?k=spring+boot+test)).

Philip Riecks has a whole online master class, with videos and sample applications. I have not taking it myself ([https://rieckpil.de/testing-spring-boot-applications-masterclass/](https://rieckpil.de/testing-spring-boot-applications-masterclass/)) ; but it is much bigger in scope and goes beyond what’s included in Spring and Spring Boot, touching technologies such as Keycloak, TypeScript, AWS services, etc ([https://rieckpil.de/testing-spring-boot-applications-masterclass/](https://rieckpil.de/testing-spring-boot-applications-masterclass/)). He has a small self-published e-book that is a gateway into the course (https://leanpub.com/testing-spring-boot-applications-demystified).

The Spring reference docs have chapters on testing but they are reference material, not tutorial / hands-on / in-action (Spring Framework: https://docs.spring.io/spring-framework/reference/testing.html ; Spring Boot: https://docs.spring.io/spring-boot/reference/testing/index.html). The official Spring learning website (https://spring.acamdey), has some sections of some classes dedicated to testing, but those are 10-minute modules (e.g. [https://spring.academy/courses/building-a-rest-api-with-spring-boot](https://spring.academy/courses/building-a-rest-api-with-spring-boot)).

There is content on Youtube, e.g. by Spring Developer Advocate Dan Vega ([https://www.youtube.com/results?search\_query=dan+vega+testing](https://www.youtube.com/results?search_query=dan+vega+testing)) or Teddy Smith ([https://www.youtube.com/watch?v=jqwZthuBmZY\&list=PL82C6-O4XrHcg8sNwpoDDhcxUCbFy855E](https://www.youtube.com/watch?v=jqwZthuBmZY&list=PL82C6-O4XrHcg8sNwpoDDhcxUCbFy855E)). There is some testing-centric content that happens to use Spring (e.g. Ted M Young aka Jitterted: [https://www.youtube.com/@JitterTed](https://www.youtube.com/@JitterTed)). There is also some conference material, e.g. by Josh Long, Spring Developer advocate: [https://www.youtube.com/watch?v=wAYt4Z4SF7g](https://www.youtube.com/watch?v=wAYt4Z4SF7g).

For someone wanting to learn Spring, I’d direct them towards my own Devoxx talk ([https://www.youtube.com/watch?v=u5foQULTxHM](https://www.youtube.com/watch?v=u5foQULTxHM&t=2263s)), and some content on Youtube. Then I would suggest reference docs, and reference docs for libraries bundled with Spring Boot (JUnit, Mockito, etc; see what’s included in Part III in the Table of Contents below).

**7\. Book size and illustrations**

Please estimate:

**The approximate number of published pages to within a 50-page range:**  
Aiming for 200-300 pages

**The approximate number of diagrams and other graphics:**  
This is my first book and I have little experience in how many graphics need to be present to support the content. It will likely be few, maybe 10-30.

**The approximate number of code listings**   
The book is intended to be code-intensive, showcasing a lot of the capabilities of the libraries and tools.  
**TODO: estimate**

**8\. Contact information**

Daniel Garnier-Moiroux  
6 rue Jean Bonnefoix  
94200 Ivry-sur-Seine  
France

**e-mail:** [daniel@garnier.wf](mailto:daniel@garnier.wf)

**phone:** \+33 6 78 97 18 31

**site:** [https://garnier.wf](https://garnier.wf)

**social media:**  
[https://twitter.com/kehrlann](https://twitter.com/kehrlann)  
[https://hachyderm.io/@kehrlann](https://hachyderm.io/@kehrlann)  
[https://linkedin.com/in/garniermoiroux](https://linkedin.com/in/garniermoiroux)

**9\. Schedule**

Spring Framework 7 / Spring Boot 4 will come out in November 2025        (source: [https://spring.io/blog/2024/10/01/from-spring-framework-6-2-to-7-0](https://spring.io/blog/2024/10/01/from-spring-framework-6-2-to-7-0)). A book publication before that date might be missing a lot of the important new features. It is reasonable to aim for that timeframe.

The goal would be to publish some time after Boot 4 is released, maybe allowing for a couple of months for the community to start adopting the new version.. Provisional writing schedule would be 10\~12 months total.

- First chapter in the first month
- 1/3: 4 months in
- 2/3: 7 months in
- 3/3: 10 months in

**10\. Table of Contents**

**Part I: Getting started**

1. Testing Spring Boot applications

This chapter introduces the specific challenges that arise when testing a Spring application, and how Spring has dedicated tooling to overcome such challenges. We will explore what Spring Boot has to offer in terms of testing: the Spring TestContex Framework and other Spring tools, the bundled testing libraries such as Mockito and assertJ, and the optional testing integrations such as Testcontainers or HtmlUnit. We will discuss how a traditional approach would handle testing Boot applications, either through very narrow unit tests, or very broad black-box testing. We will discuss how the testing affordances of Spring offer a path in between these approaches, and how Spring Boot makes it easy to test with the @SpringBootTest annotation. We will draw a broad picture of how the different libraries and components interact in a typical test. Lastly, I will list out what readers will learn in this book.

1. The challenges of testing Spring Boot applications
2. The need for Spring-specific tooling
3. What’s included in spring-boot-starter-test
4. A typical Spring Boot test
5. What you will learn in this book

2. Testing a Spring “Hello world”

In this chapter, we will work through a simple example, and showcase some of the testing features bundled in your Spring application when you create it on the Spring Initializr website at [https://start.spring.io](https://start.spring.io)

1. Getting up and running with code from start.spring.io
2. Creating a sample application and adding our first tests
3. Decoupling from external dependencies with mocks
4. Factoring common setup with JUnit
5. Deciding when (not) to use @SpringBootTest

**Part II: Writing tests for Spring Boot applications**

3. Getting familiar with the Spring testing framework

Both the Spring Framework and Spring Boot provide tools to simplify setting up, configuring and interacting with a test version of your application. It all starts with the @SpringBootTest annotation that every Spring developer knows: just like Spring Boot, it hides a lot of the underlying complexity and seems to “just work”. But, like many abstractions, when used incorrectly, it may lead to slow or brittle test suites. In this chapter, we will explain how @SpringBootTest binds your production code and JUnit tests together. We will take a closer look at the underlying infrastructure that the Spring testing framework provides, and the multiple capabilities it exposes, beyond the default usage of @SpringBootTest. We will examine tradeoffs when using these tools, and discuss best practices for keeping your test suite fast and efficient.

1. Setting up a Spring Boot application for testing with @SpringBootTest
2. Accessing Spring infrastructure in JUnit tests through the SpringExtension
3. Configuring the application under test
4. Stubbing out dependencies by using mocks
5. Speeding up tests by reusing the ApplicationContext between tests

4. Testing web applications

The vast majority of Spring Boot applications are web-applications, either browser-based applications with HTML and Javascript, or server-side components exposing HTTP endpoints in Rest or GraphQL. Having some level of testing from the API down is an important part of testing, often called “integration” or “component” testing. It is often implemented as “black box” testing: the application is deployed to a dedicated environment, and tests are executed against the running application. This introduces overhead, for example provisioning test environments. In this chapter, we will cover the tools and infrastructure that Spring offers to test HTTP applications locally, using simple unit tests. We will see how to test servlet and reactive applications, how to automate user interaction tests, and how to test client applications.

1. Testing Servlet applications with MockMvc and MockMvcTester
2. Testing Reactive web applications: WebTestClient
3. Using a lightweight web browser to simulate human interaction, with HtmlUnit
4. Running the full web server in tests
5. Driving a complete web browser in tests with Selenium
6. Testing client applications with MockRestServiceServer

5. Testing Subsets of an Application

Starting up a Spring Boot application is a time-intensive operation, ranging from a few hundred milliseconds to tens of seconds. This is orders of magnitude more than the few milliseconds it typically takes to run unit tests. While Spring allows reusing the same instance of a running application across tests, sometimes multiple configurations must be tested independently. To avoid paying the full startup price every time a new test context is created, Spring Boot offers test slices, which allow you to focus on a single layer of your application, for example the data layer. In this chapter, we will discuss a few examples of pre-configured test slices, how to find out what capabilities each slice exposes, and how to create custom test slices tailored to your use-case.

1. Spring Boot test slices
2. Testing the web layer only with WebMvcTests
3. Testing the data layer only with DataJpaTests
4. Discovering the capabilities of pre-configured Spring Boot test slices
5. Standardizing test configuration with custom test slices

6. Testing Configuration and Properties

Some applications support multiple configuration options, usually through properties files. This allows end-users to configure the application for their own use-cases, for example an app that could be configured to authenticate users either using an internal database or an external Single-Sign-On system. In this chapter, we will discuss the different levels at which to test configuration for your applications, and we will explore how to implement tests at each of these levels.

1. Deciding when to test Configuration and Property classes
2. Testing Property validation
3. Injecting property values in test classes
4. Testing failure cases


7. Testing Security configurations

Security cannot be overlooked, and is a hard requirement for most applications. Spring Security is the de-facto standard in the Spring world, used by over three quarters of Spring deployments. While security is non-negotiable, it does make applications harder to test. In this chapter, we will cover the toolkit available to Spring developers to write tests with minimal overhead. We will discuss how to leverage test users, how to modify HTTP requests and add security attributes to pass security checks such as CSRF or mTLS. We will also discuss how to test methods annotated with security checks, such as @PreAuthorize.

1. Using a custom user in tests
2. Enhancing mock HTTP request with security attributes
3. Using a custom authentication without username-password in tests
4. Testing method-level security
5. Testing security in reactive applications

**Part III: Improving your tests with tooling**

8. Creating reusable test abstractions with JUnit

JUnit is, by far, the most commonly used testing framework in Java. The premise is simple, organizing and running automated tests. Beyond that, it offers a powerful extension framework that Spring leverages to offer its own testing capabilities. In this chapter, we will review the basics of JUnit, discuss how to organize tests and factor common behavior using JUnit concepts such as setup methods. We will explore how to create simple, reusable abstractions that can be shared across modules through JUnit extensions.

1. Setting up and running tests with JUnit
2. Factoring common behavior, with setup, teardown, and parameterized tests
3. Adding testing features with existing JUnit extensions
4. Creating and distributing reusable testing capabilities through custom JUnit extensions

9. Testing against real service dependencies with Testcontainers

The Spring testing framework provides tooling for integration testing, for everything within a Spring application. More often than not, these applications connect to external services, such as data stores, message queues or third-party REST APIs. Traditionally, those integrations are mocked in tests, to avoid running complicated setups before a test can be executed. The Testcontainers project enables creating, managing, and connecting to docker containers running real instances of the systems an app connects to in production, for example a full-blown PostgreSQL database. In this chapter, we will discuss how Spring Boot tests can easily integrate with Testcontainers, what the tradeoffs are when running containers in tests, and the different patterns that can be applied to navigate those tradeoffs.

1. Instantiating test dependencies with Testcontainers
2. Integrating Testcontainers with Spring Boot testing
3. Minimizing the overhead of running containers: Testcontainers usage patterns

10. Writing elegant tests with Spring Boot’s bundled testing libraries

Spring Boot testing comes with a few testing libraries as managed dependencies other than JUnit. In this chapter, we will explore the most important features of the testing libraries bundled with Spring Boot: AssertJ, Mockito, and Awaitility. We will dive deeper into the capabilities of HtmlUnit, which was first introduced in “Fundamentals \> Testing Spring web applications”

1. Writing readable assertions with AssertJ
2. Creating powerful test doubles with Mockito
3. Testing asynchronous code with Awaitility
4. Simulating a web browser with HtmlUnit

11. Efficiently running tests in different contexts

Tests are designed to give feedback when changes are made to the application, and increase confidence. As such they are run in local development environments, but also when integrating work in shared Continuous Integration environments. And different kinds of changes, as well as different contexts may require specific types of tests to run. In this chapter we will discover how to split tests into categories, run only subsets of our tests, and how to automatically run them in continuous integration.

1. Grouping tests with JUnit’s @Tag and test suites
2. Running integration tests as a separate unit with Maven and Gradle
3. Crafting reliable tests and avoiding flakes
4. Continuously integrating changes with Github Actions

[image1]: <data:image/png;base64,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>