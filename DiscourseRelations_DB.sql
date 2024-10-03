TRUNCATE TABLE DiscourseTable;


-- Create the DiscourseTable
CREATE TABLE IF NOT EXISTS DiscourseTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    relation_type VARCHAR(50) NOT NULL,
    relation_count INT,
    significant_level VARCHAR(50)
);

-- Insert the data without significant_level
INSERT INTO DiscourseTable (relation_type, relation_count) VALUES
('Comment', 68),
('Continuation', 53),
('Acknowledgment', 49),
('Question-Answer Pair', 35),
('Elaboration', 24),
('Clarification Question', 21),
('Background', 21),
('Contrast', 18),
('Explanation', 17),
('Q-Elab', 17),
('Repetition', 16),
('Present Narration', 12),
('Parallel', 12),
('Alternation', 10),
('Rhetorical Question', 10),
('Conditional', 7),
('Narrate-Elab', 7),
('Recount Narration', 4),
('Correction', 3),
('Interruption', 2),
('Ambiguity', NULL);

SET SQL_SAFE_UPDATES = 0;

-- Update significant_level based on relation_count
UPDATE DiscourseTable
SET significant_level = 
    CASE
        WHEN relation_count >= 50 THEN 'Highly Significant'
        WHEN relation_count BETWEEN 15 AND 49 THEN 'Significant'
        WHEN relation_count BETWEEN 5 AND 14 THEN 'Needs more support'
        ELSE 'Needs further validation'
    END;

SET SQL_SAFE_UPDATES = 1;

-- Select all records to view the updated table
SELECT * FROM DiscourseTable;
