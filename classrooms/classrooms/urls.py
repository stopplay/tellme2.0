"""classrooms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.conf.urls import url
from django.contrib import admin
from django.urls import include, path, re_path
from django.conf.urls.static import static
from classrooms import settings
from school.views import seeallschoolsbyquery
from django.views.static import serve 

urlpatterns = [
    path('datawizard/', include('data_wizard.urls')),
    url(r'^jet/', include('jet.urls', 'jet')),  # Django JET URLS
    url(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),
    path('admin_url/', admin.site.urls),
    url(r'^$', seeallschools),
    url('chain/', include('block.urls')),
    url('contracts/', include('contract.urls')),
    url('schools/', include('school.urls')),
    url('users/', include('school_users.urls')),
]
# if settings.DEBUG:
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += url(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_ROOT}), 

handler404 = 'school_users.views.handler404'
handler500 = 'school_users.views.handler500'