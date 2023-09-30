Select p.title as ProjectName, (e.first_name +' '+e.last_name) as Emplyee_Assigned
from employees_projects ep 
left join employees e
on (ep.employee_id = e.id)
left join projects p on 
(p.id = ep.project_id)