-- kpi2
select count(*)  as TotalCustomers from customerinfo;

-- kpi3
select count(*)  as TotalPolicies from policydetails;

-- kpi4
select sum(`claim amount`) from claims;

-- kpi5
select `policy type`,avg(`coverage amount`) from policydetails
group by `Policy Type`;

-- kpi6
select `policy type`,avg(`Premium amount`) from policydetails
group by `Policy Type`;

-- kpi7
SELECT 
    COUNT(CASE WHEN `status` = 'Active' THEN 1 END) * 100.0 / COUNT(*) 
    AS ActivePolicyPercentage
FROM policydetails;

-- kpi8
select status,count(*) from policydetails
group by status;

-- kpi9
select status, count(*) from policydetails
group by Status
order by count(*) desc
limit 1;

-- kpi10
SELECT
    ROUND(
        SUM(CASE WHEN status = 'Active' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN status IN ('Lapsed', 'Terminated') THEN 1 ELSE 0 END),
        2
    ) AS ActiveInactiveRatio from policydetails;
    
-- kpi11
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        WHEN Age > 65 THEN '65+'
    END AS AgeGroup,
    COUNT(pd.`Policy ID`) AS PolicyCount
FROM customerinfo ci
JOIN policydetails pd
    ON ci.`Customer ID` = pd.`Customer ID`
GROUP BY AgeGroup
ORDER BY PolicyCount DESC
LIMIT 1;

-- kpi12
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        WHEN Age > 65 THEN '65+'
    END AS AgeGroup,
    COUNT(pd.`Policy ID`) AS PolicyCount
FROM customerinfo ci
JOIN policydetails pd
    ON ci.`Customer ID` = pd.`Customer ID`
GROUP BY AgeGroup
ORDER BY PolicyCount DESC
LIMIT 3;

-- kpi13
SELECT
    ci.Gender,
    COUNT(pd.`Policy ID`) AS PolicyCount
FROM customerinfo ci
JOIN policydetails pd
    ON ci.`Customer ID` = pd.`Customer ID`
GROUP BY ci.Gender
ORDER BY PolicyCount DESC
LIMIT 1;

-- kpi14
SELECT ABS(
    SUM(CASE WHEN ci.Gender = 'Male' THEN 1 ELSE 0 END) -
    SUM(CASE WHEN ci.Gender = 'Female' THEN 1 ELSE 0 END)
) AS GenderDifference
FROM customerinfo ci
JOIN policydetails pd
ON ci.`Customer ID` = pd.`Customer ID`;

-- kpi15
SELECT `Policy Type`, COUNT(*) AS PolicyCount
FROM policydetails
GROUP BY `Policy Type`
ORDER BY PolicyCount DESC
LIMIT 1;

-- kpi16
SELECT `Policy Type`, COUNT(*) AS PolicyCount
FROM policydetails
GROUP BY `Policy Type`
ORDER BY PolicyCount asc
LIMIT 1;

-- kpi17
SELECT ABS(
    SUM(CASE WHEN `Policy Type` = 'Health' THEN 1 ELSE 0 END) -
    SUM(CASE WHEN `Policy Type` = 'Auto' THEN 1 ELSE 0 END)
) AS HealthAutoDifference
FROM policydetails;

-- kpi18
SELECT `Policy Type`, COUNT(*) AS TotalPolicies
FROM policydetails
group by `Policy Type`;

-- kpi19
WITH YearlyPremium AS (
    SELECT
        YEAR(`Policy Start Date`) AS PolicyYear,
        AVG(`Premium Amount`) AS AvgPremium
    FROM policydetails
    GROUP BY YEAR(`Policy Start Date`)
),
PremiumGrowth AS (
    SELECT
        PolicyYear,
        AvgPremium,
        LAG(AvgPremium) OVER (ORDER BY PolicyYear) AS PreviousPremium
    FROM YearlyPremium
)
SELECT
    ROUND(
        AVG(
            (AvgPremium - PreviousPremium) / PreviousPremium
        ) * 100,
        2
    ) AS AveragePremiumGrowthRate
FROM PremiumGrowth
WHERE PreviousPremium IS NOT NULL;

-- kpi20
WITH YearlyPremium AS (
    SELECT
        YEAR(`Policy Start Date`) AS PolicyYear,
        AVG(`Premium Amount`) AS AvgPremium
    FROM policydetails
    GROUP BY YEAR(`Policy Start Date`)
),
PremiumGrowth AS (
    SELECT
        PolicyYear,
        AvgPremium,
        LAG(AvgPremium) OVER (ORDER BY PolicyYear) AS PreviousPremium
    FROM YearlyPremium
)
SELECT
    PolicyYear,
    ROUND(
        ((AvgPremium - PreviousPremium) / PreviousPremium) * 100,
        2
    ) AS PremiumGrowthRate
FROM PremiumGrowth
WHERE PreviousPremium IS NOT NULL
ORDER BY PolicyYear;

-- kpi21
WITH YearlyPremium AS (
    SELECT
        YEAR(`Policy Start Date`) AS PolicyYear,
        AVG(`Premium Amount`) AS AvgPremium
    FROM policydetails
    GROUP BY YEAR(`Policy Start Date`)
),
PremiumGrowth AS (
    SELECT
        PolicyYear,
        AvgPremium,
        LAG(AvgPremium) OVER (ORDER BY PolicyYear) AS PreviousPremium
    FROM YearlyPremium
),
GrowthRates AS (
    SELECT
        ((AvgPremium - PreviousPremium) / PreviousPremium) * 100 AS GrowthRate
    FROM PremiumGrowth
    WHERE PreviousPremium IS NOT NULL
)
SELECT
    ROUND(MAX(GrowthRate) - MIN(GrowthRate), 2) AS PremiumGrowthDifference
FROM GrowthRates;

-- kpi22
SELECT
    YEAR(`Policy End Date`) AS EndingYear,
    COUNT(`Policy ID`) AS PoliciesEnding
FROM policydetails
GROUP BY YEAR(`Policy End Date`)
order by endingyear;