-- creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INTEGER)
BEGIN
    UPDATE users SET average_score = (SELECT SUM(corrections.score * projects.weight) FROM corrections INNER JOIN projects ON corrections.project_id = projects.id WHERE corrections.user_id = user_id) / (SELECT SUM(projects.weight) FROM corrections INNER JOIN projects ON corrections.project_id = projects.id WHERE corrections.user_id = user_id);
END
$$
DELIMITER ;
