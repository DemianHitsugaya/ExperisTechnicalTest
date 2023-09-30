Select distinct d.id as DeptId,  d.[name] as Department_Name, p.id as ProjectId, p.title, p.start_date,p.end_date, p.budget
from departments d 
left join employees e
on (d.id = e.department_id)
left join employees_projects ep 
on (e.id = ep.employee_id)
left join projects p 
on (p.id = ep.project_id)
order by d.id