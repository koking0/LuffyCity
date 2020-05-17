from django.contrib import admin
from index import models

admin.site.register(models.Course)
admin.site.register(models.Classes)
admin.site.register(models.Student)
admin.site.register(models.Project)
admin.site.register(models.ProjectRecord)
admin.site.register(models.PaymentRecord)
admin.site.register(models.Task)
