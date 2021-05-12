SELECT rup.name, p.login from Person p 
join rbUserProfile rup ON rup.id = p.userProfile_id 
group by p.userProfile_id 