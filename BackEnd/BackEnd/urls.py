"""BackEnd URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.contrib import admin
from django.urls import path, re_path, include
from django.views.static import serve

from RBAC.views import user
from Stark.main import starkSite

urlpatterns = [
    path('admin/', admin.site.urls),

    path('api/account/', include("Account.urls")),

    path('api/course/', include("Course.urls")),
    path('api/free/', include("Course.urls")),
    path('api/practical/', include("Course.urls")),

    path('api/shopping/', include("Shopping.urls")),
    path('api/payment/', include("Payment.urls")),

    path('api/enroll/', include("Classroom.urls")),
    path('api/homework/', include("Classroom.urls")),
    path('api/get/', include("Classroom.urls")),
    path('api/questions/', include("Classroom.urls")),

    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),

    path('stark/', starkSite.urls),
    path('index/', user.index, name="index"),
    path('login/', user.login, name="login"),
    path('logout/', user.logout, name="logout"),
]
