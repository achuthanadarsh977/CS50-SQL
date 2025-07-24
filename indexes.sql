CREATE INDEX search_index_course ON courses(id,department);

CREATE INDEX search_index_enrollment on enrollments(student_id,course_id);

CREATE INDEX search_index_requirements on requirements(id,name);

CREATE INDEX  search_index_satisfies on satisfies(course_id,requirement_id);

CREATE INDEX search_index_students ON students(id,name);
