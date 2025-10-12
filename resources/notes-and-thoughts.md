# Notes and thoughts

## Questions

`@MockitoBean` uses `org.springframework.test.context.bean.override.BeanOverrideStrategy#WRAP` ... does it build the
real bean then?

## Testing Web apps

-> https://docs.spring.io/spring-framework/reference/testing/spring-mvc-test-client.html ?

## Testing modulith

ArchUnit testing

## Testing native applications

"How do I test native applications?"

## Testing data

## Review 1

### Discuss

- What happened to the ToC?
- "What new techniques, insights or perspectives did you gain from this book?" -> a bit light
- Title is not consensual ; "Testing Spring Boot Apps" ; "Mastering spring boot testing"
- No. We should use Spring Boot 4 (start with milestone/snapshot and switch to GA release once it is available). Also, please use JDK 25.


### General

- Yes, the writing is good. I would suggest the author to go into 'reader' mode at times and review his writing. At times, being a subject matter expert, we take many things for granted. Putting ourselves in reader's lens really helps to fine-tune the content.
- Add "good testing practices" in brief notes.
- I would add a chapter on using Wiremock

### Chapter 1 
 
- First chapter: Adding the Test Pyramid and showing where Spring Boot fits—unit, integration, and end-to-end tests—would further highlight its advantages and help readers understand how to structure their tests efficiently.
- Chapter 1 needs to do more to provide a broader picture of Spring Boot Testing and its eco system.
- I think there's an opportunity to make it even more engaging - maybe a few practical examples or an anecdote that highlights the benefits and keeps the reader turning the pages.
- A little more emphasis on the practical (relatable) scenarios could inspire readers even further


### TOC

- Wat wat AI?
- Hard to tell. there's a lot that I have no clue what it means. At first glance, I think this is too much content. Besides, if it was me, I'd focus more on how generic/well-known testing concepts map here rather than focusing so much on tech. For example, I'd have: "testing a web page", "testing a web api", "testing the domain"...
- I would definitely want to add more chapters to include different type of testing and different types of applications. - Applications using Spring AI - Batch Applications (or Data Heavy applications) - Microservices (or distributed with many moving parts, decoupled using Kafka or such)