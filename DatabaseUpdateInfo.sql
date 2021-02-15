

USE s11


SELECT * FROM DatabaseUpdateInfo dui WHERE dui.updateNumber REGEXP '^2020-' ORDER BY dui.updateNumber DESC;

