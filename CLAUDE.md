# CLAUDE.md

This file provides guidance for AI assistants working with this repository.

## Project Overview

This is a **CS50 SQL** coursework repository by Adarsh Achuthan. It contains:

1. **A final project**: A Recipe Database Management System (the primary deliverable)
2. **Problem set solutions**: Multiple CS50 SQL assignments covering different SQL concepts
3. **Pre-built SQLite databases**: Used for querying exercises

There are no build tools, package managers, testing frameworks, or CI/CD pipelines. All work is pure SQL executed against SQLite databases.

## Repository Structure

```
CS50-SQL/
├── README.md                  # Project overview (recipe database)
├── DESIGN.md                  # Design document with ER diagram reference, entity descriptions, relationships
├── er_diagram.png             # Entity-relationship diagram for recipe database
│
├── [Final Project - Recipe Database]
│   ├── project.db             # SQLite database (recipe system data)
│   ├── queries.sql            # CRUD operations, JOINs, sample data inserts
│
├── [Problem Set: Flights (ATL Airport)]
│   ├── schema.sql             # Passengers, Check-Ins, Airlines, Flights tables
│   ├── atl.db                 # SQLite database for flight data
│
├── [Problem Set: Meteorites]
│   ├── import.sql             # CSV import with temp table, data cleaning, transformation
│
├── [Problem Set: Harvard Courses]
│   ├── indexes.sql            # Index creation for courses, enrollments, requirements, students
│
├── [Problem Set: Airbnb/Rental Views]
│   ├── available.sql          # View: available listings
│   ├── frequently_reviewed.sql# View: most reviewed listings
│   ├── june_vacancies.sql     # View: June vacancy counts
│   ├── no_descriptions.sql    # View: listings without descriptions
│   ├── one_bedrooms.sql       # View: one-bedroom listings
│   ├── private.sql            # Triplets table + message extraction view
│
├── [Zipped Problem Set Archives]
│   ├── moneyball.zip          # Baseball statistics (12 query problems)
│   ├── cyberchase.zip         # TV show episodes (13 query problems)
│   ├── snap.zip               # Messaging/social app (5 query problems)
│   ├── normals.zip            # Climate/weather data (10 query problems)
│   ├── packages.zip           # Package delivery tracking (with answers.txt)
│   ├── views.zip              # Japanese artwork database (10 query problems)
│   ├── connect.zip            # LinkedIn-style connections
│   └── achuthanadarsh977-cs50-problems-2024-sql-project.zip  # Original submission
```

## How to Run SQL Files

All SQL is SQLite-compatible. Execute scripts against databases with:

```bash
sqlite3 <database.db> < <script.sql>
```

Examples:
```bash
# Run recipe queries against the project database
sqlite3 project.db < queries.sql

# Run schema creation for flights
sqlite3 atl.db < schema.sql

# Run the meteorite import (requires meteorites.csv in working directory)
sqlite3 meteorites.db < import.sql
```

For interactive exploration:
```bash
sqlite3 project.db
# Then use .tables, .schema, SELECT statements, etc.
```

## Database Schemas

### Recipe Database (project.db) - Final Project

| Table | Primary Key | Description |
|-------|-------------|-------------|
| `users` | `user_id` | User profiles (username, email, password_hash) |
| `recipes` | `recipe_id` | Recipes (title, description, cooking_time, serving_size, user_id FK) |
| `ingredients` | `ingredient_type` | Ingredient catalog (name, category) |
| `category` | `category_id` | Recipe categories (name) |
| `ratings` | `rating_id` | User ratings (user_id FK, recipe_id FK, score, comment) |

Key relationships:
- `recipes.user_id` -> `users.user_id` (many-to-one)
- `ratings.user_id` -> `users.user_id` (many-to-one)
- `ratings.recipe_id` -> `recipes.recipe_id` (many-to-one)
- Ingredients to recipes: many-to-many

### Flight Database (atl.db)

| Table | Description |
|-------|-------------|
| `Passengers` | first_name, last_name, age |
| `Check-Ins` | DATE_TIME, FLIGHT (quoted identifier due to hyphen) |
| `Airlines` | NAME, CONCOURSE (CHECK constraint: A-F, T) |
| `Flights` | FLIGHT_NUMBER (PK), AIRLINE_NAME, DEP_CODE, ARRIVE_CODE, timestamps |

## SQL Conventions Used

### Naming
- **Table names**: PascalCase (`Passengers`, `Flights`) or lowercase (`users`, `recipes`, `category`)
- **Column names**: snake_case (`user_id`, `recipe_id`, `first_name`) or UPPER_CASE (`FLIGHT_NUMBER`, `DEP_CODE`)
- **Primary keys**: Named `id` or `<entity>_id`
- **Foreign keys**: Follow `<referenced_table>_id` pattern
- **Indexes**: Prefixed with `search_index_` (e.g., `search_index_course`)
- **Views**: Descriptive lowercase names (e.g., `available`, `june_vacancies`, `frequently_reviewed`)

### Style
- SQL keywords are UPPERCASE: `SELECT`, `FROM`, `WHERE`, `CREATE TABLE`, `INSERT INTO`
- String literals use double quotes in some files, single quotes in others (SQLite accepts both)
- Comments use `--` (standard SQL single-line comments)
- Quoted identifiers for special characters: `"Check-Ins"`, `"Schools_and_Universities"`
- CHECK constraints used for enum-style validation: `CHECK(CONCOURSE IN ('A','B','C','D','E','F','T'))`

### Patterns
- Temporary tables for data import/cleaning (see `import.sql`)
- Views for reusable query abstractions (Airbnb problem set)
- Indexes on foreign key columns and frequently queried fields
- JOINs: INNER JOIN, LEFT JOIN, and RIGHT JOIN all demonstrated in `queries.sql`

## Problem Set Topics

Each zip archive contains a self-contained problem set with a `.db` file and numbered `.sql` query files:

| Problem Set | SQL Concepts | Domain |
|-------------|-------------|--------|
| `cyberchase.zip` | Basic SELECT, WHERE, ORDER BY, LIMIT | TV episodes |
| `normals.zip` | Coordinate-based queries, aggregation | Climate data |
| `moneyball.zip` | JOINs, aggregation, subqueries | Baseball statistics |
| `snap.zip` | Social graph queries | Messaging app |
| `packages.zip` | Transaction-style queries, log analysis | Package delivery |
| `views.zip` | CREATE VIEW, data abstraction | Artwork catalog |
| `connect.zip` | Multi-table JOINs, relationship queries | Professional networking |

## Guidelines for AI Assistants

### When modifying SQL files
- Match the existing style of the specific file being edited (naming, quoting, casing)
- Use SQLite-compatible syntax only (no PostgreSQL/MySQL-specific features)
- Preserve existing comments that explain problem requirements
- Do not modify problem set `.sql` files inside zips unless explicitly asked

### When working with databases
- The `.db` files are pre-populated with data; avoid destructive operations unless asked
- Use `.schema` in sqlite3 to inspect table structure before writing queries
- Test queries against the appropriate database file

### When modifying documentation
- `DESIGN.md` is a CS50 course submission document; preserve its structure
- `README.md` is the project overview; keep it aligned with DESIGN.md
- The ER diagram (`er_diagram.png`) should match the schema described in DESIGN.md

### Key awareness
- This is educational coursework, not a production system
- There is no application code (no Python, JavaScript, etc.) - only SQL and SQLite databases
- Problem set archives should generally remain as-is (they are course materials)
- The recipe database (`project.db` + `queries.sql`) is the main deliverable
