SELECT 
    skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
1. Big Data & Distributed Processing Dominate
Top Paid Skill: PySpark ($208k) — part of the Apache Spark ecosystem, shows huge demand for distributed data processing at scale.

Databricks, Airflow, and Couchbase also reinforce this trend.

Insight: Companies value analysts who can process massive datasets across distributed systems, often in cloud environments.

2. DevOps & Version Control Tools Offer a Salary Edge
Bitbucket ($189k), GitLab ($154k), and Jenkins ($125k) are all DevOps-related tools.

Insight: Data analysts with software engineering/devops hybrid skills are commanding higher salaries.

3. AI/ML Frameworks are Highly Rewarded
Watson, DataRobot, Scikit-learn, Jupyter, Pandas, and NumPy all appear, with salaries over $140k in some cases.

Insight: Employers value data analysts who can go beyond analysis into model development and AI integration.

4. Programming Language Diversification Pays Off
Swift, Golang, and Scala — not typical data analyst languages — are high-paying.

Insight: These may reflect demand for product-facing analysts or data engineers in specific ecosystems (e.g., iOS, backend, high-performance systems).

5. Cloud and Orchestration Tools are Crucial
GCP ($122k), Kubernetes ($132k), Airflow ($126k) show that cloud-native and orchestration expertise is valuable.

Insight: Data analysts who can work in cloud environments and manage complex pipelines are in demand.

6. Open-Source & Modern Stack Tools Preferred
Tools like PostgreSQL, ElasticSearch, Linux, and Notion are well-represented.

Insight: Companies are increasingly using modern, open-source tools for cost-efficiency and flexibility.


*/