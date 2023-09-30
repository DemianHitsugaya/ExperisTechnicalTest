Select distinct d.id,d.[name]as Department_Name, COUNT(p.id) as Quantity_Projects
from departments d left join employees e
on (d.id = e.department_id)
left join employees_projects ep 
on (e.id = ep.project_id)
left join projects p 
on (p.id = ep.project_id)
group by d.id,d.name
