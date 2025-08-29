# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Spring Boot 3.4.3 weather application demo project using Java 21. It demonstrates testing patterns for Spring
Boot applications and provides both web UI and REST API endpoints for managing city weather selections.

## Development Commands

### Build and Run

- `./mvnw spring-boot:run` - Start the application (runs on port 8080)
- `./mvnw clean compile` - Compile the project
- `./mvnw clean package` - Build JAR package

### Testing

- `./mvnw test` - Run all tests
- `./mvnw test -Dtest=WeatherApplicationTests` - Run specific test class
- `./mvnw test -Dtest="WeatherApplicationTests#contextLoads"` - Run specific test method. IMPORTANT: must use quotes to avoid constant permission prompts.

### Code Formatting

- `./mvnw spring-javaformat:apply` - Format code according to Spring Java Format conventions
- `./mvnw spring-javaformat:validate` - Validate code formatting

## Architecture

### Core Components

- **WeatherApplication** (`src/main/java/.../WeatherApplication.java`) - Main Spring Boot application entry point
- **WeatherController** (`src/main/java/.../WeatherController.java`) - Handles both web UI (`/`) and REST API (`/api/*`)
  endpoints
- **SelectionService** (`src/main/java/.../selection/SelectionService.java`) - Business logic for managing city
  selections and weather data

### Data Layer

- **City/CityRepository** - Manages available cities (loaded from `cities.csv`)
- **Selection/SelectionRepository** - Manages user's selected cities for weather tracking
- **H2 Database** - In-memory database with schema initialization from `schema.sql`

### Weather Integration

- **WeatherService** interface with implementations:
    - `OpenMeteoWeatherService` - Real weather API integration
    - `RandomWeatherService` - Mock implementation for testing

### Frontend

- **Thymeleaf templates** in `src/main/resources/templates/`
- **Static assets** in `src/main/resources/static/`

## Database Configuration

- JPA with Hibernate DDL disabled (`ddl-auto: none`)
- Schema initialized from `src/main/resources/schema.sql`
- Cities data loaded from `src/main/resources/cities.csv`
- SQL initialization mode set to `always`

## Package Structure

All code follows the pattern: `wf.garnier.spring.boot.test.ch2.weather.*`

- Root package contains main application and controller
- `city` - City domain and repository
- `openmeteo` - Weather service implementations and data models
- `selection` - Selection domain, repository, and service logic

## User interaction

### Commands

- `notify <message>` - notify that you have finished a task where the message describes the action in a very succinct
  way. Only use this if explicitly requested by the user. 