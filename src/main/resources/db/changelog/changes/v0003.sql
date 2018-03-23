-- View all candidates for all elections by election
CREATE VIEW candidates_by_elections AS
  SELECT
    ec.id,
    election.title AS election,
    candidate.first_name,
    candidate.last_name
  FROM candidate, election, election_candidate AS ec
  WHERE ec.candidate_id = candidate.id AND ec.election_id = election.id
  ORDER BY election.title, candidate.last_name;

-- View all votes for all elections by election
CREATE VIEW votes_by_elections AS
  SELECT
    vote.id,
    cbe.election,
    cbe.last_name,
    cbe.first_name
  FROM vote, candidates_by_elections AS cbe
  WHERE vote.election_candidate_id = cbe.id
  ORDER BY cbe.election, cbe.last_name;