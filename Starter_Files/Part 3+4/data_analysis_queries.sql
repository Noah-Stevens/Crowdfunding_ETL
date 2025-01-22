--  Find and sort company crowdfunds by pledge amount
SELECT c.company_name, c.pledged, goal, backers_count, FROM campaign
ORDER BY pledged DESC;

--  Most Popular Subcategories starting with the letter "S"
SELECT sc.subcategory, SUM(c.backers_count) AS backers_total FROM campaign c
JOIN subcategory sc ON c.subcategory_id = sc.subcategory_id
WHERE sc.subcategory ILIKE "S%"
GROUP BY sc.subcategory
ORDER BY backers_total DESC;

--  Most Backed Crowdfunding Campaigns that ended in 2018
SELECT c.company_name, c.goal, c.pledged, c.outcome, c.backers_count, c.launch_date, c.end_date FROM campaign c
WHERE EXTRACT(YEAR FROM c.end_date) = 2018
ORDER BY c.backers_count DESC;

-- List First Names, Last Names, Emails from each Company Name
SELECT con.first_name, con.last_name, con.email, c.company_name FROM contacts con
JOIN campaign c ON con.contact_id = c.contact_id
ORDER BY con.last_name ASC, con.first_name ASC;
