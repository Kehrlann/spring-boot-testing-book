package wf.garnier.spring.boot.test.ch3.contextcache;

import org.junit.jupiter.api.ClassOrderer;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestClassOrder;
import org.junit.jupiter.api.extension.ExtendWith;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.system.CapturedOutput;
import org.springframework.boot.test.system.OutputCaptureExtension;
import static org.assertj.core.api.Assertions.assertThat;

/**
 * We run these tests in order, to ensure the {@link SlowTests} start first, and get the
 * spring startup logs.
 */
// tag::slow-tests[]
@TestClassOrder(ClassOrderer.OrderAnnotation.class) // <1>
class SlowApplicationTests {

	// tag::ignored[]
	@Nested
	@ExtendWith(OutputCaptureExtension.class)
	// end::ignored[]
	@Order(1) // <1>
	@SpringBootTest
	class SlowTests {

		@Test
		void contextLoads() {
		}
		// tag::ignored[]

		@Test
		void logsAppStartup(CapturedOutput output) {
			assertThat(output).contains("🐌 Configuring slow bean...");
		}
		// end::ignored[]

	}

	// tag::ignored[]
	@Nested
	@ExtendWith(OutputCaptureExtension.class)
	// end::ignored[]
	@Order(2) // <1>
	@SpringBootTest
	class FastTests {

		@Test
		void contextLoads() {
		}
		// tag::ignored[]

		@Test
		void doesNotLogAppStartup(CapturedOutput output) {
			assertThat(output).doesNotContain("🐌 Configuring slow bean...");
		}
		// end::ignored[]

	}

}
// end::slow-tests[]
