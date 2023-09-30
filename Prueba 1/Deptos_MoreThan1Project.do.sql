Select d.id,d.[name]as Department_Name, COUNT(ep.project_id) as Quantity_Projects
from departments d left join employees e
on (d.id = e.department_id)
left join employees_projects ep 
on (e.id = ep.project_id)
group by d.id,d.name
having COUNT(ep.project_id) > 1