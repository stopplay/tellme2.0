from django.conf.urls import url
from rest_framework import routers
from django.urls import include, path, re_path
from . import views

# router = routers.DefaultRouter()
# router.register(r'schools', views.SchoolsViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

app_name = 'users'
urlpatterns = [
    # url('', include(router.urls)),
    url('create_user/', views.create_user),
    url('seeallusers/', views.seeallusers),
    path('delete_user/<int:user_id>/<type_of_user>', views.delete_user, name='delete_user'),
    path('set_parents/<int:student_id>/', views.set_parents, name='set_parents'),
    url('login/', views.do_login, name='login'),
    # url('seeallschools/', views.seeallschools),
    # path('update_school/<int:school_id>', views.update_school, name='update_school'),
    # path('delete_school/<int:school_id>', views.delete_school, name='delete_school'),
]