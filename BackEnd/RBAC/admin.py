from django.contrib import admin
from RBAC import models

admin.site.register(models.RbacUserInfo)
admin.site.register(models.Team)
admin.site.register(models.Department)
admin.site.register(models.Role)
admin.site.register(models.Permission)
admin.site.register(models.Menu)
admin.site.register(models.ScoreRecord)
admin.site.register(models.Attendance)
